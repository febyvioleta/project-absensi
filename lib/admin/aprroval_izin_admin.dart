import 'package:flutter/material.dart';

class LeaveApprovalPage extends StatelessWidget {
  const LeaveApprovalPage({super.key});

  static const Color primaryColor = Color(0xFF6A020A);
  static const Color secondaryColor = Color(0xFF4C56AF);
  static const Color backgroundColor = Color(0xFFFFF8F7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Row(
        children: [
          // ================= SIDEBAR =================
          Container(
            width: 260,
            color: secondaryColor,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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

                const SizedBox(height: 4),

                const Text(
                  "Workforce Management",
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),

                const SizedBox(height: 30),

                _navItem(Icons.dashboard, "Dashboard"),
                _navItem(Icons.group, "Employees"),
                _navItem(Icons.event_available, "Attendance"),
                _navItem(Icons.map, "Maps"),
                _activeNavItem(Icons.pending_actions, "Leave Requests"),
                _navItem(Icons.assessment, "Reports"),
                _navItem(Icons.settings, "Settings"),

                const Spacer(),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Clock In/Out",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ================= MAIN CONTENT =================
          Expanded(
            child: Column(
              children: [
                // ================= TOP BAR =================
                Container(
                  height: 70,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFE0E0E0)),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "AttendancePro",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),

                          const SizedBox(width: 30),

                          Container(
                            width: 250,
                            height: 42,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Row(
                              children: [
                                Icon(Icons.search, color: Colors.grey),
                                SizedBox(width: 10),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Search requests...",
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.notifications),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.settings),
                          ),
                          const CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                              "https://i.pravatar.cc/150?img=3",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // ================= CONTENT =================
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Pending Leave Approvals",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        const Text(
                          "Manage employee time-off requests with transparency and efficiency.",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),

                        const SizedBox(height: 24),

                        // ================= LEAVE CARDS =================
                        Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          children: [
                            _leaveCard(
                              name: "Sarah Johnson",
                              role: "Senior Project Manager",
                              type: "Emergency",
                              typeColor: Colors.red,
                              dates: "Oct 24 - Oct 26, 2023",
                              desc:
                                  "Family medical emergency requiring immediate attention.",
                            ),

                            _leaveCard(
                              name: "David Chen",
                              role: "Lead Developer",
                              type: "Annual",
                              typeColor: Colors.blue,
                              dates: "Nov 10 - Nov 17, 2023",
                              desc: "Requesting annual leave for vacation.",
                            ),

                            _leaveCard(
                              name: "Elena Rodriguez",
                              role: "HR Coordinator",
                              type: "Sick",
                              typeColor: Colors.orange,
                              dates: "Oct 23, 2023",
                              desc:
                                  "Feeling unwell and unable to perform duties.",
                            ),
                          ],
                        ),

                        const SizedBox(height: 40),

                        // ================= TABLE =================
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(20),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color(0xFFE0E0E0),
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  "Recent Decisions History",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTable(
                                  columnSpacing: 40,
                                  headingRowColor: WidgetStateProperty.all(
                                    const Color(0xFFF8F8F8),
                                  ),
                                  columns: const [
                                    DataColumn(label: Text("Employee")),
                                    DataColumn(label: Text("Type")),
                                    DataColumn(label: Text("Dates")),
                                    DataColumn(label: Text("Decision Date")),
                                    DataColumn(label: Text("Status")),
                                    DataColumn(label: Text("Actions")),
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

  // ================= SIDEBAR ITEM =================
  static Widget _navItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.white70),
        title: Text(title, style: const TextStyle(color: Colors.white70)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onTap: () {},
      ),
    );
  }

  // ================= ACTIVE NAV =================
  static Widget _activeNavItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.indigo),
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.indigo,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // ================= LEAVE CARD =================
  static Widget _leaveCard({
    required String name,
    required String role,
    required String type,
    required Color typeColor,
    required String dates,
    required String desc,
  }) {
    return Container(
      width: 340,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage("https://i.pravatar.cc/150"),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(role, style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: typeColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  type,
                  style: TextStyle(
                    color: typeColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              const Icon(Icons.calendar_month, size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  dates,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Text(desc, style: const TextStyle(color: Colors.grey)),

          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text("Reject"),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Approve",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ================= TABLE ROW =================
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
        const DataCell(Text("Oct 12, 2023")),

        // STATUS
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status.toUpperCase(),
              style: TextStyle(
                color: statusColor,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),

        // ACTIONS
        DataCell(
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(icon: const Icon(Icons.visibility), onPressed: () {}),
              IconButton(icon: const Icon(Icons.edit), onPressed: () {}),
            ],
          ),
        ),
      ],
    );
  }
}
