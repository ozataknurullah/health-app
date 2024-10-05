import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  double? kilo;
  double? boy;
  double? vucutKitleEndeksi;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  User? _user;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        _user = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
              const SizedBox(height: 20),
              Text(
                'Kullanıcı Adı: ${_user != null ? _user!.displayName ?? "" : ""}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'E-posta: ${_user != null ? _user!.email ?? "" : ""}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Kilo (kg)',
                  prefixIcon: Icon(Icons.fitness_center),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  setState(() {
                    kilo = double.tryParse(value);
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen bir değer girin';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Boy (cm)',
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  setState(() {
                    boy = double.tryParse(value);
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen bir değer girin';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Text(
                'Vücut Kitle Endeksi: ${vucutKitleEndeksi != null ? vucutKitleEndeksi!.toStringAsFixed(2) : ""}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    calculateBMI();
                  }
                },
                child: const Text('BMI Hesapla'),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Çıkış Yap"),
                        content: const Text(
                            "Çıkış yapmak istediğinize emin misiniz?"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("İptal"),
                          ),
                          TextButton(
                            onPressed: () {
                              FirebaseAuth.instance.signOut();
                              Navigator.pushNamed(context, "/login");
                            },
                            child: const Text("Çıkış Yap"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Çıkış Yap'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void calculateBMI() {
    if (kilo != null && boy != null) {
      setState(() {
        vucutKitleEndeksi = kilo! / ((boy! / 100) * (boy! / 100));
      });
    }
  }
}
