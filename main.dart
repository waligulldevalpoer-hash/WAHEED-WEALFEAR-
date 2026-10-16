import 'package:flutter/material.dart';

void main() => runApp(const WaheedWelfareApp());

class WaheedWelfareApp extends StatefulWidget {
  const WaheedWelfareApp({super.key});
  @override
  State<WaheedWelfareApp> createState() => _WaheedWelfareAppState();
}

class _WaheedWelfareAppState extends State<WaheedWelfareApp> {
  bool urdu = true;
  int tab = 0;

  String t(String ur, String en) => urdu ? ur : en;

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF168344);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WAHEED WELFARE FOUNDATION',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: green),
        scaffoldBackgroundColor: const Color(0xFFF7FAF7),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: green, foregroundColor: Colors.white,
        ),
      ),
      home: Directionality(
        textDirection: urdu ? TextDirection.rtl : TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('WAHEED WELFARE FOUNDATION',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            actions: [
              TextButton(
                onPressed: () => setState(() => urdu = !urdu),
                child: Text(urdu ? 'English' : 'اردو',
                  style: const TextStyle(color: Colors.white)),
              ),
            ],
          ),
          body: IndexedStack(index: tab, children: [
            _home(green),
            _aidForm(green),
            _membership(green),
            _contact(green),
          ]),
          bottomNavigationBar: NavigationBar(
            selectedIndex: tab,
            onDestinationSelected: (v) => setState(() => tab = v),
            destinations: [
              NavigationDestination(icon: const Icon(Icons.home_outlined),
                label: t('ہوم', 'Home')),
              NavigationDestination(icon: const Icon(Icons.volunteer_activism),
                label: t('امداد', 'Aid')),
              NavigationDestination(icon: const Icon(Icons.groups_outlined),
                label: t('ممبرشپ', 'Membership')),
              NavigationDestination(icon: const Icon(Icons.contact_phone_outlined),
                label: t('رابطہ', 'Contact')),
            ],
          ),
        ),
      ),
    );
  }

  Widget _home(Color green) => ListView(
    padding: const EdgeInsets.all(18),
    children: [
      Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: green, borderRadius: BorderRadius.circular(22)),
        child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(Icons.volunteer_activism, color: Colors.white, size: 42),
          SizedBox(height: 12),
          Text('WAHEED WELFARE FOUNDATION',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
          SizedBox(height: 8),
          Text('AP AK DALO', style: TextStyle(color: Colors.white, fontSize: 16)),
          SizedBox(height: 8),
          Text('Lakki Marwat, Pakistan', style: TextStyle(color: Colors.white70)),
        ]),
      ),
      const SizedBox(height: 18),
      Text(t('ہمارا مقصد', 'Our Mission'),
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      Text(t(
        'اپنے علاقے میں غریب خاندانوں، یتیم بچوں، طلبہ، مریضوں، بیواؤں اور دیگر ضرورت مند افراد کی مدد کرنا۔',
        'To support low-income families, orphaned children, students, patients, widows and others in need in our community.')),
      const SizedBox(height: 18),
      Text(t('ہمارے پروگرام', 'Our Programs'),
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      for (final item in [
        [t('غریب خاندانوں کا راشن', 'Food assistance'), Icons.shopping_basket_outlined],
        [t('یتیم بچوں کی کفالت', 'Support for orphans'), Icons.child_care],
        [t('غریب طلبہ کی تعلیم', 'Student education support'), Icons.school_outlined],
        [t('مریضوں کے علاج میں مدد', 'Medical assistance'), Icons.medical_services_outlined],
        [t('بیواؤں اور بے روزگار افراد کی مدد', 'Support for widows and unemployed people'), Icons.people_outline],
        [t('قدرتی آفات میں امداد', 'Disaster relief'), Icons.health_and_safety_outlined],
      ])
        Card(child: ListTile(leading: Icon(item[1] as IconData, color: green),
          title: Text(item[0] as String))),
      const SizedBox(height: 12),
      Card(color: Colors.amber.shade50, child: Padding(
        padding: const EdgeInsets.all(14),
        child: Text(t(
          'رجسٹریشن کا عمل جاری ہے۔ عطیات کی آن لائن ادائیگی جلد دستیاب ہوگی۔',
          'Registration is in progress. Online donations will be available after payment setup.')))),
    ],
  );

  Widget _aidForm(Color green) {
    final name = TextEditingController();
    final phone = TextEditingController();
    final area = TextEditingController();
    final reason = TextEditingController();
    final family = TextEditingController();
    final cnic = TextEditingController();
    return ListView(padding: const EdgeInsets.all(18), children: [
      Text(t('امداد کی درخواست', 'Request Assistance'),
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      Text(t('یہ ڈیمو فارم ہے؛ ابھی ڈیٹا سرور پر جمع نہیں ہوتا۔',
        'Demo form only; submissions are not sent to a server yet.'),
        style: TextStyle(color: Colors.orange.shade900)),
      const SizedBox(height: 12),
      _field(name, t('پورا نام', 'Full name')),
      _field(phone, t('موبائل نمبر', 'Mobile number'), keyboard: TextInputType.phone),
      _field(area, t('شہر / علاقہ', 'City / area')),
      _field(reason, t('امداد کی وجہ', 'Reason for assistance'), lines: 3),
      _field(family, t('خاندان کے افراد کی تعداد', 'Number of family members'), keyboard: TextInputType.number),
      _field(cnic, t('شناختی کارڈ نمبر (صرف اگر ضروری ہو)', 'CNIC (only if necessary)')),
      const SizedBox(height: 12),
      FilledButton.icon(
        onPressed: () => showDialog(context: context, builder: (_) => AlertDialog(
          title: Text(t('ڈیمو فارم', 'Demo form')),
          content: Text(t('فارم ابھی جمع نہیں ہوا۔ بیک اینڈ منسلک ہونے کے بعد یہ سہولت فعال ہوگی۔',
            'The form was not submitted. It will work after backend integration.')),
          actions: [TextButton(onPressed: () => Navigator.pop(context),
            child: Text(t('ٹھیک ہے', 'OK')))],
        )),
        icon: const Icon(Icons.send), label: Text(t('درخواست جمع کریں', 'Submit request')),
      ),
    ]);
  }

  Widget _membership(Color green) => ListView(
    padding: const EdgeInsets.all(18),
    children: [
      Text(t('ممبرشپ اور رضاکار', 'Membership & Volunteers'),
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      Text(t('ممبرشپ مفت ہے۔ تمام درخواستیں ایڈمن کی منظوری سے مشروط ہوں گی۔',
        'Membership is free. All applications require admin approval.')),
      const SizedBox(height: 16),
      _infoTile(Icons.person_add_alt_1, t('ممبر بنیں', 'Become a member'), green),
      _infoTile(Icons.volunteer_activism, t('رضاکار بنیں', 'Become a volunteer'), green),
      const SizedBox(height: 12),
      Text(t('رجسٹریشن فارم بیک اینڈ منسلک ہونے کے بعد فعال ہوگا۔',
        'Registration forms will be enabled after backend integration.')),
    ],
  );

  Widget _contact(Color green) => ListView(
    padding: const EdgeInsets.all(18),
    children: [
      Text(t('رابطہ کریں', 'Contact us'),
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      const SizedBox(height: 12),
      _infoTile(Icons.person_outline, 'Waheed Ullah — Founder / Chairman', green),
      _infoTile(Icons.location_on_outlined, 'Lakki Marwat, Pakistan', green),
      _infoTile(Icons.phone_outlined, '03907512621', green),
      _infoTile(Icons.chat_outlined, 'WhatsApp: 03354570040', green),
      _infoTile(Icons.email_outlined, 'waheedwealfearfoundation@gmail.com', green),
      const SizedBox(height: 12),
      Text(t('دفتر بعد میں قائم کیا جائے گا۔', 'Office to be established later.')),
    ],
  );

  Widget _field(TextEditingController controller, String label,
      {TextInputType keyboard = TextInputType.text, int lines = 1}) =>
    Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller, keyboardType: keyboard, maxLines: lines,
        decoration: InputDecoration(labelText: label, border: const OutlineInputBorder(),
          filled: true, fillColor: Colors.white),
      ),
    );

  Widget _infoTile(IconData icon, String label, Color green) => Card(
    child: ListTile(leading: Icon(icon, color: green), title: Text(label)),
  );
}
