-- INITIAL SCHEMA ONLY. Review in a test project before production.
create extension if not exists pgcrypto;

create type public.application_status as enum ('pending','under_review','approved','rejected','needs_information');
create type public.member_status as enum ('pending','approved','rejected','suspended');
create type public.donation_status as enum ('pending','verified','rejected');

create table public.aid_applications (
  id uuid primary key default gen_random_uuid(),
  applicant_name text not null,
  phone text not null,
  area text not null,
  reason text not null,
  family_size integer check (family_size is null or family_size > 0),
  cnic_encrypted text, -- Do not store raw CNIC here; use a reviewed encryption/key-management design.
  document_paths text[] not null default '{}',
  status public.application_status not null default 'pending',
  admin_notes text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.members (
  id uuid primary key default gen_random_uuid(),
  full_name text not null,
  phone text not null,
  email text,
  area text,
  member_type text not null check (member_type in ('member','volunteer')),
  status public.member_status not null default 'pending',
  created_at timestamptz not null default now()
);

create table public.donations (
  id uuid primary key default gen_random_uuid(),
  donor_name text,
  donor_contact text,
  amount numeric(12,2) not null check (amount > 0),
  currency text not null default 'PKR',
  method text not null default 'Easypaisa',
  provider_reference text,
  status public.donation_status not null default 'pending',
  receipt_number text unique,
  verified_by uuid,
  verified_at timestamptz,
  created_at timestamptz not null default now()
);

create table public.foundation_content (
  id uuid primary key default gen_random_uuid(),
  content_key text unique not null,
  title_ur text,
  body_ur text,
  title_en text,
  body_en text,
  published boolean not null default false,
  updated_at timestamptz not null default now()
);

create table public.expenses (
  id uuid primary key default gen_random_uuid(),
  description text not null,
  amount numeric(12,2) not null check (amount > 0),
  category text,
  spent_on date not null default current_date,
  receipt_path text,
  created_by uuid,
  created_at timestamptz not null default now()
);

create table public.admin_profiles (
  user_id uuid primary key references auth.users(id) on delete cascade,
  role text not null check (role in ('super_admin','admin','reviewer','finance')),
  active boolean not null default true,
  created_at timestamptz not null default now()
);

alter table public.aid_applications enable row level security;
alter table public.members enable row level security;
alter table public.donations enable row level security;
alter table public.foundation_content enable row level security;
alter table public.expenses enable row level security;
alter table public.admin_profiles enable row level security;

-- Public users cannot read private applications, donor records, expenses, or admin profiles.
-- These policies are intentionally restrictive. Add vetted server-side submission functions
-- and role-checked admin policies before connecting the app. Never expose service_role keys.
create policy "public can read published content"
on public.foundation_content for select
using (published = true);

-- No public SELECT/UPDATE/DELETE policies are created for sensitive tables.
-- Implement submissions via server-side Edge Functions or carefully tested INSERT policies.
-- Admin access should be enforced through a SECURITY DEFINER helper and role checks,
-- then tested with anon, authenticated, and each admin role before production.
