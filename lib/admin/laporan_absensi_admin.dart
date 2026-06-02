import 'package:flutter/material.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF8F7),

      body: Row(
        children: [
          /// SIDEBAR
          Container(
            width: 280,
            color: const Color(0xff4C56AF),

            child: Column(
              children: [
                const SizedBox(height: 40),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Admin Portal",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 4),

                      Text(
                        "Workforce Management",
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                sidebarItem(Icons.dashboard, "Dashboard"),
                sidebarItem(Icons.group, "Employees"),
                sidebarItem(Icons.event_available, "Attendance"),
                sidebarItem(Icons.map, "Maps"),
                sidebarItem(Icons.pending_actions, "Leave Requests"),
                sidebarItem(Icons.assessment, "Reports", active: true),
                sidebarItem(Icons.settings, "Settings"),

                const Spacer(),

                Padding(
                  padding: const EdgeInsets.all(20),

                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 22,
                        backgroundImage: NetworkImage(
                          "https://i.pravatar.cc/150",
                        ),
                      ),

                      const SizedBox(width: 12),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: const [
                          Text(
                            "Alex Rivera",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            "System Admin",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
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

          /// MAIN CONTENT
          Expanded(
            child: Column(
              children: [
                /// TOP BAR
                Container(
                  height: 70,
                  padding: const EdgeInsets.symmetric(horizontal: 24),

                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(color: Color(0xffDFBFBC)),
                    ),
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      const Text(
                        "AttendancePro",
                        style: TextStyle(
                          color: Color(0xff6A020A),
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Row(
                        children: [
                          searchBox(),

                          const SizedBox(width: 16),

                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notifications,
                              color: Color(0xff6A020A),
                            ),
                          ),

                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.settings,
                              color: Color(0xff6A020A),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                /// CONTENT
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        /// HEADER
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: const [
                                Text(
                                  "Monthly Attendance Analytics",
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff251917),
                                  ),
                                ),

                                SizedBox(height: 6),

                                Text(
                                  "Reviewing performance for October 2023",
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                actionButton(
                                  "Export PDF",
                                  Icons.picture_as_pdf,
                                  const Color(0xff4C56AF),
                                ),

                                const SizedBox(width: 12),

                                actionButton(
                                  "Export Excel",
                                  Icons.table_chart,
                                  const Color(0xff6A020A),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 30),

                        /// SUMMARY CARDS
                        Row(
                          children: [
                            Expanded(
                              child: summaryCard(
                                title: "Total Presence",
                                value: "1,248",
                                subtitle: "Avg. 156 per day",
                                icon: Icons.person,
                                color: Colors.green,
                              ),
                            ),

                            const SizedBox(width: 16),

                            Expanded(
                              child: summaryCard(
                                title: "Total Late",
                                value: "42",
                                subtitle: "Mostly Morning shift",
                                icon: Icons.schedule,
                                color: Colors.orange,
                              ),
                            ),

                            const SizedBox(width: 16),

                            Expanded(
                              child: summaryCard(
                                title: "Total Absent",
                                value: "18",
                                subtitle: "8 Approved leaves",
                                icon: Icons.person_off,
                                color: Colors.red,
                              ),
                            ),

                            const SizedBox(width: 16),

                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(20),

                                decoration: BoxDecoration(
                                  color: const Color(0xff6A020A),
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    SizedBox(height: 20),

                                    Text(
                                      "Attendance Rate",
                                      style: TextStyle(color: Colors.white70),
                                    ),

                                    SizedBox(height: 8),

                                    Text(
                                      "96.8%",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 30),

                        /// CHART + DEPARTMENT
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            /// CHART
                            Expanded(
                              flex: 2,

                              child: Container(
                                height: 350,
                                padding: const EdgeInsets.all(24),

                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    const Text(
                                      "Daily Attendance Trends",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 30),

                                    Expanded(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,

                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,

                                        children: [
                                          chartBar("MON", 0.65),

                                          chartBar("TUE", 0.85),

                                          chartBar("WED", 0.95, active: true),

                                          chartBar("THU", 0.75),

                                          chartBar("FRI", 0.80),

                                          chartBar("SAT", 0.25),

                                          chartBar("SUN", 0.15),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(width: 20),

                            /// DEPARTMENT
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(24),

                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    const Text(
                                      "Attendance by Dept.",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 24),

                                    deptItem("Operations", 0.98),

                                    deptItem("Marketing", 0.94),

                                    deptItem("HR & Admin", 0.88),

                                    deptItem("R&D", 0.97),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 30),

                        /// TABLE
                        Container(
                          padding: const EdgeInsets.all(24),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              const Text(
                                "Detailed Monthly Log",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 20),

                              DataTable(
                                columns: const [
                                  DataColumn(label: Text("Employee")),

                                  DataColumn(label: Text("Department")),

                                  DataColumn(label: Text("Presence")),

                                  DataColumn(label: Text("Late")),

                                  DataColumn(label: Text("Leave")),

                                  DataColumn(label: Text("Rate")),
                                ],

                                rows: const [
                                  DataRow(
                                    cells: [
                                      DataCell(Text("John Doe")),
                                      DataCell(Text("Operations")),
                                      DataCell(Text("22 Days")),
                                      DataCell(Text("0")),
                                      DataCell(Text("0")),
                                      DataCell(Text("100%")),
                                    ],
                                  ),

                                  DataRow(
                                    cells: [
                                      DataCell(Text("Sarah Miller")),
                                      DataCell(Text("Marketing")),
                                      DataCell(Text("19 Days")),
                                      DataCell(Text("3")),
                                      DataCell(Text("0")),
                                      DataCell(Text("86.4%")),
                                    ],
                                  ),

                                  DataRow(
                                    cells: [
                                      DataCell(Text("Robert King")),
                                      DataCell(Text("Engineering")),
                                      DataCell(Text("17 Days")),
                                      DataCell(Text("0")),
                                      DataCell(Text("5")),
                                      DataCell(Text("77.3%")),
                                    ],
                                  ),
                                ],
                              ),
                            ],
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
    );
  }

  /// SEARCH BOX
  static Widget searchBox() {
    return Container(
      width: 250,
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 12),

      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xffDFBFBC)),
        borderRadius: BorderRadius.circular(30),
      ),

      child: const Row(
        children: [
          Icon(Icons.search, color: Colors.black54),

          SizedBox(width: 10),

          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search reports...",
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// SIDEBAR ITEM
  static Widget sidebarItem(
    IconData icon,
    String title, {
    bool active = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),

      child: Container(
        decoration: BoxDecoration(
          color: active ? const Color(0xff959EFD) : Colors.transparent,

          borderRadius: BorderRadius.circular(14),
        ),

        child: ListTile(
          leading: Icon(icon, color: Colors.white),

          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          onTap: () {},
        ),
      ),
    );
  }

  /// ACTION BUTTON
  static Widget actionButton(String title, IconData icon, Color color) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),

      onPressed: () {},

      icon: Icon(icon, color: Colors.white),

      label: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  /// SUMMARY CARD
  static Widget summaryCard({
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          CircleAvatar(
            backgroundColor: color.withValues(alpha: 0.15),

            child: Icon(icon, color: color),
          ),

          const SizedBox(height: 20),

          Text(title, style: const TextStyle(color: Colors.black54)),

          const SizedBox(height: 8),

          Text(
            value,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 6),

          Text(subtitle, style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }

  /// BAR CHART
  static Widget chartBar(String day, double height, {bool active = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,

      children: [
        Container(
          width: 40,
          height: 220 * height,

          decoration: BoxDecoration(
            color: active ? const Color(0xff6A020A) : const Color(0xff959EFD),

            borderRadius: BorderRadius.circular(12),
          ),
        ),

        const SizedBox(height: 10),

        Text(day),
      ],
    );
  }

  /// DEPARTMENT ITEM
  static Widget deptItem(String title, double value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),

              Text("${(value * 100).toInt()}%"),
            ],
          ),

          const SizedBox(height: 10),

          LinearProgressIndicator(
            value: value,
            minHeight: 8,
            borderRadius: BorderRadius.circular(10),

            backgroundColor: const Color(0xffEEE5E4),

            valueColor: const AlwaysStoppedAnimation(Color(0xff4C56AF)),
          ),
        ],
      ),
    );
  }
}
