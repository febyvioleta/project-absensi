import 'package:flutter/material.dart';
import 'daftar_admin.dart';
import 'monitoring_maps_admin.dart';
import 'approval_izin_admin.dart';
import 'attendance_data.dart';
import 'laporan_absensi_admin.dart';
void main() {
  runApp(const AttendanceApp());
}

class AttendanceApp extends StatelessWidget {
  const AttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AttendancePro',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const AdminDashboard(),
    );
  }
}

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  static const Color primaryColor = Color(0xff6A020A);
  static const Color secondaryColor = Color(0xff4c56af);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF8F7),

      drawer: Drawer(
        child: Container(
          color: secondaryColor,

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
                "Admin User",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Text(
                "Workforce Management",
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),

              const SizedBox(height: 40),

              /// DASHBOARD
              menuItem(
                context,
                Icons.dashboard,
                "Dashboard",
                const AdminDashboard(),
                isActive: true,
              ),

              /// DAFTAR ADMIN
              menuItem(
                context,
                Icons.admin_panel_settings,
                "Daftar Admin",
                const DaftarAdmin(),
              ),

              /// ATTENDANCE
              menuItem(
                context,
                Icons.access_time,
                "Attendance",
                const AttendanceDataPage(),
              ),

              /// MAPS
              menuItem(
              context,
              Icons.map,
               "Monitoring Maps",
             const MonitoringMapsPage(),
                 ),

              /// LEAVE REQUEST
              menuItem(
                context,
                Icons.assignment,
                "Leave Requests",
                const LeaveApprovalPage(),
              ),

              /// REPORTS
              menuItem(
              context,
              Icons.bar_chart,
              "Reports",
              const ReportsPage(),
                ),
              /// SETTINGS
              menuItem(
                context,
                Icons.settings,
                "Settings",
                const AdminDashboard(),
              ),
            ],
          ),
        ),
      ),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,

        title: const Text(
          "Overview Dashboard",
          style: TextStyle(color: Colors.black),
        ),

        iconTheme: const IconThemeData(
          color: Colors.black,
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),

          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            /// Statistik Cards
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,

              crossAxisSpacing: 16,
              mainAxisSpacing: 16,

              physics: const NeverScrollableScrollPhysics(),

              children: const [
                StatsCard(
                  title: "Total Karyawan",
                  value: "1,248",
                  icon: Icons.group,
                  color: Colors.blue,
                ),

                StatsCard(
                  title: "Hadir Hari Ini",
                  value: "1,102",
                  icon: Icons.check_circle,
                  color: Colors.green,
                ),

                StatsCard(
                  title: "Terlambat",
                  value: "42",
                  icon: Icons.alarm,
                  color: Colors.orange,
                ),

                StatsCard(
                  title: "Izin / Sakit",
                  value: "14",
                  icon: Icons.assignment_late,
                  color: Colors.red,
                ),
              ],
            ),

            const SizedBox(height: 30),

            /// Chart
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(20),

                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.grey.shade300,
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: const [
                  Text(
                    "Tren Absensi Mingguan",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20),

                  SizedBox(
                    height: 200,

                    child: Center(
                      child: Text(
                        "Chart Attendance Here",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// Aktivitas Terbaru
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(20),

                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.grey.shade300,
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const Text(
                    "Aktivitas Terbaru",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  activityItem(
                    "Joko Susanto",
                    "Check-in at Head Office",
                    "07:58 AM",
                    Colors.green,
                  ),

                  activityItem(
                    "Anita Mayasari",
                    "Check-in at Branch C",
                    "08:15 AM",
                    Colors.orange,
                  ),

                  activityItem(
                    "Rina Wijaya",
                    "Applied Leave Request",
                    "Yesterday",
                    Colors.red,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// TABLE
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),

              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,

                child: DataTable(
                  columns: const [
                    DataColumn(
                      label: Text("Employee"),
                    ),

                    DataColumn(
                      label: Text("Department"),
                    ),

                    DataColumn(
                      label: Text("Time In"),
                    ),

                    DataColumn(
                      label: Text("Status"),
                    ),
                  ],

                  rows: const [
                    DataRow(cells: [
                      DataCell(Text("Joko Susanto")),
                      DataCell(Text("Operations")),
                      DataCell(Text("07:58")),
                      DataCell(Text("Present")),
                    ]),

                    DataRow(cells: [
                      DataCell(Text("Anita")),
                      DataCell(Text("Marketing")),
                      DataCell(Text("08:15")),
                      DataCell(Text("Late")),
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// MENU SIDEBAR
  static Widget menuItem(
    BuildContext context,
    IconData icon,
    String title,
    Widget page, {
    bool isActive = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),

      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),

      child: ListTile(
        leading: Icon(
          icon,
          color: isActive
              ? secondaryColor
              : Colors.white,
        ),

        title: Text(
          title,
          style: TextStyle(
            color: isActive
                ? secondaryColor
                : Colors.white,

            fontWeight: FontWeight.bold,
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

  static Widget activityItem(
    String name,
    String subtitle,
    String time,
    Color color,
  ) {
    return ListTile(
      contentPadding: EdgeInsets.zero,

      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.2),

        child: const Icon(Icons.person),
      ),

      title: Text(name),

      subtitle: Text(subtitle),

      trailing: Text(time),
    );
  }
}

class StatsCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const StatsCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(20),

        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.grey.shade300,
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.2),

            child: Icon(
              icon,
              color: color,
            ),
          ),

          const Spacer(),

          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            value,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}