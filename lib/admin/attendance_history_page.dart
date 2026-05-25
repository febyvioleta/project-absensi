import 'package:flutter/material.dart';
import 'attendance_data.dart';

class AttendanceHistoryPage extends StatefulWidget {
  const AttendanceHistoryPage({super.key});

  @override
  State<AttendanceHistoryPage> createState() =>
      _AttendanceHistoryPageState();
}

class _AttendanceHistoryPageState
    extends State<AttendanceHistoryPage> {

  @override
  Widget build(BuildContext context) {

    const Color primary = Color(0xff6a020a);
    const Color secondary = Color(0xff4c56af);
    const Color background = Color(0xfffff8f7);

    return Scaffold(
      backgroundColor: background,

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
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(
              "Attendance History",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Manage and review workforce data.",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 24),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),

              decoration: BoxDecoration(
                color: secondary,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                children: [

                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      const Text(
                        "Present Today",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        "${attendanceList.length}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const Icon(
                    Icons.groups,
                    color: Colors.white,
                    size: 40,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Container(
              width: double.infinity,

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius:
                    BorderRadius.circular(20),

                boxShadow: [
                  BoxShadow(
                    color:
                        Colors.black.withOpacity(0.05),

                    blurRadius: 10,
                  ),
                ],
              ),

              child: Column(
                children: attendanceList.map((data) {

                  Color statusColor = Colors.green;

                  if (data.status == "Late") {
                    statusColor = Colors.orange;
                  }

                  if (data.status == "Absent") {
                    statusColor = Colors.red;
                  }

                  return Column(
                    children: [

                      Padding(
                        padding:
                            const EdgeInsets.all(18),

                        child: Row(
                          children: [

                            CircleAvatar(
                              radius: 24,

                              backgroundColor:
                                  statusColor
                                      .withOpacity(0.15),

                              child: Text(
                                data.name
                                    .substring(0, 2)
                                    .toUpperCase(),

                                style: TextStyle(
                                  color: statusColor,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                            ),

                            const SizedBox(width: 14),

                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,

                                children: [

                                  Text(
                                    data.name,

                                    style:
                                        const TextStyle(
                                      fontWeight:
                                          FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),

                                  const SizedBox(
                                      height: 4),

                                  Text(
                                    data.role,

                                    style:
                                        const TextStyle(
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

                                Text(data.checkIn),
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

                                Text(data.checkOut),
                              ],
                            ),

                            const SizedBox(width: 24),

                            Container(
                              padding:
                                  const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 8,
                              ),

                              decoration: BoxDecoration(
                                color: statusColor
                                    .withOpacity(0.15),

                                borderRadius:
                                    BorderRadius.circular(
                                  30,
                                ),
                              ),

                              child: Text(
                                data.status,

                                style: TextStyle(
                                  color: statusColor,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Divider(
                        height: 1,
                        color: Colors.grey.shade200,
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}