import 'package:flutter/material.dart';

class MonitoringMapsPage extends StatelessWidget {
  const MonitoringMapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF8F7),

      body: Row(
        children: [

          /// SIDEBAR
          Container(
            width: 260,
            color: const Color(0xff4C56AF),

            child: Column(
              children: [

                const SizedBox(height: 40),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      Text(
                        "Admin Portal",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 4),

                      Text(
                        "WORKFORCE MANAGEMENT",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 11,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                sidebarItem(Icons.dashboard, "Dashboard"),
                sidebarItem(Icons.group, "Employees"),
                sidebarItem(Icons.event_available,
                    "Attendance"),

                sidebarItem(Icons.map, "Maps",
                    isActive: true),

                sidebarItem(Icons.pending_actions,
                    "Leave Requests"),

                sidebarItem(Icons.analytics, "Reports"),

                sidebarItem(Icons.settings, "Settings"),

                const Spacer(),

                Padding(
                  padding: const EdgeInsets.all(20),

                  child: Column(
                    children: [

                      SizedBox(
                        width: double.infinity,
                        height: 50,

                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color(
                                    0xff6A020A),
                          ),

                          onPressed: () {},

                          child: const Text(
                            "Clock In/Out",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Row(
                        children: [

                          const CircleAvatar(
                            radius: 22,
                            backgroundImage:
                                NetworkImage(
                              "https://i.pravatar.cc/300",
                            ),
                          ),

                          const SizedBox(width: 12),

                          Column(
                            crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,

                            children: const [

                              Text(
                                "Super Admin",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 2),

                              Text(
                                "Global HQ",
                                style: TextStyle(
                                  color:
                                      Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          /// MAIN CONTENT
          Expanded(
            child: Column(
              children: [

                /// TOPBAR
                Container(
                  height: 70,
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),

                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xffDFBFBC),
                      ),
                    ),
                  ),

                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,

                    children: [

                      Row(
                        children: [

                          const Text(
                            "AttendancePro",
                            style: TextStyle(
                              color:
                                  Color(0xff6A020A),
                              fontSize: 26,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          const SizedBox(width: 30),

                          Container(
                            width: 300,
                            height: 45,

                            padding:
                                const EdgeInsets
                                    .symmetric(
                              horizontal: 14,
                            ),

                            decoration: BoxDecoration(
                              color: const Color(
                                  0xffFFF0EF),

                              borderRadius:
                                  BorderRadius
                                      .circular(30),
                            ),

                            child: Row(
                              children: const [

                                Icon(
                                  Icons.search,
                                  color:
                                      Colors.black54,
                                ),

                                SizedBox(width: 10),

                                Expanded(
                                  child: TextField(
                                    decoration:
                                        InputDecoration(
                                      border:
                                          InputBorder
                                              .none,

                                      hintText:
                                          "Search employee...",
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

                            icon: const Icon(
                              Icons.notifications,
                              color: Colors.black54,
                            ),
                          ),

                          IconButton(
                            onPressed: () {},

                            icon: const Icon(
                              Icons.settings,
                              color: Colors.black54,
                            ),
                          ),

                          const SizedBox(width: 10),

                          const CircleAvatar(
                            backgroundImage:
                                NetworkImage(
                              "https://i.pravatar.cc/301",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                /// CONTENT
                Expanded(
                  child: Row(
                    children: [

                      /// MAP
                      Expanded(
                        child: Stack(
                          children: [

                            Positioned.fill(
                              child: Image.network(
                                "https://images.unsplash.com/photo-1524661135-423995f22d0b?q=80&w=1400",
                                fit: BoxFit.cover,
                              ),
                            ),

                            /// MAP BUTTONS
                            Positioned(
                              top: 20,
                              right: 20,

                              child: Column(
                                children: [

                                  mapButton(Icons.add),

                                  const SizedBox(
                                      height: 10),

                                  mapButton(Icons.remove),

                                  const SizedBox(
                                      height: 20),

                                  mapButton(
                                    Icons.my_location,
                                    isPrimary: true,
                                  ),
                                ],
                              ),
                            ),

                            /// MARKER 1
                            Positioned(
                              top: 180,
                              left: 260,

                              child: mapMarker(
                                "Ahmad S.",
                                Colors.green,
                                const Color(
                                    0xff6A020A),
                              ),
                            ),

                            /// MARKER 2
                            Positioned(
                              bottom: 180,
                              right: 200,

                              child: mapMarker(
                                "Budi R.",
                                Colors.yellow,
                                const Color(
                                    0xff4C56AF),
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// EMPLOYEE SIDEBAR
                      Container(
                        width: 380,
                        color: Colors.white,

                        child: Column(
                          children: [

                            Container(
                              padding:
                                  const EdgeInsets
                                      .all(24),

                              decoration:
                                  const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(
                                        0xffDFBFBC),
                                  ),
                                ),
                              ),

                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,

                                children: [

                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment
                                            .start,

                                    children: const [

                                      Text(
                                        "Nearby Employees",
                                        style:
                                            TextStyle(
                                          fontSize:
                                              22,
                                          fontWeight:
                                              FontWeight
                                                  .bold,
                                        ),
                                      ),

                                      SizedBox(
                                          height: 4),

                                      Text(
                                        "Central Jakarta District",
                                        style:
                                            TextStyle(
                                          color: Colors
                                              .black54,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Container(
                                    padding:
                                        const EdgeInsets
                                            .all(10),

                                    decoration:
                                        BoxDecoration(
                                      color:
                                          const Color(
                                              0xffFFF0EF),

                                      borderRadius:
                                          BorderRadius
                                              .circular(
                                                  12),
                                    ),

                                    child: const Icon(
                                      Icons.tune,
                                      color: Color(
                                          0xff4C56AF),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Expanded(
                              child: ListView(
                                padding:
                                    const EdgeInsets
                                        .all(20),

                                children: [

                                  employeeCard(
                                    "Ahmad Subarjo",
                                    "Sudirman Central Business",
                                    "Checked in at 08:42 AM",
                                    "PRESENT",
                                    Colors.green,
                                  ),

                                  employeeCard(
                                    "Budi Raharjo",
                                    "Menteng District",
                                    "Checked in at 09:15 AM",
                                    "LATE",
                                    Colors.orange,
                                  ),

                                  employeeCard(
                                    "Siti Nurhaliza",
                                    "Tanah Abang Square",
                                    "Checked in at 08:30 AM",
                                    "PRESENT",
                                    Colors.green,
                                  ),

                                  employeeCard(
                                    "Dodi Yulianto",
                                    "Kuningan Area",
                                    "No check-in recorded",
                                    "ABSENT",
                                    Colors.red,
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding:
                                  const EdgeInsets
                                      .all(20),

                              child: SizedBox(
                                width: double.infinity,
                                height: 50,

                                child: ElevatedButton(
                                  style:
                                      ElevatedButton
                                          .styleFrom(
                                    backgroundColor:
                                        const Color(
                                            0xff4C56AF),
                                  ),

                                  onPressed: () {},

                                  child: const Text(
                                    "Download Location Report",
                                    style: TextStyle(
                                      color:
                                          Colors.white,
                                      fontWeight:
                                          FontWeight
                                              .bold,
                                    ),
                                  ),
                                ),
                              ),
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
        ],
      ),
    );
  }

  static Widget sidebarItem(
    IconData icon,
    String title, {
    bool isActive = false,
  }) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 4,
      ),

      child: Container(
        decoration: BoxDecoration(
          color: isActive
              ? Colors.white
              : Colors.transparent,

          borderRadius:
              BorderRadius.circular(14),
        ),

        child: ListTile(
          leading: Icon(
            icon,
            color: isActive
                ? const Color(0xff4C56AF)
                : Colors.white,
          ),

          title: Text(
            title,
            style: TextStyle(
              color: isActive
                  ? const Color(0xff4C56AF)
                  : Colors.white,

              fontWeight: FontWeight.bold,
            ),
          ),

          onTap: () {},
        ),
      ),
    );
  }

  static Widget mapButton(
    IconData icon, {
    bool isPrimary = false,
  }) {
    return Container(
      width: 50,
      height: 50,

      decoration: BoxDecoration(
        color: isPrimary
            ? const Color(0xff6A020A)
            : Colors.white,

        borderRadius:
            BorderRadius.circular(14),

        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black12,
          ),
        ],
      ),

      child: Icon(
        icon,
        color: isPrimary
            ? Colors.white
            : const Color(0xff4C56AF),
      ),
    );
  }

  static Widget mapMarker(
    String name,
    Color statusColor,
    Color bgColor,
  ) {
    return Column(
      children: [

        Container(
          padding:
              const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 8,
          ),

          decoration: BoxDecoration(
            color: bgColor,
            borderRadius:
                BorderRadius.circular(30),
          ),

          child: Row(
            children: [

              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(width: 8),

              Container(
                width: 10,
                height: 10,

                decoration: BoxDecoration(
                  color: statusColor,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),

        const Icon(
          Icons.location_on,
          color: Color(0xff6A020A),
          size: 40,
        ),
      ],
    );
  }

  static Widget employeeCard(
    String name,
    String location,
    String time,
    String status,
    Color statusColor,
  ) {
    return Container(
      margin:
          const EdgeInsets.only(bottom: 16),

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(20),

        border: Border.all(
          color: const Color(0xffDFBFBC),
        ),
      ),

      child: Row(
        children: [

          const CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(
              "https://i.pravatar.cc/302",
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween,

                  children: [

                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight:
                            FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    Container(
                      padding:
                          const EdgeInsets
                              .symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),

                      decoration: BoxDecoration(
                        color:
                            statusColor.withAlpha(40),

                        borderRadius:
                            BorderRadius
                                .circular(20),
                      ),

                      child: Text(
                        status,
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 11,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                Text(
                  location,
                  style: const TextStyle(
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 6),

                Row(
                  children: [

                    const Icon(
                      Icons.schedule,
                      size: 16,
                      color: Colors.black45,
                    ),

                    const SizedBox(width: 5),

                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}