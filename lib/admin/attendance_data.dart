import 'package:flutter/material.dart';

class AttendanceModel {
  final String name;
  final String role;
  final String checkIn;
  final String checkOut;
  final String status;

  AttendanceModel({
    required this.name,
    required this.role,
    required this.checkIn,
    required this.checkOut,
    required this.status,
  });
}

List<AttendanceModel> attendanceList = [
  AttendanceModel(
    name: "Jane Doe",
    role: "UI/UX Designer",
    checkIn: "08:55 AM",
    checkOut: "05:05 PM",
    status: "Present",
  ),

  AttendanceModel(
    name: "Mark Smith",
    role: "Backend Dev",
    checkIn: "09:15 AM",
    checkOut: "06:00 PM",
    status: "Late",
  ),

  AttendanceModel(
    name: "Bruce Wayne",
    role: "Project Lead",
    checkIn: "--:--",
    checkOut: "--:--",
    status: "Absent",
  ),
];

class AttendanceDataPage extends StatelessWidget {
  const AttendanceDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendance Data"),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: attendanceList.length,

        itemBuilder: (context, index) {
          final data = attendanceList[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),

              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 5,
                ),
              ],
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  data.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  data.role,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 12),

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                  children: [
                    Text("Check In : ${data.checkIn}"),
                    Text("Check Out : ${data.checkOut}"),
                  ],
                ),

                const SizedBox(height: 12),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),

                  decoration: BoxDecoration(
                    color: data.status == "Present"
                        ? Colors.green.withOpacity(0.2)
                        : data.status == "Late"
                            ? Colors.orange.withOpacity(0.2)
                            : Colors.red.withOpacity(0.2),

                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Text(
                    data.status,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: data.status == "Present"
                          ? Colors.green
                          : data.status == "Late"
                              ? Colors.orange
                              : Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}