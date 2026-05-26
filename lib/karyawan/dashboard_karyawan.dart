import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DashboardKaryawan extends StatefulWidget {

  final Function(int)? onMenuTap;

  const DashboardKaryawan({
    super.key,
    this.onMenuTap,
  });

  @override
  State<DashboardKaryawan> createState() =>
      _DashboardKaryawanState();
}

class _DashboardKaryawanState
    extends State<DashboardKaryawan> {
      @override
void initState() {
  super.initState();

  updateWaktu();

  timer = Timer.periodic(
    const Duration(seconds: 1),
    (timer) {
      updateWaktu();
    },
  );
}
@override
void dispose() {
  timer?.cancel();
  super.dispose();
}
  bool sudahAbsenMasuk = false;
  bool sudahAbsenPulang = false;

  String jamMasuk = "--:--";
  String jamPulang = "--:--";
  String waktuSekarang = "";
String tanggalSekarang = "";

Timer? timer;
Uint8List? fotoSelfieBytes;

  void handleAbsensi() {

    final now = TimeOfDay.now();

    final jam =
        "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";

    setState(() {

      /// ABSEN MASUK
      if (!sudahAbsenMasuk) {

        sudahAbsenMasuk = true;
        jamMasuk = jam;

      }

      /// ABSEN PULANG
      else if (!sudahAbsenPulang) {

        sudahAbsenPulang = true;
        jamPulang = jam;

      }
    });
  }
  Future<void> ambilFotoSelfie() async {

  final picker = ImagePicker();

  final foto = await picker.pickImage(
    source: ImageSource.camera,
  );

  if (foto != null) {
    final bytes = await foto.readAsBytes();

    setState(() {
      fotoSelfieBytes = bytes;
    });

    handleAbsensi();
  }
}
  void updateWaktu() {

  final now = DateTime.now();

  final jam =
      now.hour.toString().padLeft(2, '0');

  final menit =
      now.minute.toString().padLeft(2, '0');

  final detik =
      now.second.toString().padLeft(2, '0');

  final hari = [
    "Senin",
    "Selasa",
    "Rabu",
    "Kamis",
    "Jumat",
    "Sabtu",
    "Minggu"
  ];

  final bulan = [
    "Januari",
    "Februari",
    "Maret",
    "April",
    "Mei",
    "Juni",
    "Juli",
    "Agustus",
    "September",
    "Oktober",
    "November",
    "Desember"
  ];

  setState(() {

    waktuSekarang =
        "$jam:$menit:$detik";

    tanggalSekarang =
        "${hari[now.weekday - 1]}, ${now.day} ${bulan[now.month - 1]} ${now.year}";
  });
}

 @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xffFFF8F7),

    appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: const Text(
        "AttendancePro",
        style: TextStyle(
          color: Color(0xff6A020A),
          fontWeight: FontWeight.bold,
          fontSize: 28,
        ),
      ),

      actions: [

        IconButton(
          onPressed: ambilFotoSelfie,
          icon: const Icon(
            Icons.notifications_none,
            color: Color(0xff58413f),
          ),
        ),

        IconButton(
          onPressed: ambilFotoSelfie,
          icon: const Icon(
            Icons.settings,
            color: Color(0xff58413f),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xff8b1e1e),
                width: 2,
              ),
              shape: BoxShape.circle,
            ),

          child: CircleAvatar(
  radius: 32,

  backgroundImage:
      fotoSelfieBytes != null
          ? MemoryImage(fotoSelfieBytes!)
          : const NetworkImage(
              "https://i.pravatar.cc/150?img=5",
            ),
),
          ),
        ),
      ],
    ),

    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16),

      child: Column(
        children: [

          /// PROFILE HEADER
          Container(
            padding: const EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),

              border: Border.all(
                color: const Color(0xffdfbfbc),
              ),

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 10,
                )
              ],
            ),

            child: Row(
              children: [

                Container(
                  padding: const EdgeInsets.all(2),

                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xff6A020A),
                      width: 2,
                    ),
                    shape: BoxShape.circle,
                  ),

                  child: CircleAvatar(
  radius: 32,

  backgroundImage:
      fotoSelfieBytes != null
          ? MemoryImage(fotoSelfieBytes!)
          : const NetworkImage(
              "https://i.pravatar.cc/150?img=5",
            ),
),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: const [

                      Text(
                        "Budi Santoso",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff251917),
                        ),
                      ),

                      SizedBox(height: 4),

                      Text(
                        "STAFF IT • KARYAWAN TETAP",
                        style: TextStyle(
                          color: Color(0xff58413f),
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),

                  decoration: BoxDecoration(
                    color: const Color(0xffffdad6),
                    borderRadius:
                        BorderRadius.circular(30),
                  ),

                  child: Text(
  sudahAbsenMasuk
      ? sudahAbsenPulang
          ? "SELESAI"
          : "SUDAH ABSEN"
      : "BELUM ABSEN",
                    style: TextStyle(
                      color: Color(0xff93000a),
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          /// CLOCK CARD
      /// CLOCK CARD
Container(
  width: double.infinity,

  padding: const EdgeInsets.symmetric(
    horizontal: 24,
    vertical: 28,
  ),

  decoration: BoxDecoration(
    color: const Color(0xffFFF0EF),

    borderRadius: BorderRadius.circular(16),

    border: Border.all(
      color: const Color(0xffDFBFBC),
      width: 1,
    ),
  ),

  child: Column(
    children: [

      /// TITLE
      const Text(
        "WAKTU SEKARANG",
        style: TextStyle(
          color: Color(0xff6A020A),
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 3,
        ),
      ),

      const SizedBox(height: 14),

      /// JAM
      Text(
  waktuSekarang,
        style: TextStyle(
          fontSize: 80,
          height: 0.9,
          fontWeight: FontWeight.w700,
          letterSpacing: -3,
          color: Color(0xff7A0008),
        ),
      ),

      const SizedBox(height: 12),

      /// TANGGAL
     Text(
  tanggalSekarang,
        style: TextStyle(
          color: Color(0xff58413f),
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),

      const SizedBox(height: 28),

      /// BUTTON
      SizedBox(
        width: double.infinity,
        height: 56,

       child: ElevatedButton(
  onPressed: ambilFotoSelfie,

          style: ElevatedButton.styleFrom(
            backgroundColor:
                const Color(0xff8B000A),

            elevation: 2,

            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(14),
            ),

            padding: EdgeInsets.zero,
          ),

         child: Row(
            mainAxisAlignment:
                MainAxisAlignment.center,

            children: [

              Icon(
                Icons.fingerprint,
                color: Colors.white,
                size: 22,
              ),

              SizedBox(width: 10),

              Text(
  sudahAbsenMasuk
      ? sudahAbsenPulang
          ? "Absensi Selesai"
          : "Absen Pulang"
      : "Absen Sekarang",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),

      const SizedBox(height: 16),

      /// TEXT BAWAH
      const Text(
        "Silahkan lakukan absen masuk sebelum jam 08:30",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xff58413f),
          fontSize: 14,
          fontStyle: FontStyle.italic,
        ),
      ),
    ],
  ),
),
const SizedBox(height: 28),
Container(
  width: double.infinity,

  padding: const EdgeInsets.all(20),

  decoration: BoxDecoration(
    color: Colors.white,

    borderRadius: BorderRadius.circular(24),

    border: Border.all(
      color: const Color(0xffdfbfbc),
    ),

    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.03),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  ),

  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,

    children: [

      /// TITLE
      const Text(
        "Status Hari Ini",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color(0xff251917),
        ),
      ),

      const SizedBox(height: 14),

      Divider(
        color: const Color(0xffdfbfbc),
        thickness: 1,
      ),

      const SizedBox(height: 18),

      /// ABSEN MASUK
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            width: 46,
            height: 46,

            decoration: BoxDecoration(
              color: const Color(0xfffff0ef),
              borderRadius: BorderRadius.circular(50),
            ),

            child: const Icon(
              Icons.login,
              color: Color(0xff8b716e),
            ),
          ),

          const SizedBox(width: 16),

          Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              Text(
                "ABSEN MASUK",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  color: Color(0xff58413f),
                ),
              ),

              SizedBox(height: 6),

              Text(
  jamMasuk,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),

      const SizedBox(height: 28),

      /// ABSEN PULANG
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            width: 46,
            height: 46,

            decoration: BoxDecoration(
              color: const Color(0xfffff0ef),
              borderRadius: BorderRadius.circular(50),
            ),

            child: const Icon(
              Icons.logout,
              color: Color(0xff8b716e),
            ),
          ),

          const SizedBox(width: 16),

          Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

           children: [

              Text(
                "ABSEN PULANG",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  color: Color(0xff58413f),
                ),
              ),

              SizedBox(height: 6),

              Text(
  jamPulang,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  ),
),


          /// STATISTIC
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
                  "IZIN/CUTI",
                  "2 Hari",
                  Icons.event_busy,
                  Colors.indigo,
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

          /// AKTIVITAS
          Container(
            width: double.infinity,

            padding: const EdgeInsets.all(18),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),

              border: Border.all(
                color: const Color(0xffdfbfbc),
              ),
            ),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                  children: const [

                    Text(
                      "Aktivitas Terakhir",
                      style: TextStyle(
                        fontSize: 20,
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

                const SizedBox(height: 18),

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