import 'package:flutter/material.dart';
import 'attendance_history_page.dart';

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

      /// ================= APPBAR =================
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,

        title: const Text(
          "Attendance Verification",
          style: TextStyle(color: primary, fontWeight: FontWeight.bold),
        ),

        iconTheme: const IconThemeData(color: primary),

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),

          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined),
          ),

          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=12"),
            ),
          ),
        ],
      ),

      /// ================= BODY =================
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            /// ================= SIDEBAR =================
            Container(
              width: 250,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: secondary,
                borderRadius: BorderRadius.circular(24),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 40, color: Colors.black),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Admin User",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    "Workforce Management",
                    style: TextStyle(color: Colors.white70),
                  ),

                  const SizedBox(height: 40),

                  sidebarButton(context, Icons.dashboard, "Dashboard", () {}),

                  const SizedBox(height: 12),

                  sidebarButton(context, Icons.people, "Daftar Admin", () {}),

                  const SizedBox(height: 12),

                  sidebarButton(context, Icons.access_time, "Attendance", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AttendanceHistoryPage(),
                      ),
                    );
                  }, isActive: true),

                  const SizedBox(height: 12),

                  sidebarButton(context, Icons.map, "Maps", () {}),

                  const SizedBox(height: 12),

                  sidebarButton(
                    context,
                    Icons.assignment,
                    "Leave Requests",
                    () {},
                  ),

                  const SizedBox(height: 12),

                  sidebarButton(context, Icons.bar_chart, "Reports", () {}),

                  const SizedBox(height: 12),

                  sidebarButton(context, Icons.settings, "Settings", () {}),
                ],
              ),
            ),

            const SizedBox(width: 24),

            /// ================= MAIN CONTENT =================
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  /// ================= HEADER =================
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(
                          "https://i.pravatar.cc/150?img=12",
                        ),
                      ),

                      const SizedBox(width: 18),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: primary,
                              ),
                            ),

                            const SizedBox(height: 6),

                            Text(
                              email,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),

                            const SizedBox(height: 8),

                            Row(
                              children: [
                                Chip(label: Text(role)),

                                const SizedBox(width: 10),

                                Chip(
                                  backgroundColor: isActive
                                      ? Colors.green.shade100
                                      : Colors.red.shade100,

                                  label: Text(
                                    isActive ? "ACTIVE" : "INACTIVE",

                                    style: TextStyle(
                                      color: isActive
                                          ? Colors.green
                                          : Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 14,
                          ),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),

                        onPressed: () {},

                        icon: const Icon(Icons.edit, color: Colors.white),

                        label: const Text(
                          "Edit Record",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  /// ================= CONTENT =================
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      /// LEFT CONTENT
                      Expanded(
                        flex: 3,

                        child: Column(
                          children: [
                            /// SELFIE CARD
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),

                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                              ),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.verified_user,
                                        color: secondary,
                                        size: 20,
                                      ),

                                      SizedBox(width: 8),

                                      Text(
                                        "Selfie Verification",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 20),

                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),

                                    child: Image.network(
                                      "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
                                      height: 350,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 24),

                            /// MAP CARD
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),

                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                              ),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  const Row(
                                    children: [
                                      Icon(Icons.location_on, color: secondary),

                                      SizedBox(width: 8),

                                      Text(
                                        "Geofence Validation",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 20),

                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),

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

                      /// RIGHT SIDEBAR
                      Expanded(
                        flex: 1,

                        child: Column(
                          children: [
                            /// TIME LOGS
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),

                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                              ),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  const Text(
                                    "Time Logs",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
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

                            const SizedBox(height: 24),

                            /// DEVICE INFO
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),

                              decoration: BoxDecoration(
                                color: secondary,
                                borderRadius: BorderRadius.circular(24),
                              ),

                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text(
                                    "DEVICE INFO",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),

                                  SizedBox(height: 14),

                                  Text(
                                    "iPhone 14 Pro",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  SizedBox(height: 4),

                                  Text(
                                    "iOS 17.1",
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
    );
  }

  static Widget detailItem(String title, String value, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),

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
    VoidCallback onTap, {
    bool isActive = false,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),

      onTap: onTap,

      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.transparent,

          borderRadius: BorderRadius.circular(14),
        ),

        child: Row(
          children: [
            Icon(
              icon,
              color: isActive ? const Color(0xff4C56AF) : Colors.white,
            ),

            const SizedBox(width: 12),

            Text(
              title,
              style: TextStyle(
                color: isActive ? const Color(0xff4C56AF) : Colors.white,

                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
