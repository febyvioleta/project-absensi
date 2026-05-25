import 'package:flutter/material.dart';
import 'dashboard_admin.dart';

class AddEmployeePage extends StatefulWidget {
  const AddEmployeePage({super.key});

  @override
  State<AddEmployeePage> createState() =>
      _AddEmployeePageState();
}

class _AddEmployeePageState
    extends State<AddEmployeePage> {

  bool isHidden = true;

  final nameController = TextEditingController();
  final emailController = TextEditingController();

  final passwordController =
      TextEditingController(
    text: "secretpassword123",
  );

  final jobController =
      TextEditingController();

  String selectedRole = "Employee";
  String selectedDivision = "Engineering";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF8F7),

      /// MOBILE DRAWER
      drawer: Drawer(
        child: Container(
          color: const Color(0xff4C56AF),

          child: ListView(
            padding: const EdgeInsets.all(20),

            children: [

              const SizedBox(height: 40),

              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,

                child: Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Admin Portal",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              sidebarItem(
                context,
                Icons.dashboard,
                "Dashboard",
                const AdminDashboard(),
              ),

              sidebarItem(
                context,
                Icons.group,
                "Employees",
                const AddEmployeePage(),
                isActive: true,
              ),

              sidebarItem(
                context,
                Icons.settings,
                "Settings",
                const AdminDashboard(),
              ),
            ],
          ),
        ),
      ),

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

        iconTheme: const IconThemeData(
          color: Color(0xff6A020A),
        ),

        actions: [

          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Color(0xff6A020A),
            ),
          ),

          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: Color(0xff6A020A),
            ),
          ),

          const SizedBox(width: 10),
        ],
      ),

      /// BODY
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {

            bool isMobile =
                constraints.maxWidth < 768;

            /// MOBILE VIEW
            if (isMobile) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    const Text(
                      "Add New Employee",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight:
                            FontWeight.bold,
                        color:
                            Color(0xff6A020A),
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      "Configure workforce credentials and departmental placement.",
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),

                    const SizedBox(height: 24),

                    /// PROFILE
                    Center(
                      child: Stack(
                        children: [

                          const CircleAvatar(
                            radius: 60,

                            backgroundImage:
                                NetworkImage(
                              "https://i.pravatar.cc/300",
                            ),
                          ),

                          Positioned(
                            bottom: 0,
                            right: 0,

                            child: Container(
                              decoration:
                                  const BoxDecoration(
                                color:
                                    Color(0xff4C56AF),

                                shape:
                                    BoxShape.circle,
                              ),

                              child: IconButton(
                                onPressed: () {},

                                icon: const Icon(
                                  Icons.camera_alt,
                                  color:
                                      Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    buildField(
                      "Full Name",
                      "Jonathan Doe",
                      nameController,
                    ),

                    const SizedBox(height: 20),

                    buildField(
                      "Email Address",
                      "jonathan@gmail.com",
                      emailController,
                    ),

                    const SizedBox(height: 20),

                    /// PASSWORD
                    const Text(
                      "Temporary Password",
                      style: TextStyle(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    TextField(
                      controller:
                          passwordController,

                      obscureText:
                          isHidden,

                      decoration:
                          InputDecoration(
                        border:
                            OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(
                            14,
                          ),
                        ),

                        suffixIcon:
                            IconButton(
                          onPressed: () {
                            setState(() {
                              isHidden =
                                  !isHidden;
                            });
                          },

                          icon: Icon(
                            isHidden
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// ROLE
                    const Text(
                      "System Role",
                      style: TextStyle(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    DropdownButtonFormField<
                        String>(
                      value:
                          selectedRole,

                      items: const [

                        DropdownMenuItem(
                          value:
                              "Employee",

                          child:
                              Text(
                            "Employee",
                          ),
                        ),

                        DropdownMenuItem(
                          value:
                              "Admin",

                          child:
                              Text(
                            "Admin",
                          ),
                        ),

                        DropdownMenuItem(
                          value:
                              "Manager",

                          child:
                              Text(
                            "Manager",
                          ),
                        ),
                      ],

                      onChanged:
                          (value) {
                        setState(() {
                          selectedRole =
                              value!;
                        });
                      },

                      decoration:
                          InputDecoration(
                        border:
                            OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(
                            14,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    buildField(
                      "Job Title",
                      "Senior Software Engineer",
                      jobController,
                    ),

                    const SizedBox(height: 20),

                    /// DIVISION
                    const Text(
                      "Division / Department",
                      style: TextStyle(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    DropdownButtonFormField<
                        String>(
                      value:
                          selectedDivision,

                      items: const [

                        DropdownMenuItem(
                          value:
                              "Engineering",

                          child:
                              Text(
                            "Engineering",
                          ),
                        ),

                        DropdownMenuItem(
                          value:
                              "HR",

                          child:
                              Text(
                            "HR",
                          ),
                        ),

                        DropdownMenuItem(
                          value:
                              "Marketing",

                          child:
                              Text(
                            "Marketing",
                          ),
                        ),

                        DropdownMenuItem(
                          value:
                              "Finance",

                          child:
                              Text(
                            "Finance",
                          ),
                        ),
                      ],

                      onChanged:
                          (value) {
                        setState(() {
                          selectedDivision =
                              value!;
                        });
                      },

                      decoration:
                          InputDecoration(
                        border:
                            OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(
                            14,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 55,

                      child: ElevatedButton(
                        style:
                            ElevatedButton
                                .styleFrom(
                          backgroundColor:
                              const Color(
                            0xff6A020A,
                          ),
                        ),

                        onPressed:
                            () {

                          final employeeData = {
                            "name": nameController.text,
                            "email": emailController.text,
                            "role": selectedRole,
                            "division": selectedDivision,
                            "job": jobController.text,
                            "password": passwordController.text,
                          };

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Employee berhasil ditambahkan",
                              ),
                            ),
                          );

                          Navigator.pop(
                            context,
                            employeeData,
                          );
                        },

                        child:
                            const Text(
                          "Save Employee Profile",
                          style:
                              TextStyle(
                            color: Colors.white,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            /// DESKTOP VIEW
            return Row(
              children: [

                /// SIDEBAR
                Container(
                  width: 250,
                  color: const Color(0xff4C56AF),

                  child: Column(
                    children: [

                      const SizedBox(height: 40),

                      const Text(
                        "Admin Portal",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 5),

                      const Text(
                        "WORKFORCE MANAGEMENT",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 11,
                          letterSpacing: 1,
                        ),
                      ),

                      const SizedBox(height: 30),

                      sidebarItem(
                        context,
                        Icons.dashboard,
                        "Dashboard",
                        const AdminDashboard(),
                      ),

                      sidebarItem(
                        context,
                        Icons.group,
                        "Employees",
                        const AddEmployeePage(),
                        isActive: true,
                      ),

                      sidebarItem(
                        context,
                        Icons.settings,
                        "Settings",
                        const AdminDashboard(),
                      ),

                      const Spacer(),

                      Padding(
                        padding:
                            const EdgeInsets.all(
                                16),

                        child: SizedBox(
                          width: double.infinity,
                          height: 50,

                          child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color(
                                0xff6A020A,
                              ),
                            ),

                            onPressed: () {},

                            child: const Text(
                              "Clock In/Out",
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

                /// CONTENT
                Expanded(
                  child: SingleChildScrollView(
                    padding:
                        const EdgeInsets.all(24),

                    child: Center(
                      child: SizedBox(
                        width: 900,

                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                          children: [

                            const Text(
                              "Add New Employee",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight:
                                    FontWeight.bold,
                                color:
                                    Color(0xff6A020A),
                              ),
                            ),

                            const SizedBox(height: 5),

                            const Text(
                              "Configure workforce credentials and departmental placement.",
                              style: TextStyle(
                                color:
                                    Colors.black54,
                              ),
                            ),

                            const SizedBox(height: 30),

                            /// MAIN CARD
                            Row(
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,

                              children: [

                                /// PROFILE PHOTO
                                Expanded(
                                  flex: 1,

                                  child: Container(
                                    padding:
                                        const EdgeInsets
                                            .all(24),

                                    decoration:
                                        BoxDecoration(
                                      color:
                                          Colors.white,

                                      borderRadius:
                                          BorderRadius
                                              .circular(
                                        20,
                                      ),

                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors
                                              .black
                                              .withOpacity(
                                            0.05,
                                          ),

                                          blurRadius:
                                              10,
                                        ),
                                      ],
                                    ),

                                    child: Column(
                                      children: [

                                        Stack(
                                          children: [

                                            const CircleAvatar(
                                              radius: 70,

                                              backgroundImage:
                                                  NetworkImage(
                                                "https://i.pravatar.cc/300",
                                              ),
                                            ),

                                            Positioned(
                                              bottom: 0,
                                              right: 0,

                                              child:
                                                  Container(
                                                decoration:
                                                    const BoxDecoration(
                                                  color:
                                                      Color(
                                                    0xff4C56AF,
                                                  ),

                                                  shape:
                                                      BoxShape.circle,
                                                ),

                                                child:
                                                    IconButton(
                                                  onPressed:
                                                      () {},

                                                  icon:
                                                      const Icon(
                                                    Icons.camera_alt,

                                                    color: Colors
                                                        .white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        const SizedBox(
                                            height: 20),

                                        const Text(
                                          "Profile Photo",
                                          style:
                                              TextStyle(
                                            fontWeight:
                                                FontWeight
                                                    .bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 24),

                                /// FORM
                                Expanded(
                                  flex: 2,

                                  child: Column(
                                    children: [

                                      /// PERSONAL CARD
                                      Container(
                                        padding:
                                            const EdgeInsets
                                                .all(24),

                                        decoration:
                                            BoxDecoration(
                                          color:
                                              Colors
                                                  .white,

                                          borderRadius:
                                              BorderRadius
                                                  .circular(
                                            20,
                                          ),

                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors
                                                  .black
                                                  .withOpacity(
                                                0.05,
                                              ),

                                              blurRadius:
                                                  10,
                                            ),
                                          ],
                                        ),

                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,

                                          children: [

                                            const Text(
                                              "Personal Identity",
                                              style:
                                                  TextStyle(
                                                fontSize:
                                                    22,

                                                fontWeight:
                                                    FontWeight
                                                        .bold,
                                              ),
                                            ),

                                            const SizedBox(
                                                height:
                                                    20),

                                            buildField(
                                              "Full Name",
                                              "Jonathan Doe",
                                              nameController,
                                            ),

                                            const SizedBox(
                                                height:
                                                    20),

                                            buildField(
                                              "Email Address",
                                              "jonathan@gmail.com",
                                              emailController,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  /// SIDEBAR ITEM
  static Widget sidebarItem(
    BuildContext context,
    IconData icon,
    String title,
    Widget page, {
    bool isActive = false,
  }) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),

      child: Container(
        decoration: BoxDecoration(
          color: isActive
              ? Colors.white
              : Colors.transparent,

          borderRadius:
              BorderRadius.circular(12),
        ),

        child: ListTile(
          leading: Icon(
            icon,

            color: isActive
                ? const Color(
                    0xff4C56AF)
                : Colors.white,
          ),

          title: Text(
            title,

            style: TextStyle(
              color: isActive
                  ? const Color(
                      0xff4C56AF)
                  : Colors.white,

              fontWeight:
                  FontWeight.bold,
            ),
          ),

          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => page,
              ),
            );
          },
        ),
      ),
    );
  }

  /// TEXT FIELD
  static Widget buildField(
    String label,
    String hint,
    TextEditingController controller,
  ) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [

        Text(
          label,

          style: const TextStyle(
            fontWeight:
                FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        TextField(
          controller: controller,

          decoration: InputDecoration(
            hintText: hint,

            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(
                14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}