# WAHEED WELFARE FOUNDATION — ابتدائی پروجیکٹ

یہ ایک **ابتدائی سورس کوڈ پیکج** ہے، ابھی شائع شدہ یا آن لائن فعال ایپ نہیں۔ اس میں Flutter موبائل ایپ کا بنیادی ڈھانچہ، Supabase ڈیٹا بیس کی ابتدائی SQL فائل، اور ایڈمن پینل کا UI نمونہ شامل ہے۔

## تجویز کردہ ٹیکنالوجی
- موبائل ایپ: Flutter (Android + iPhone)
- بیک اینڈ/ڈیٹا بیس: Supabase (Postgres + Auth + Storage)
- ایڈمن پینل: React/Next.js یا اسی نوعیت کی محفوظ ویب ایپ؛ اس پیکج میں صرف UI نمونہ ہے
- زبانیں: اردو اور انگریزی
- رنگ: سبز اور سفید

## اہم حدود
- ایپ ابھی Supabase سے منسلک نہیں۔
- عطیات یا Easypaisa ادائیگیاں ابھی وصول نہیں ہوتیں۔
- رسید صرف تصدیق شدہ ادائیگی کے بعد جاری ہونی چاہیے؛ اس پیکج میں حقیقی ادائیگی کی تصدیق شامل نہیں۔
- ایڈمن UI صرف ڈیمو ہے، اسے عوامی ویب سائٹ پر بطور محفوظ ایڈمن پینل شائع نہ کریں۔
- اصل CNIC/شناختی کارڈ نمبر حساس معلومات ہیں۔ پروڈکشن میں ڈیٹا کم سے کم رکھیں، رسائی محدود کریں، اور رازداری کی پالیسی بنائیں۔
- رجسٹریشن مکمل ہونے تک فاؤنڈیشن کو رجسٹرڈ ظاہر نہ کریں۔

## اگلے عملی اقدامات
1. Flutter SDK انسٹال کریں اور `flutter create waheed_welfare_foundation` چلائیں۔
2. اس فولڈر کی `flutter_app/lib/main.dart` فائل کو نئے پروجیکٹ میں `lib/main.dart` کے طور پر رکھیں۔
3. Supabase پر نیا پروجیکٹ بنائیں اور `supabase/schema.sql` احتیاط سے SQL Editor میں چلائیں۔ پہلے test project استعمال کریں۔
4. Auth میں ای میل تصدیق فعال کریں، صرف مجاز ایڈمنز بنائیں، اور RLS policies کو ٹیسٹ کریں۔
5. عوامی لانچ سے پہلے backend functions، file upload validation، audit logs، privacy policy، backup اور security review مکمل کریں۔
6. Easypaisa merchant/business onboarding اور official integration کی تصدیق کے بعد ہی آن لائن ادائیگیاں فعال کریں۔

## ابھی درکار اکاؤنٹس/اجازتیں
- Google account (Firebase/Google Play Console کے لیے، اگر وہ خدمات استعمال ہوں)
- Supabase account اور project owner access
- Apple Developer account (iPhone پر App Store کے ذریعے تقسیم کے لیے)
- Google Play Console account (Google Play پر شائع کرنے کے لیے)
- Easypaisa merchant/business account یا ان کی منظور شدہ payment integration
- فاؤنڈیشن کا تصدیق شدہ رابطہ ای میل اور عوامی فون/WhatsApp
- فاؤنڈیشن کی قانونی حیثیت اور نام کے استعمال کی تصدیق

**اپنا پاس ورڈ، OTP، Easypaisa PIN یا API secret چیٹ میں نہ بھیجیں۔**
