import 'package:flutter/material.dart';

import 'dashboard_karyawan.dart';
import 'detail_absensi_karyawan.dart';
import 'pengajuan_izin_cuti_karyawan.dart';
import 'profil_karyawan.dart';

class NavigationKaryawan extends StatefulWidget {
  const NavigationKaryawan({super.key});

  @override
  State<NavigationKaryawan> createState() =>
      _NavigationKaryawanState();
}

class _NavigationKaryawanState
    extends State<NavigationKaryawan> {

  int currentIndex = 0;

 late final List<Widget> pages = [

  DashboardKaryawan(
    onMenuTap: (index) {
      setState(() {
        currentIndex = index;
      });
    },
  ),

  const DetailAbsensiKaryawan(),
  const RequestPage(),
  const ProfilKaryawan(),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        selectedItemColor:
            const Color(0xff6A020A),

        unselectedItemColor: Colors.grey,

        type: BottomNavigationBarType.fixed,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

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
}