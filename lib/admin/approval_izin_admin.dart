import 'package:flutter/material.dart';
import 'dashboard_admin.dart';
import 'daftar_admin.dart';
import 'monitoring_maps_admin.dart';
import 'attendance_data.dart';

class LeaveApprovalPage extends StatelessWidget {
  const LeaveApprovalPage({super.key});

  static const Color primaryColor = Color(0xFF6A020A);
  static const Color secondaryColor = Color(0xFF4C56AF);
  static const Color backgroundColor = Color(0xFFFFF8F7);

  @override
  Widget build(BuildContext context) {
    final bool isMobile =
        MediaQuery.of(context).size.width < 900;

    return Scaffold(
      backgroundColor: backgroundColor,

      drawer: isMobile
          ? Drawer(
              child: _buildSidebar(context),
            )
          : null,

      body: SafeArea(
        child: Row(
          children: [
            /// ================= SIDEBAR DESKTOP =================
            if (!isMobile) _buildSidebar(context),

            /// ================= MAIN CONTENT =================
            Expanded(
              child: Column(
                children: [
                  /// ================= TOPBAR =================
                  Container(
                    height: 70,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),

                    decoration: const BoxDecoration(
                      color: Colors.white,

                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFFE0E0E0),
                        ),
                      ),
                    ),

                    child: Row(
                      children: [
                        /// MOBILE MENU
                        if (isMobile)
                          Builder(
                            builder: (context) => IconButton(
                              icon: const Icon(Icons.menu),

                              onPressed: () {
                                Scaffold.of(context)
                                    .openDrawer();
                              },
                            ),
                          ),

                        const Text(
                          "AttendancePro",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),

                        const Spacer(),

                        /// SEARCH DESKTOP ONLY
                        if (!isMobile)
                          Container(
                            width: 250,
                            height: 42,

                            padding:
                                const EdgeInsets.symmetric(
                              horizontal: 12,
                            ),

                            decoration: BoxDecoration(
                              color: const Color(0xFFF5F5F5),

                              borderRadius:
                                  BorderRadius.circular(30),
                            ),

                            child: const Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),

                                SizedBox(width: 10),

                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText:
                                          "Search requests...",
                                      border:
                                          InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        const SizedBox(width: 10),

                        IconButton(
                          onPressed: () {},

                          icon: const Icon(
                            Icons.notifications,
                          ),
                        ),

                        const CircleAvatar(
                          radius: 20,
                          backgroundColor:
                              Colors.deepPurpleAccent,
                        ),
                      ],
                    ),
                  ),

                  /// ================= CONTENT =================
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(20),

                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [
                          Text(
                            "Pending Leave Approvals",
                            style: TextStyle(
                              fontSize:
                                  isMobile ? 22 : 30,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          const Text(
                            "Manage employee time-off requests with transparency and efficiency.",

                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),

                          const SizedBox(height: 24),

                          /// ================= LEAVE CARDS =================
                          Wrap(
                            spacing: 20,
                            runSpacing: 20,

                            children: [
                              _leaveCard(
                                isMobile: isMobile,
                                name: "Sarah Johnson",
                                role:
                                    "Senior Project Manager",
                                type: "Emergency",
                                typeColor: Colors.red,
                                dates:
                                    "Oct 24 - Oct 26, 2023",

                                desc:
                                    "Family medical emergency requiring immediate attention.",
                              ),

                              _leaveCard(
                                isMobile: isMobile,
                                name: "David Chen",
                                role: "Lead Developer",
                                type: "Annual",
                                typeColor: Colors.blue,
                                dates:
                                    "Nov 10 - Nov 17, 2023",

                                desc:
                                    "Requesting annual leave for vacation.",
                              ),

                              _leaveCard(
                                isMobile: isMobile,
                                name:
                                    "Elena Rodriguez",
                                role:
                                    "HR Coordinator",
                                type: "Sick",
                                typeColor:
                                    Colors.orange,
                                dates: "Oct 23, 2023",

                                desc:
                                    "Feeling unwell and unable to perform duties.",
                              ),
                            ],
                          ),

                          const SizedBox(height: 40),

                          /// ================= TABLE =================
                          Container(
                            width: double.infinity,

                            decoration: BoxDecoration(
                              color: Colors.white,

                              borderRadius:
                                  BorderRadius.circular(
                                16,
                              ),

                              border: Border.all(
                                color:
                                    Colors.grey.shade300,
                              ),
                            ),

                            child: SingleChildScrollView(
                              scrollDirection:
                                  Axis.horizontal,

                              child: DataTable(
                                columnSpacing: 40,

                                columns: const [
                                  DataColumn(
                                    label:
                                        Text("Employee"),
                                  ),

                                  DataColumn(
                                    label:
                                        Text("Type"),
                                  ),

                                  DataColumn(
                                    label:
                                        Text("Dates"),
                                  ),

                                  DataColumn(
                                    label:
                                        Text("Status"),
                                  ),
                                ],

                                rows: [
                                  _tableRow(
                                    "Marcus Wright",
                                    "Annual Leave",
                                    "Oct 15 - Oct 20",
                                    "Approved",
                                    Colors.green,
                                  ),

                                  _tableRow(
                                    "Sanya Khan",
                                    "Sick Leave",
                                    "Oct 18",
                                    "Rejected",
                                    Colors.red,
                                  ),

                                  _tableRow(
                                    "James Potter",
                                    "Emergency",
                                    "Oct 05",
                                    "Approved",
                                    Colors.green,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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

  /// ================= SIDEBAR =================

  static Widget _buildSidebar(BuildContext context) {
    return Container(
      width: 260,
      color: secondaryColor,

      child: ListView(
        padding: const EdgeInsets.all(20),

        children: [
          const SizedBox(height: 40),

          const Text(
            "Admin Portal",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          const Text(
            "Workforce Management",
            style: TextStyle(
              color: Colors.white70,
            ),
          ),

          const SizedBox(height: 30),

          _navItem(
            context,
            Icons.dashboard,
            "Dashboard",
            const AdminDashboard(),
          ),

          _navItem(
            context,
            Icons.group,
            "Employees",
            const DaftarAdmin(),
          ),

          _navItem(
            context,
            Icons.access_time,
            "Attendance",
            const AttendanceDataPage(),
          ),

          _navItem(
            context,
            Icons.map,
            "Monitoring Maps",
            const MonitoringMapsPage(),
          ),

          _activeNavItem(
            Icons.assignment,
            "Leave Requests",
          ),

          _navItem(
            context,
            Icons.bar_chart,
            "Reports",
            const AdminDashboard(),
          ),

          _navItem(
            context,
            Icons.settings,
            "Settings",
            const AdminDashboard(),
          ),
        ],
      ),
    );
  }

  /// ================= NAV ITEM =================

  static Widget _navItem(
    BuildContext context,
    IconData icon,
    String title,
    Widget page,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white70,
      ),

      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white70,
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
    );
  }

  /// ================= ACTIVE ITEM =================

  static Widget _activeNavItem(
    IconData icon,
    String title,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(14),
      ),

      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.indigo,
        ),

        title: Text(
          title,
          style: const TextStyle(
            color: Colors.indigo,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  /// ================= CARD =================

  static Widget _leaveCard({
    required bool isMobile,
    required String name,
    required String role,
    required String type,
    required Color typeColor,
    required String dates,
    required String desc,
  }) {
    return Container(
      width: isMobile ? double.infinity : 330,

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(18),

        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              const CircleAvatar(radius: 28),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight:
                            FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    Text(
                      role,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),

                decoration: BoxDecoration(
                  color:
                      typeColor.withOpacity(0.15),

                  borderRadius:
                      BorderRadius.circular(20),
                ),

                child: Text(
                  type,
                  style: TextStyle(
                    color: typeColor,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              const Icon(
                Icons.calendar_month,
                size: 18,
              ),

              const SizedBox(width: 8),

              Expanded(
                child: Text(dates),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Text(
            desc,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},

                  child: const Text(
                    "Reject",
                  ),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(
                    backgroundColor:
                        primaryColor,
                  ),

                  onPressed: () {},

                  child: const Text(
                    "Approve",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// ================= TABLE ROW =================

  static DataRow _tableRow(
    String employee,
    String type,
    String date,
    String status,
    Color statusColor,
  ) {
    return DataRow(
      cells: [
        DataCell(Text(employee)),

        DataCell(Text(type)),

        DataCell(Text(date)),

        DataCell(
          Container(
            padding:
                const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
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
                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}