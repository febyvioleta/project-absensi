import 'package:flutter/material.dart';

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
  final jobController = TextEditingController();

  String selectedRole = "Employee";
  String selectedDivision = "Engineering";

  @override
  Widget build(BuildContext context) {
    bool isMobile =
        MediaQuery.of(context).size.width < 768;

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
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Center(
          child: ConstrainedBox(
            constraints:
                const BoxConstraints(
              maxWidth: 1100,
            ),

            child: isMobile
                ? Column(
                    children: [
                      profileCard(),
                      const SizedBox(height: 20),
                      formSection(),
                    ],
                  )
                : Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [
                      Expanded(
                        flex: 1,
                        child: profileCard(),
                      ),

                      const SizedBox(width: 24),

                      Expanded(
                        flex: 2,
                        child: formSection(),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget profileCard() {
    return Container(
      padding: const EdgeInsets.all(24),

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

                child: Container(
                  decoration:
                      const BoxDecoration(
                    color: Color(0xff4C56AF),
                    shape: BoxShape.circle,
                  ),

                  child: IconButton(
                    onPressed: () {},

                    icon: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          const Text(
            "Profile Photo",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          const Text(
            "Upload JPG or PNG",
            textAlign: TextAlign.center,

            style: TextStyle(
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget formSection() {
    return Column(
      children: [
        /// PERSONAL CARD
        Container(
          padding: const EdgeInsets.all(24),

          decoration: BoxDecoration(
            color: Colors.white,

            borderRadius:
                BorderRadius.circular(20),

            boxShadow: [
              BoxShadow(
                color:
                    Colors.black.withOpacity(
                  0.05,
                ),
                blurRadius: 10,
              ),
            ],
          ),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [
              const Text(
                "Personal Identity",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

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

              const Text(
                "Temporary Password",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              TextField(
                controller:
                    passwordController,

                obscureText: isHidden,

                decoration: InputDecoration(
                  border:
                      OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(
                      14,
                    ),
                  ),

                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isHidden = !isHidden;
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
            ],
          ),
        ),

        const SizedBox(height: 24),

        /// EMPLOYMENT CARD
        Container(
          padding: const EdgeInsets.all(24),

          decoration: BoxDecoration(
            color: Colors.white,

            borderRadius:
                BorderRadius.circular(20),

            boxShadow: [
              BoxShadow(
                color:
                    Colors.black.withOpacity(
                  0.05,
                ),
                blurRadius: 10,
              ),
            ],
          ),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [
              const Text(
                "Employment Details",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "System Role",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              DropdownButtonFormField<String>(
                value: selectedRole,

                items: const [
                  DropdownMenuItem(
                    value: "Employee",
                    child: Text("Employee"),
                  ),

                  DropdownMenuItem(
                    value: "Admin",
                    child: Text("Admin"),
                  ),

                  DropdownMenuItem(
                    value: "Manager",
                    child: Text("Manager"),
                  ),
                ],

                onChanged: (value) {
                  setState(() {
                    selectedRole = value!;
                  });
                },

                decoration: InputDecoration(
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

              const Text(
                "Division / Department",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              DropdownButtonFormField<String>(
                value: selectedDivision,

                items: const [
                  DropdownMenuItem(
                    value: "Engineering",
                    child: Text(
                      "Engineering",
                    ),
                  ),

                  DropdownMenuItem(
                    value: "HR",
                    child: Text("HR"),
                  ),

                  DropdownMenuItem(
                    value: "Marketing",
                    child: Text(
                      "Marketing",
                    ),
                  ),

                  DropdownMenuItem(
                    value: "Finance",
                    child: Text("Finance"),
                  ),
                ],

                onChanged: (value) {
                  setState(() {
                    selectedDivision = value!;
                  });
                },

                decoration: InputDecoration(
                  border:
                      OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(
                      14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 30),

        /// BUTTON
        SizedBox(
          width: double.infinity,

          child: ElevatedButton(
            style:
                ElevatedButton.styleFrom(
              backgroundColor:
                  const Color(0xff6A020A),

              padding:
                  const EdgeInsets.symmetric(
                vertical: 18,
              ),

              shape:
                  RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(14),
              ),
            ),

            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(
                const SnackBar(
                  content: Text(
                    "Employee berhasil ditambahkan",
                  ),
                ),
              );

              Navigator.pop(context);
            },

            child: const Text(
              "Save Employee Profile",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildField(
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
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        TextField(
          controller: controller,

          decoration: InputDecoration(
            hintText: hint,

            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(14),
            ),
          ),
        ),
      ],
    );
  }
}