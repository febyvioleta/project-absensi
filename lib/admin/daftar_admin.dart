import 'package:flutter/material.dart';
import 'dashboard_admin.dart';
import 'add_employee_page.dart';
import 'attendance_history_page.dart';
import 'detail_admin_page.dart';

class DaftarAdmin extends StatefulWidget {
  const DaftarAdmin({super.key});

  @override
  State<DaftarAdmin> createState() => _DaftarAdminState();
}

class _DaftarAdminState extends State<DaftarAdmin> {
  List<Map<String, dynamic>> adminList = [
    {
      "name": "Feby Violeta",
      "email": "feby@gmail.com",
      "role": "SUPER ADMIN",
      "isActive": true,
    },
    {
      "name": "Rahman",
      "email": "rahman@gmail.com",
      "role": "HR ADMIN",
      "isActive": true,
    },
    {
      "name": "Aldi",
      "email": "aldi@gmail.com",
      "role": "OPERATOR",
      "isActive": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

      /// ================= DRAWER =================
      drawer: Drawer(
        child: Container(
          color: const Color(0xff4C56AF),

          child: ListView(
            padding: const EdgeInsets.all(20),

            children: [
              const SizedBox(height: 40),

              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Admin Portal",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              sidebarItem(
                context,
                Icons.dashboard,
                "Dashboard",
                const AdminDashboard(),
              ),

              sidebarItem(
                context,
                Icons.admin_panel_settings,
                "Daftar Admin",
                const DaftarAdmin(),
                isActive: true,
              ),

              sidebarItem(
                context,
                Icons.history,
                "Data Absensi",
                const AttendanceHistoryPage(),
              ),
            ],
          ),
        ),
      ),

      /// ================= APPBAR =================
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,

        title: const Text(
          "AttendancePro",
          style: TextStyle(
            color: Color(0xff6A020A),
            fontWeight: FontWeight.bold,
          ),
        ),

        iconTheme: const IconThemeData(
          color: Color(0xff6A020A),
        ),
      ),

      /// ================= BODY =================
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isMobile = constraints.maxWidth < 768;

            /// ================= MOBILE =================
            if (isMobile) {
              return ListView(
                padding: const EdgeInsets.all(16),

                children: [
                  const Text(
                    "Daftar Admin",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff6A020A),
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 50,

                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff8B0000),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),

                      onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const AddEmployeePage(),
                          ),
                        );

                        if (result != null) {
                          setState(() {
                            adminList.add({
                              "name": result["name"],
                              "email": result["email"],
                              "role": result["role"],
                              "isActive": true,
                            });
                          });
                        }
                      },

                      icon: const Icon(
                        Icons.person_add,
                        color: Colors.white,
                      ),

                      label: const Text(
                        "Tambah Admin",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  TextField(
                    decoration: InputDecoration(
                      hintText: "Cari nama admin...",

                      prefixIcon: const Icon(Icons.search),

                      filled: true,

                      fillColor: const Color(0xffF8F8F8),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  ...adminList.map((admin) {
                    return adminCard(
                      context,
                      admin["name"],
                      admin["email"],
                      admin["role"],
                      admin["isActive"],
                    );
                  }).toList(),
                ],
              );
            }

            /// ================= DESKTOP =================
            return Row(
              children: [
                /// ================= SIDEBAR =================
                Container(
                  width: 250,
                  color: const Color(0xff4C56AF),

                  child: Column(
                    children: [
                      const SizedBox(height: 30),

                      const Text(
                        "Admin Portal",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 30),

                      sidebarItem(
                        context,
                        Icons.dashboard,
                        "Dashboard",
                        const AdminDashboard(),
                      ),

                      sidebarItem(
                        context,
                        Icons.admin_panel_settings,
                        "Daftar Admin",
                        const DaftarAdmin(),
                        isActive: true,
                      ),

                      sidebarItem(
                        context,
                        Icons.history,
                        "Data Absensi",
                        const AttendanceHistoryPage(),
                      ),

                      const Spacer(),
                    ],
                  ),
                ),

                /// ================= CONTENT =================
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(24),

                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,

                          children: [
                            const Text(
                              "Daftar Admin",
                              style: TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff6A020A),
                              ),
                            ),

                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color(0xff8B0000),
                              ),

                              onPressed: () async {
                                final result =
                                    await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const AddEmployeePage(),
                                  ),
                                );

                                if (result != null) {
                                  setState(() {
                                    adminList.add({
                                      "name": result["name"],
                                      "email": result["email"],
                                      "role": result["role"],
                                      "isActive": true,
                                    });
                                  });
                                }
                              },

                              icon: const Icon(
                                Icons.person_add,
                                color: Colors.white,
                              ),

                              label: const Text(
                                "Tambah Admin",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 30),

                        TextField(
                          decoration: InputDecoration(
                            hintText: "Cari nama admin...",

                            prefixIcon: const Icon(Icons.search),

                            filled: true,
                            fillColor: Colors.white,

                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(12),

                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        Expanded(
                          child: ListView(
                            children:
                                adminList.map((admin) {
                              return adminDesktopItem(
                                context,
                                admin["name"],
                                admin["email"],
                                admin["role"],
                                admin["isActive"],
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  /// ================= SIDEBAR =================
  static Widget sidebarItem(
    BuildContext context,
    IconData icon,
    String title,
    Widget page, {
    bool isActive = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),

      decoration: BoxDecoration(
        color: isActive
            ? Colors.white.withOpacity(0.2)
            : Colors.transparent,

        borderRadius: BorderRadius.circular(12),
      ),

      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
        ),

        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            ),
          );
        },
      ),
    );
  }

  /// ================= MOBILE CARD =================
  static Widget adminCard(
    BuildContext context,
    String name,
    String email,
    String role,
    bool isActive,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),

      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailAdminPage(
              name: name,
              email: email,
              role: role,
              isActive: isActive,
            ),
          ),
        );
      },

      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(18),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
            ),
          ],
        ),

        child: Row(
          children: [
            const CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/150",
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    email,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Chip(
                    label: Text(role),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ================= DESKTOP CARD =================
  static Widget adminDesktopItem(
    BuildContext context,
    String name,
    String email,
    String role,
    bool isActive,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),

      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailAdminPage(
              name: name,
              email: email,
              role: role,
              isActive: isActive,
            ),
          ),
        );
      },

      child: Card(
        elevation: 2,
        margin: const EdgeInsets.only(bottom: 16),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),

        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Row(
            children: [
              Expanded(
                flex: 3,

                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://i.pravatar.cc/150",
                      ),
                    ),

                    const SizedBox(width: 12),

                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                flex: 3,
                child: Text(email),
              ),

              Expanded(
                flex: 2,

                child: Chip(
                  label: Text(role),
                ),
              ),

              Expanded(
                flex: 2,

                child: Chip(
                  label: Text(
                    isActive
                        ? "ACTIVE"
                        : "INACTIVE",
                  ),
                ),
              ),

              Expanded(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},

                      icon: const Icon(
                        Icons.edit,
                        color: Colors.blue,
                      ),
                    ),

                    IconButton(
                      onPressed: () {},

                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}