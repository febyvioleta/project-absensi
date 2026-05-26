// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  String? selectedType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF8F7),

      /// APPBAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(
          color: Color(0xff6A020A),
        ),

        title: const Text(
          "Pengajuan Izin / Cuti",
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// HEADER
            const Text(
              "Ajukan permohonan ketidakhadiran Anda secara resmi melalui sistem.",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 20),

            /// FORM CARD
            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),

                boxShadow: [
                  BoxShadow(
                    blurRadius: 6,
                    color: Colors.grey.shade300,
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TITLE
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),

                        decoration: BoxDecoration(
                          color: const Color(0xff6A020A)
                              .withOpacity(0.1),

                          borderRadius:
                              BorderRadius.circular(12),
                        ),

                        child: const Icon(
                          Icons.edit_note,
                          color: Color(0xff6A020A),
                        ),
                      ),

                      const SizedBox(width: 12),

                      const Text(
                        "Form Pengajuan",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff6A020A),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  /// DROPDOWN
                  const Text(
                    "Jenis Izin",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  DropdownButtonFormField<String>(
                    value: selectedType,

                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade100,

                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(16),

                        borderSide: BorderSide.none,
                      ),
                    ),

                    hint: const Text(
                      "Pilih jenis izin",
                    ),

                    items: const [
                      DropdownMenuItem(
                        value: "Sakit",
                        child: Text("Sakit"),
                      ),

                      DropdownMenuItem(
                        value: "Izin",
                        child: Text("Izin"),
                      ),

                      DropdownMenuItem(
                        value: "Cuti",
                        child: Text("Cuti"),
                      ),
                    ],

                    onChanged: (value) {
                      setState(() {
                        selectedType = value;
                      });
                    },
                  ),

                  const SizedBox(height: 20),

                  /// TANGGAL MULAI
                  const Text(
                    "Tanggal Mulai",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  TextField(
                    decoration: InputDecoration(
                      hintText: "01/05/2026",

                      prefixIcon: const Icon(
                        Icons.calendar_month,
                      ),

                      filled: true,
                      fillColor: Colors.grey.shade100,

                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(16),

                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// TANGGAL SELESAI
                  const Text(
                    "Tanggal Selesai",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  TextField(
                    decoration: InputDecoration(
                      hintText: "03/05/2026",

                      prefixIcon: const Icon(
                        Icons.calendar_today,
                      ),

                      filled: true,
                      fillColor: Colors.grey.shade100,

                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(16),

                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// KETERANGAN
                  const Text(
                    "Alasan / Keterangan",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  TextField(
                    maxLines: 4,

                    decoration: InputDecoration(
                      hintText:
                          "Masukkan alasan pengajuan izin...",

                      filled: true,
                      fillColor: Colors.grey.shade100,

                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(16),

                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// UPLOAD
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(30),

                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),

                      borderRadius:
                          BorderRadius.circular(20),

                      color: Colors.grey.shade50,
                    ),

                    child: Column(
                      children: [
                        Icon(
                          Icons.cloud_upload,
                          size: 50,
                          color: Colors.grey.shade600,
                        ),

                        const SizedBox(height: 12),

                        const Text(
                          "Upload Lampiran",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),

                        const SizedBox(height: 6),

                        const Text(
                          "PDF / JPG / PNG",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// BUTTON
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Color(0xff6A020A),
                            ),

                            padding:
                                const EdgeInsets.symmetric(
                              vertical: 16,
                            ),

                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(
                                16,
                              ),
                            ),
                          ),

                          onPressed: () {},

                          child: const Text(
                            "BATAL",
                            style: TextStyle(
                              color: Color(0xff6A020A),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 16),

                      Expanded(
                        child: ElevatedButton.icon(
                          style:
                              ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color(0xff6A020A),

                            foregroundColor:
                                Colors.white,

                            padding:
                                const EdgeInsets.symmetric(
                              vertical: 16,
                            ),

                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(
                                16,
                              ),
                            ),
                          ),

                          onPressed: () {
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Pengajuan berhasil dikirim",
                                ),
                              ),
                            );
                          },

                          icon: const Icon(Icons.send),

                          label: const Text(
                            "KIRIM",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
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

            /// INFO CARD
            Row(
              children: [
                Expanded(
                  child: infoCard(
                    "Sisa Cuti",
                    "12 Hari",
                    Icons.calendar_month,
                    Colors.indigo,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: infoCard(
                    "Izin Sakit",
                    "2 Hari",
                    Icons.medical_services,
                    Colors.red,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            infoCard(
              "Status Terakhir",
              "Disetujui",
              Icons.verified,
              Colors.green,
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),

    
    );
  }

  /// INFO CARD
  Widget infoCard(
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

        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.grey.shade300,
          ),
        ],
      ),

      child: Row(
        children: [
          CircleAvatar(
            backgroundColor:
                color.withOpacity(0.1),

            child: Icon(
              icon,
              color: color,
            ),
          ),

          const SizedBox(width: 12),

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

              const SizedBox(height: 5),

              Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}