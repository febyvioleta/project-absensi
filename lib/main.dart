import 'package:flutter/material.dart';
import 'karyawan/dashboard_karyawan.dart';
import 'admin/dashboard_admin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isHidden = true;
  bool rememberMe = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF8F7),

      body: Stack(
        children: [
          /// BACKGROUND CIRCLE
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.indigo.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            bottom: -120,
            right: -120,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.red.withValues(alpha: 0.05),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24),

                child: Container(
                  width: 420,
                  padding: const EdgeInsets.all(30),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 15,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// LOGO
                      Container(
                        width: 120,
                        height: 120,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: Image.network(
                          "https://lh3.googleusercontent.com/aida-public/AB6AXuAZM1e0l3EeEC1WknRNiswqEFrVpDwVD_cyI1JWLwRwlvYMSNQ7WsrLlN8MT8krbo0wZNOErzZF23wgZvw-ZS7Yvau02j7s6eVlR44Cku0hIdeZdqEmHlI5bAo3ggqYFhoz3438ckpeaWM9l6Y7J5MKntQlajDwSz0jH5LYf9KF3XwKB-vo-W-zx0NpOSXz6c4lbNzT1IGEFAg_Bpat1KgjvPQRpjw5lbrdhO6NLqCPdjlgc7a_i0MGtlNvooy9alxzX9RdoTZqe8oS",
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// TITLE
                      const Text(
                        "Amerta Asa Media",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff6A020A),
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        "Silakan masuk ke akun AttendancePro Anda",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                      ),

                      const SizedBox(height: 35),

                      /// EMAIL
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "EMAIL ATAU NIK",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      TextField(
                        controller: emailController,

                        decoration: InputDecoration(
                          hintText: "Masukkan email atau NIK",

                          prefixIcon: const Icon(Icons.person),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      /// PASSWORD
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "KATA SANDI",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      TextField(
                        controller: passwordController,
                        obscureText: isHidden,

                        decoration: InputDecoration(
                          hintText: "••••••••",

                          prefixIcon: const Icon(Icons.lock),

                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isHidden = !isHidden;
                              });
                            },

                            icon: Icon(
                              isHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// REMEMBER + FORGOT
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    rememberMe = value!;
                                  });
                                },
                              ),

                              const Text("Ingat Saya"),
                            ],
                          ),

                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const DashboardKaryawan(),
                                ),
                              );
                            },

                            child: const Text(
                              "LUPA KATA SANDI?",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      /// BUTTON LOGIN
                      SizedBox(
                        width: double.infinity,
                        height: 60,

                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff6A020A),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),

                          onPressed: () {
                            /// LOGIN ADMIN
                            if (emailController.text ==
                                    "adminamertasa@media.com" &&
                                passwordController.text == "123456") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AdminDashboard(),
                                ),
                              );
                            }
                            /// LOGIN KARYAWAN
                            else if (emailController.text ==
                                    "karyawanamertasa@media.com" &&
                                passwordController.text == "123456") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const DashboardKaryawan(),
                                ),
                              );
                            }
                            /// LOGIN GAGAL
                            else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Email atau password salah"),
                                ),
                              );
                            }
                          },

                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Text(
                                "Masuk Sekarang",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(width: 10),

                              Icon(Icons.login, color: Colors.white),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      const Divider(),

                      const SizedBox(height: 20),

                      const Text(
                        "Butuh bantuan akses? Hubungi IT Support",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
