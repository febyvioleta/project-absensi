import 'package:flutter/material.dart';
import 'attendance_history_page.dart';
import 'dashboard_admin.dart';
import 'daftar_admin.dart';

class DetailAdminPage extends StatelessWidget {
  final String name;
  final String email;
  final String role;
  final bool isActive;

  const DetailAdminPage({
    super.key,
    required this.name,
    required this.email,
    required this.role,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    const Color primary = Color(0xff6A020A);
    const Color secondary = Color(0xff4C56AF);
    const Color background = Color(0xffF5F5F5);

    return Scaffold(
      backgroundColor: background,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,

        title: const Text(
          "Attendance Verification",
          style: TextStyle(
            color: primary,
            fontWeight: FontWeight.bold,
          ),
        ),

        iconTheme: const IconThemeData(
          color: primary,
        ),
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {

          bool isMobile = constraints.maxWidth < 768;

          /// ================= MOBILE =================
          if (isMobile) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  /// HEADER
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Column(
                      children: [

                        const CircleAvatar(
                          radius: 45,
                          backgroundImage: NetworkImage(
                            "https://i.pravatar.cc/150?img=12",
                          ),
                        ),

                        const SizedBox(height: 16),

                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: primary,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          email,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),

                        const SizedBox(height: 16),

                        Wrap(
                          spacing: 10,
                          children: [

                            Chip(
                              label: Text(role),
                            ),

                            Chip(
                              backgroundColor: isActive
                                  ? Colors.green.shade100
                                  : Colors.red.shade100,

                              label: Text(
                                isActive
                                    ? "ACTIVE"
                                    : "INACTIVE",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// SELFIE
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        const Text(
                          "Selfie Verification",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 16),

                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(16),

                          child: Image.network(
                            "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
                            height: 220,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// TIME LOG
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        const Text(
                          "Time Logs",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 20),

                        detailItem(
                          "CHECK-IN",
                          "08:32 AM",
                          Colors.red,
                        ),

                        const SizedBox(height: 20),

                        detailItem(
                          "CHECK-OUT",
                          "05:41 PM",
                          secondary,
                        ),

                        const SizedBox(height: 20),

                        detailItem(
                          "TOTAL DURATION",
                          "09h 08m",
                          primary,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// MAP
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        const Text(
                          "Geofence Validation",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 16),

                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(16),

                          child: Image.network(
                            "https://images.unsplash.com/photo-1524661135-423995f22d0b",
                            height: 220,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }

          /// ================= DESKTOP =================
          return Row(
            children: [

              /// SIDEBAR
              Container(
                width: 250,
                color: secondary,

                child: Column(
                  children: [

                    const SizedBox(height: 30),

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
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 30),

                    sidebarButton(
                      context,
                      Icons.dashboard,
                      "Dashboard",
                      const AdminDashboard(),
                    ),

                    sidebarButton(
                      context,
                      Icons.people,
                      "Daftar Admin",
                      const DaftarAdmin(),
                    ),

                    sidebarButton(
                      context,
                      Icons.history,
                      "Attendance",
                      const AttendanceHistoryPage(),
                      isActive: true,
                    ),
                  ],
                ),
              ),

              /// CONTENT
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      /// HEADER
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(24),
                        ),

                        child: Row(
                          children: [

                            const CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(
                                "https://i.pravatar.cc/150?img=12",
                              ),
                            ),

                            const SizedBox(width: 20),

                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,

                                children: [

                                  Text(
                                    name,
                                    style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight:
                                          FontWeight.bold,
                                      color: primary,
                                    ),
                                  ),

                                  const SizedBox(height: 8),

                                  Text(email),

                                  const SizedBox(height: 12),

                                  Row(
                                    children: [

                                      Chip(
                                        label: Text(role),
                                      ),

                                      const SizedBox(width: 10),

                                      Chip(
                                        label: Text(
                                          isActive
                                              ? "ACTIVE"
                                              : "INACTIVE",
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      Row(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [

                          /// LEFT
                          Expanded(
                            flex: 3,

                            child: Column(
                              children: [

                                Container(
                                  width: double.infinity,
                                  padding:
                                      const EdgeInsets.all(20),

                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.circular(
                                      24,
                                    ),
                                  ),

                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [

                                      const Text(
                                        "Selfie Verification",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight:
                                              FontWeight.bold,
                                        ),
                                      ),

                                      const SizedBox(height: 20),

                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(
                                          20,
                                        ),

                                        child: Image.network(
                                          "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
                                          height: 320,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 24),

                                Container(
                                  width: double.infinity,
                                  padding:
                                      const EdgeInsets.all(20),

                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.circular(
                                      24,
                                    ),
                                  ),

                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [

                                      const Text(
                                        "Geofence Validation",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight:
                                              FontWeight.bold,
                                        ),
                                      ),

                                      const SizedBox(height: 20),

                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(
                                          20,
                                        ),

                                        child: Image.network(
                                          "https://images.unsplash.com/photo-1524661135-423995f22d0b",
                                          height: 280,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 24),

                          /// RIGHT
                          Expanded(
                            flex: 1,

                            child: Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.all(20),

                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(
                                  24,
                                ),
                              ),

                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,

                                children: [

                                  const Text(
                                    "Time Logs",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight:
                                          FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 20),

                                  detailItem(
                                    "CHECK-IN",
                                    "08:32 AM",
                                    Colors.red,
                                  ),

                                  const SizedBox(height: 20),

                                  detailItem(
                                    "CHECK-OUT",
                                    "05:41 PM",
                                    secondary,
                                  ),

                                  const SizedBox(height: 20),

                                  detailItem(
                                    "TOTAL DURATION",
                                    "09h 08m",
                                    primary,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  static Widget detailItem(
    String title,
    String value,
    Color color,
  ) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [

        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),

        const SizedBox(height: 6),

        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  static Widget sidebarButton(
    BuildContext context,
    IconData icon,
    String title,
    Widget page, {
    bool isActive = false,
  }) {

    return InkWell(
      borderRadius:
          BorderRadius.circular(14),

      onTap: () {

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      },

      child: Container(
        width: double.infinity,

        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),

        decoration: BoxDecoration(
          color: isActive
              ? Colors.white
              : Colors.transparent,

          borderRadius:
              BorderRadius.circular(14),
        ),

        child: Row(
          children: [

            Icon(
              icon,
              color: isActive
                  ? const Color(0xff4C56AF)
                  : Colors.white,
            ),

            const SizedBox(width: 12),

            Text(
              title,
              style: TextStyle(
                color: isActive
                    ? const Color(0xff4C56AF)
                    : Colors.white,

                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}