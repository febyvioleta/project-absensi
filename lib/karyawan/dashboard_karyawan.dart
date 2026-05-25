import 'package:flutter/material.dart';

class DashboardKaryawan extends StatelessWidget {
  const DashboardKaryawan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF8F7),

      // APPBAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          "AttendancePro",
          style: TextStyle(
            color: Color(0xff6A020A),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/150?img=3",
              ),
            ),
          ),
        ],
      ),

      // BODY
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // PROFILE CARD
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 32,
                    backgroundImage: NetworkImage(
                      "https://i.pravatar.cc/150?img=5",
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Budi Santoso",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          "STAFF IT • KARYAWAN TETAP",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      "BELUM ABSEN",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            // CLOCK CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  const Text(
                    "WAKTU SEKARANG",
                    style: TextStyle(
                      color: Color(0xff6A020A),
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    "08:15",
                    style: TextStyle(
                      fontSize: 52,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff6A020A),
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Senin, 24 Mei 2024",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.fingerprint),
                      label: const Text(
                        "Absen Sekarang",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff6A020A),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    "Silahkan lakukan absen masuk sebelum jam 08:30",
                    style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // STATUS CARD
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    "HADIR",
                    "18 Hari",
                    Icons.check_circle,
                    Colors.green,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _buildStatCard(
                    "IZIN",
                    "2 Hari",
                    Icons.event_busy,
                    Colors.blue,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            _buildStatCard(
              "TERLAMBAT",
              "1 Hari",
              Icons.schedule,
              Colors.red,
            ),

            const SizedBox(height: 20),

            // AKTIVITAS
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Aktivitas Terakhir",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        "LIHAT SEMUA",
                        style: TextStyle(
                          color: Color(0xff6A020A),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  _buildActivity(
                    "Jumat, 21 Mei",
                    "08:05",
                    "17:15",
                    "TEPAT WAKTU",
                    Colors.green,
                  ),

                  const Divider(),

                  _buildActivity(
                    "Kamis, 20 Mei",
                    "08:45",
                    "17:00",
                    "TERLAMBAT",
                    Colors.orange,
                  ),

                  const Divider(),

                  _buildActivity(
                    "Rabu, 19 Mei",
                    "07:55",
                    "17:05",
                    "TEPAT WAKTU",
                    Colors.green,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // BOTTOM NAVBAR
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xff6A020A),
        unselectedItemColor: Colors.grey,
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
            label: "Request",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
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
              Text(
                title,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                value,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          CircleAvatar(
            backgroundColor: color.withValues(alpha: 0.1),
            child: Icon(
              icon,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivity(
    String date,
    String masuk,
    String pulang,
    String status,
    Color color,
  ) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: Text(date),
        ),

        Expanded(
          child: Text(masuk),
        ),

        Expanded(
          child: Text(pulang),
        ),

        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          decoration: BoxDecoration(
           color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            status,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}