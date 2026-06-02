import 'package:flutter/material.dart';
import 'dashboard_admin.dart';
import 'attendance_data.dart';
import 'approval_izin_admin.dart';
import 'daftar_admin.dart';
import 'reports_page.dart';
class MonitoringMapsPage extends StatelessWidget {
  const MonitoringMapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile =
        MediaQuery.of(context).size.width < 900;

    return Scaffold(
      backgroundColor: const Color(0xffFFF8F7),

      drawer: isMobile
          ? Drawer(
              child: mobileSidebar(context),
            )
          : null,

      body: SafeArea(
        child: isMobile

            /// ================= MOBILE =================
            ? Column(
                children: [

                  /// TOPBAR
                  topbar(context, isMobile),

                  /// MAP
                  Expanded(
                    child: Stack(
                      children: [

                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(0),

                            child: Image.network(
                              "https://images.unsplash.com/photo-1524661135-423995f22d0b?q=80&w=1400",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Positioned(
                          top: 20,
                          right: 20,

                          child: Column(
                            children: [

                              mapButton(Icons.add),

                              const SizedBox(height: 10),

                              mapButton(Icons.remove),

                              const SizedBox(height: 10),

                              mapButton(
                                Icons.my_location,
                                isPrimary: true,
                              ),
                            ],
                          ),
                        ),

                        Positioned(
                          top: 140,
                          left: 120,

                          child: mapMarker(
                            "Ahmad",
                            Colors.green,
                            const Color(0xff6A020A),
                          ),
                        ),

                        Positioned(
                          bottom: 140,
                          right: 80,

                          child: mapMarker(
                            "Budi",
                            Colors.orange,
                            const Color(0xff4C56AF),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// EMPLOYEE LIST
                  Container(
                    height: 300,
                    padding: const EdgeInsets.all(16),

                    decoration: const BoxDecoration(
                      color: Colors.white,

                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),

                    child: ListView(
                      children: [

                        const Text(
                          "Nearby Employees",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 20),

                        employeeCard(
                          "Ahmad Subarjo",
                          "Sudirman Area",
                          "Checked in 08:42",
                          "PRESENT",
                          Colors.green,
                        ),

                        employeeCard(
                          "Budi Raharjo",
                          "Menteng Area",
                          "Checked in 09:15",
                          "LATE",
                          Colors.orange,
                        ),

                        employeeCard(
                          "Dodi",
                          "Kuningan Area",
                          "No check in",
                          "ABSENT",
                          Colors.red,
                        ),
                      ],
                    ),
                  ),
                ],
              )

            /// ================= DESKTOP =================
            : Row(
                children: [

                  /// SIDEBAR
                  Container(
                    width: 260,
                    color: const Color(0xff4C56AF),

                    child: desktopSidebar(context),
                  ),

                  /// MAIN CONTENT
                  Expanded(
                    child: Column(
                      children: [

                        topbar(context, isMobile),

                        Expanded(
                          child: Row(
                            children: [

                              /// MAP
                              Expanded(
                                child: Stack(
                                  children: [

                                    Positioned.fill(
                                      child: Image.network(
                                        "https://images.unsplash.com/photo-1524661135-423995f22d0b?q=80&w=1400",
                                        fit: BoxFit.cover,
                                      ),
                                    ),

                                    Positioned(
                                      top: 20,
                                      right: 20,

                                      child: Column(
                                        children: [

                                          mapButton(Icons.add),

                                          const SizedBox(height: 10),

                                          mapButton(Icons.remove),

                                          const SizedBox(height: 20),

                                          mapButton(
                                            Icons.my_location,
                                            isPrimary: true,
                                          ),
                                        ],
                                      ),
                                    ),

                                    Positioned(
                                      top: 180,
                                      left: 260,

                                      child: mapMarker(
                                        "Ahmad",
                                        Colors.green,
                                        const Color(0xff6A020A),
                                      ),
                                    ),

                                    Positioned(
                                      bottom: 180,
                                      right: 200,

                                      child: mapMarker(
                                        "Budi",
                                        Colors.orange,
                                        const Color(0xff4C56AF),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              /// RIGHT SIDEBAR
                              Container(
                                width: 350,
                                color: Colors.white,

                                child: Column(
                                  children: [

                                    Container(
                                      padding:
                                          const EdgeInsets.all(20),

                                      child: const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,

                                        children: [

                                          Text(
                                            "Nearby Employees",
                                            style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          SizedBox(height: 5),

                                          Text(
                                            "Central Jakarta",
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Expanded(
                                      child: ListView(
                                        padding:
                                            const EdgeInsets.all(16),

                                        children: [

                                          employeeCard(
                                            "Ahmad Subarjo",
                                            "Sudirman Area",
                                            "Checked in 08:42",
                                            "PRESENT",
                                            Colors.green,
                                          ),

                                          employeeCard(
                                            "Budi Raharjo",
                                            "Menteng Area",
                                            "Checked in 09:15",
                                            "LATE",
                                            Colors.orange,
                                          ),

                                          employeeCard(
                                            "Siti Nurhaliza",
                                            "Tanah Abang",
                                            "Checked in 08:30",
                                            "PRESENT",
                                            Colors.green,
                                          ),

                                          employeeCard(
                                            "Dodi",
                                            "Kuningan Area",
                                            "No check in",
                                            "ABSENT",
                                            Colors.red,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  /// ================= TOPBAR =================

  static Widget topbar(
    BuildContext context,
    bool isMobile,
  ) {
    return Container(
      height: 70,

      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),

      decoration: const BoxDecoration(
        color: Colors.white,
      ),

      child: Row(
        children: [

          if (isMobile)
            Builder(
              builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },

                icon: const Icon(Icons.menu),
              ),
            ),

          const Text(
            "AttendancePro",
            style: TextStyle(
              color: Color(0xff6A020A),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Spacer(),

          const CircleAvatar(
            backgroundImage: NetworkImage(
              "https://i.pravatar.cc/300",
            ),
          ),
        ],
      ),
    );
  }

  /// ================= SIDEBAR DESKTOP =================

 static Widget desktopSidebar(BuildContext context) {
  return Column(
    children: [
      const SizedBox(height: 40),

      const Text(
        "Admin Portal",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
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
        Icons.group,
        "Daftar Admin",
        const DaftarAdmin(),
      ),

      sidebarItem(
        context,
        Icons.access_time,
        "Attendance",
        const AttendanceDataPage(),
      ),

      sidebarItem(
        context,
        Icons.map,
        "Monitoring Maps",
        const MonitoringMapsPage(),
        isActive: true,
      ),

      sidebarItem(
        context,
        Icons.assignment,
        "Leave Requests",
        const LeaveApprovalPage(),
      ),

      sidebarItem(
        context,
        Icons.analytics,
        "Reports",
        const ReportsPage(),
      ),

      sidebarItem(
        context,
        Icons.settings,
        "Settings",
        const AdminDashboard(),
      ),
    ],
  );
}
  

  /// ================= SIDEBAR MOBILE =================

  static Widget mobileSidebar(
    BuildContext context,
  ) {
    return Container(
      color: const Color(0xff4C56AF),

      child: ListView(
        padding: const EdgeInsets.all(20),

        children: [

          const SizedBox(height: 40),

          const Text(
            "Admin Portal",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
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
            Icons.group,
            "Employees",
            const AdminDashboard(),
          ),

          sidebarItem(
            context,
            Icons.access_time,
            "Attendance",
            const AdminDashboard(),
          ),

          sidebarItem(
            context,
            Icons.map,
            "Monitoring Maps",
            const MonitoringMapsPage(),
            isActive: true,
          ),

          sidebarItem(
            context,
            Icons.analytics,
            "Reports",
            const AdminDashboard(),
          ),

          sidebarItem(
            context,
            Icons.settings,
            "Settings",
            const AdminDashboard(),
          ),
        ],
      ),
    );
  }

  /// ================= SIDEBAR ITEM =================

  static Widget sidebarItem(
    BuildContext context,
    IconData icon,
    String title,
    Widget page, {
    bool isActive = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 6,
      ),

      decoration: BoxDecoration(
        color: isActive
            ? Colors.white
            : Colors.transparent,

        borderRadius: BorderRadius.circular(14),
      ),

      child: ListTile(
        leading: Icon(
          icon,
          color: isActive
              ? const Color(0xff4C56AF)
              : Colors.white,
        ),

        title: Text(
          title,
          style: TextStyle(
            color: isActive
                ? const Color(0xff4C56AF)
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

  /// ================= MAP BUTTON =================

  static Widget mapButton(
    IconData icon, {
    bool isPrimary = false,
  }) {
    return Container(
      width: 50,
      height: 50,

      decoration: BoxDecoration(
        color: isPrimary
            ? const Color(0xff6A020A)
            : Colors.white,

        borderRadius: BorderRadius.circular(14),

        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black12,
          ),
        ],
      ),

      child: Icon(
        icon,
        color: isPrimary
            ? Colors.white
            : const Color(0xff4C56AF),
      ),
    );
  }

  /// ================= MARKER =================

  static Widget mapMarker(
    String name,
    Color statusColor,
    Color bgColor,
  ) {
    return Column(
      children: [

        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 8,
          ),

          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(30),
          ),

          child: Row(
            children: [

              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(width: 8),

              Container(
                width: 10,
                height: 10,

                decoration: BoxDecoration(
                  color: statusColor,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),

        const Icon(
          Icons.location_on,
          color: Color(0xff6A020A),
          size: 40,
        ),
      ],
    );
  }

  /// ================= EMPLOYEE CARD =================

  static Widget employeeCard(
    String name,
    String location,
    String time,
    String status,
    Color statusColor,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(20),

        border: Border.all(
          color: const Color(0xffDFBFBC),
        ),
      ),

      child: Row(
        children: [

          const CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(
              "https://i.pravatar.cc/302",
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                  children: [

                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    Container(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),

                      decoration: BoxDecoration(
                        color:
                            statusColor.withOpacity(0.15),

                        borderRadius:
                            BorderRadius.circular(20),
                      ),

                      child: Text(
                        status,
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                Text(
                  location,
                  style: const TextStyle(
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}