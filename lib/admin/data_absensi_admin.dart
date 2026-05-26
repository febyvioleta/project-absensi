class AttendanceAdminModel {
  final String name;
  final String role;
  final String checkIn;
  final String checkOut;
  final String status;

  AttendanceAdminModel({
    required this.name,
    required this.role,
    required this.checkIn,
    required this.checkOut,
    required this.status,
  });
}

List<AttendanceAdminModel> attendanceAdminList = [];