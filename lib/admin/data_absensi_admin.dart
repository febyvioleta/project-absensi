import 'package:flutter/material.dart';

class AttendanceHistoryPage extends StatelessWidget {
  const AttendanceHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primary = Color(0xff6a020a);
    const Color secondary = Color(0xff4c56af);
    const Color background = Color(0xfffff8f7);

    return Scaffold(
      backgroundColor: background,

      // ================= APP BAR =================
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          "AttendancePro",
          style: TextStyle(
            color: primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            color: Colors.black87,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            color: Colors.black87,
            onPressed: () {},
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/150?img=12",
              ),
            ),
          ),
        ],
      ),

      // ================= BODY =================
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ================= HEADER =================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Attendance History",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 6),

                    Text(
                      "Manage and review workforce data.",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
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
                  icon: const Icon(Icons.add, color: Colors.white),
                  label: const Text(
                    "Log Entry",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // ================= FILTERS =================
            Row(
              children: [

                Expanded(
                  child: _buildCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const Text(
                          "Search Name",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 12),

                        TextField(
                          decoration: InputDecoration(
                            hintText: "Employee Name",
                            prefixIcon: const Icon(Icons.search),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: _buildCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const Text(
                          "Status Filter",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 12),

                        DropdownButtonFormField<String>(
                          value: "All",
                          items: const [
                            DropdownMenuItem(
                              value: "All",
                              child: Text("All Statuses"),
                            ),
                            DropdownMenuItem(
                              value: "Present",
                              child: Text("Present"),
                            ),
                            DropdownMenuItem(
                              value: "Late",
                              child: Text("Late"),
                            ),
                          ],
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // ================= SUMMARY CARD =================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: secondary,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Present Today",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),

                      SizedBox(height: 8),

                      Text(
                        "142 / 150",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  Icon(
                    Icons.groups_2,
                    color: Colors.white70,
                    size: 50,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ================= TABLE =================
            _buildCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [

                  _buildEmployeeRow(
                    initials: "JD",
                    name: "Jane Doe",
                    role: "UI/UX Designer",
                    checkIn: "08:55 AM",
                    checkOut: "05:05 PM",
                    status: "Present",
                    statusColor: Colors.green,
                  ),

                  Divider(height: 1, color: Colors.grey.shade200),

                  _buildEmployeeRow(
                    initials: "MS",
                    name: "Mark Smith",
                    role: "Backend Dev",
                    checkIn: "09:15 AM",
                    checkOut: "06:00 PM",
                    status: "Late",
                    statusColor: Colors.orange,
                  ),

                  Divider(height: 1, color: Colors.grey.shade200),

                  _buildEmployeeRow(
                    initials: "BW",
                    name: "Bruce Wayne",
                    role: "Project Lead",
                    checkIn: "--:--",
                    checkOut: "--:--",
                    status: "Absent",
                    statusColor: Colors.red,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),

      // ================= BOTTOM NAV =================
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: primary,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "History",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Requests",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  // ================= EMPLOYEE ROW =================
  Widget _buildEmployeeRow({
    required String initials,
    required String name,
    required String role,
    required String checkIn,
    required String checkOut,
    required String status,
    required Color statusColor,
  }) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Row(
        children: [

          CircleAvatar(
            radius: 24,
            backgroundColor: statusColor.withValues(alpha: 0.15),
            child: Text(
              initials,
              style: TextStyle(
                color: statusColor,
                fontWeight: FontWeight.bold,
              ),
            ),
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
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  role,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          Column(
            children: [
              const Text(
                "IN",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                ),
              ),
              Text(checkIn),
            ],
          ),

          const SizedBox(width: 24),

          Column(
            children: [
              const Text(
                "OUT",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                ),
              ),
              Text(checkOut),
            ],
          ),

          const SizedBox(width: 24),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: statusColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= CARD =================
  Widget _buildCard({
    required Widget child,
    EdgeInsets? padding,
  }) {
    return Container(
      width: double.infinity,
      padding: padding ?? const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}