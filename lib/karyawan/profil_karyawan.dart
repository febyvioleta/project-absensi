import 'package:flutter/material.dart';

class ProfilKaryawan extends StatelessWidget {
  const ProfilKaryawan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF8F7),

      /// APPBAR
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

          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/150?img=12",
              ),
            ),
          ),
        ],
      ),

      /// BODY
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            /// PROFILE HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),

                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 8,
                  ),
                ],
              ),

              child: Column(
                children: [

                  /// PHOTO
                  Stack(
                    children: [

                      Container(
                        width: 120,
                        height: 120,

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 4,
                          ),
                          image: const DecorationImage(
                            image: NetworkImage(
                              "https://i.pravatar.cc/300?img=5",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: 0,
                        right: 0,

                        child: Container(
                          padding: const EdgeInsets.all(8),

                          decoration: const BoxDecoration(
                            color: Color(0xff6A020A),
                            shape: BoxShape.circle,
                          ),

                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// NAME
                  const Text(
                    "Budi Santoso",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// BADGES
                  Wrap(
                    spacing: 10,
                    children: [

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),

                        decoration: BoxDecoration(
                          color: const Color(
                            0xff6A020A,
                          ).withAlpha(25),

                          borderRadius:
                              BorderRadius.circular(30),
                        ),

                        child: const Text(
                          "STAFF IT",
                          style: TextStyle(
                            color: Color(0xff6A020A),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),

                        decoration: BoxDecoration(
                          color: Colors.indigo.withAlpha(25),

                          borderRadius:
                              BorderRadius.circular(30),
                        ),

                        child: const Text(
                          "TEKNOLOGI INFORMASI",
                          style: TextStyle(
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  /// BUTTONS
                  Row(
                    children: [

                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},

                          icon: const Icon(Icons.edit),

                          label: const Text(
                            "Edit Profil",
                          ),

                          style:
                              ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color(0xff6A020A),

                            foregroundColor:
                                Colors.white,

                            padding:
                                const EdgeInsets.symmetric(
                              vertical: 14,
                            ),

                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(
                                16,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {},

                          icon: const Icon(Icons.share),

                          label: const Text(
                            "Bagikan ID",
                          ),

                          style:
                              OutlinedButton.styleFrom(
                            foregroundColor:
                                const Color(0xff6A020A),

                            side: const BorderSide(
                              color: Color(0xff6A020A),
                            ),

                            padding:
                                const EdgeInsets.symmetric(
                              vertical: 14,
                            ),

                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(
                                16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// ACCOUNT INFO
            infoSection(
              title: "Informasi Akun",
              icon: Icons.account_circle,
              children: [

                infoTile(
                  "Email Kerja",
                  "budi.santoso@attendancepro.id",
                ),

                infoTile(
                  "Nomor HP",
                  "+62 812-3456-7890",
                ),

                infoTile(
                  "ID Karyawan",
                  "AP-IT-042",
                ),

                infoTile(
                  "Tanggal Bergabung",
                  "12 Januari 2021",
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// ATTENDANCE CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: const Color(0xff6A020A),
                borderRadius: BorderRadius.circular(24),
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  const Text(
                    "Status Kehadiran Bulan Ini",
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.end,

                    children: [

                      const Text(
                        "98%",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Padding(
                        padding:
                            const EdgeInsets.only(
                          bottom: 10,
                        ),

                        child: const Text(
                          "Sangat Baik",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

                    children: const [

                      Text(
                        "Tepat Waktu",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),

                      Text(
                        "21 Hari",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(20),

                    child: LinearProgressIndicator(
                      value: 0.95,
                      minHeight: 10,
                      backgroundColor:
                          Colors.white24,

                      valueColor:
                          const AlwaysStoppedAnimation(
                        Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// ORGANIZATION
            infoSection(
              title: "Struktur Organisasi",
              icon: Icons.corporate_fare,
              children: [

                infoTile(
                  "Divisi",
                  "Teknologi Informasi",
                ),

                infoTile(
                  "Departemen",
                  "Infrastructure & Security",
                ),

                infoTile(
                  "Lokasi Kantor",
                  "Jakarta Head Office",
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// MAP CARD
            Container(
              width: double.infinity,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),

                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 6,
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Padding(
                    padding:
                        const EdgeInsets.all(16),

                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,

                      children: const [

                        Text(
                          "Titik Absensi Default",
                          style: TextStyle(
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        Text(
                          "Radius 100m",
                          style: TextStyle(
                            color: Colors.indigo,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  ClipRRect(
                    borderRadius:
                        const BorderRadius.only(
                      bottomLeft:
                          Radius.circular(24),
                      bottomRight:
                          Radius.circular(24),
                    ),

                    child: Image.network(
                      "https://picsum.photos/600/250",
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),

      
    );
  }

  /// INFO SECTION
  Widget infoSection({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),

        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          Row(
            children: [

              Icon(
                icon,
                color: const Color(0xff6A020A),
              ),

              const SizedBox(width: 10),

              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          ...children,
        ],
      ),
    );
  }

  /// INFO TILE
  Widget infoTile(
    String title,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 18,
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}