import 'package:flutter/material.dart';

class DetailAbsensiKaryawan extends StatelessWidget {
  const DetailAbsensiKaryawan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF8F7),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
leading: IconButton(
  onPressed: () {
    Navigator.pop(context);
  },
  icon: const Icon(
    Icons.arrow_back,
    color: Color(0xff6A020A),
  ),
        ),

        title: const Text(
          "Detail Absensi",
          style: TextStyle(
            color: Color(0xff6A020A),
            fontWeight: FontWeight.bold,
          ),
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

          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/300",
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            /// FOTO SELFIE
            Container(
              width: double.infinity,

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
                children: [

                  Container(
                    padding: const EdgeInsets.all(16),

                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xffeeeeee),
                        ),
                      ),
                    ),

                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,

                      children: [

                        const Text(
                          "Foto Selfie Masuk",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),

                          decoration: BoxDecoration(
                            color: Colors.green.shade100,
                            borderRadius:
                                BorderRadius.circular(30),
                          ),

                          child: const Row(
                            children: [

                              Icon(
                                Icons.verified,
                                size: 18,
                                color: Colors.green,
                              ),

                              SizedBox(width: 5),

                              Text(
                                "Terverifikasi",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),

                    child: Image.network(
                      "https://images.unsplash.com/photo-1500648767791-00dcc994a43e",
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// MAP
            Container(
              width: double.infinity,

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
                children: [

                  Container(
                    padding: const EdgeInsets.all(16),

                    child: const Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,

                      children: [

                        Text(
                          "Lokasi Presensi",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Icon(
                          Icons.location_on,
                          color: Color(0xff6A020A),
                        ),
                      ],
                    ),
                  ),

                  Stack(
                    children: [

                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),

                        child: Image.network(
                          "https://images.unsplash.com/photo-1524661135-423995f22d0b",
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),

                      Positioned(
                        bottom: 16,
                        left: 16,
                        right: 16,

                        child: Container(
                          padding: const EdgeInsets.all(14),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(16),
                          ),

                          child: const Row(
                            children: [

                              Icon(
                                Icons.near_me,
                                color: Color(0xff6A020A),
                              ),

                              SizedBox(width: 10),

                              Expanded(
                                child: Text(
                                  "Jl. Jenderal Sudirman No.52 Jakarta Selatan",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// STATUS CARD
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
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

                    children: [

                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: const [

                          Text(
                            "Status Kehadiran",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 5),

                          Text(
                            "Senin, 14 Agustus 2023",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),

                      Container(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),

                        decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius:
                              BorderRadius.circular(30),
                        ),

                        child: const Text(
                          "HADIR TEPAT WAKTU",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  Row(
                    children: [

                      Expanded(
                        child: infoBox(
                          "Jam Masuk",
                          "08:00:14",
                          Colors.red,
                        ),
                      ),

                      const SizedBox(width: 16),

                      Expanded(
                        child: infoBox(
                          "Jam Pulang",
                          "17:05:42",
                          Colors.indigo,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  detailRow(
                    Icons.work_history,
                    "Durasi Kerja",
                    "9 Jam 5 Menit",
                    Colors.red,
                  ),

                  const SizedBox(height: 18),

                  detailRow(
                    Icons.devices,
                    "Perangkat",
                    "iPhone 14 Pro",
                    Colors.indigo,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// LOG AKTIVITAS
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
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  const Text(
                    "Log Aktivitas",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 25),

                  activityItem(
                    Icons.login,
                    "Check-In Berhasil",
                    "Lokasi: Kantor Pusat",
                    "08:00",
                    Colors.red,
                  ),

                  const SizedBox(height: 20),

                  activityItem(
                    Icons.logout,
                    "Check-Out Berhasil",
                    "Lokasi: Kantor Pusat",
                    "17:05",
                    Colors.indigo,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            /// BUTTON
            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xff6A020A),

                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(16),
                  ),
                ),

                onPressed: () {},

                icon: const Icon(
                  Icons.download,
                  color: Colors.white,
                ),

                label: const Text(
                  "UNDUH SLIP KEHADIRAN",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Color(0xff6A020A),
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(16),
                  ),
                ),

                onPressed: () {
                  Navigator.pop(context);
                },

                icon: const Icon(
                  Icons.history,
                  color: Color(0xff6A020A),
                ),

                label: const Text(
                  "KEMBALI KE RIWAYAT",
                  style: TextStyle(
                    color: Color(0xff6A020A),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  static Widget infoBox(
    String title,
    String value,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          Text(
            title.toUpperCase(),
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),

          const Text("WIB"),
        ],
      ),
    );
  }

  static Widget detailRow(
    IconData icon,
    String title,
    String subtitle,
    Color color,
  ) {
    return Row(
      children: [

        CircleAvatar(
          backgroundColor:
              color.withValues(alpha: 0.2),

          child: Icon(
            icon,
            color: color,
          ),
        ),

        const SizedBox(width: 15),

        Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),

            Text(
              subtitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  static Widget activityItem(
    IconData icon,
    String title,
    String subtitle,
    String time,
    Color color,
  ) {
    return Row(
      children: [

        CircleAvatar(
          backgroundColor:
              color.withValues(alpha: 0.2),

          child: Icon(
            icon,
            color: color,
          ),
        ),

        const SizedBox(width: 15),

        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),

        Text(
          time,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}