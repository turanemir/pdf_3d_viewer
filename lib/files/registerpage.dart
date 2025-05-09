import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'package:pdf_3d_viewer/files/income_page.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _register() {
  if (_formKey.currentState!.validate()) {
    if (_selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen doğum tarihinizi seçin.')),
      );
      return;
    }

    // Kayıt başarılı mesajı
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Kayıt başarılı!')),
    );

    // Aylık gelir ekranına yönlendir
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const IncomePage()),
      
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kayıt Ol")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // İsim
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'İsim',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'İsim boş bırakılamaz' : null,
              ),
              const SizedBox(height: 20),

              // Email
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'E-posta',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value!.contains('@')
                    ? null
                    : 'Geçerli bir e-posta girin',
              ),
              const SizedBox(height: 20),

              // Şifre
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Şifre',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) =>
                    value!.length < 6 ? 'En az 6 karakter olmalı' : null,
              ),
              const SizedBox(height: 20),

              // Doğum Tarihi
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: _selectedDate == null
                          ? 'Doğum Tarihi'
                          : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                      border: const OutlineInputBorder(),
                      suffixIcon: const Icon(Icons.calendar_today),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Kayıt Butonu
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _register,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text("Kayıt Ol"),
                ),
              ),

              const SizedBox(height: 20),

              // Giriş Yap linki
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Zaten hesabın var mı?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                    child: const Text(
                      "Giriş Yap",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
