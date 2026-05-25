class AttendanceModel {
  final String name;
  final String role;
  final String checkIn;
  final String checkOut;
  final String status;

  AttendanceModel({
    required this.name,
    required this.role,
    required this.checkIn,
    required this.checkOut,
    required this.status,
  });
}

List<AttendanceModel> attendanceList = [
  AttendanceModel(
    name: "Jane Doe",
    role: "UI/UX Designer",
    checkIn: "08:55 AM",
    checkOut: "05:05 PM",
    status: "Present",
  ),

  AttendanceModel(
    name: "Mark Smith",
    role: "Backend Dev",
    checkIn: "09:15 AM",
    checkOut: "06:00 PM",
    status: "Late",
  ),

  AttendanceModel(
    name: "Bruce Wayne",
    role: "Project Lead",
    checkIn: "--:--",
    checkOut: "--:--",
    status: "Absent",
  ),
];