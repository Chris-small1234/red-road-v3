class Home {
  String? phoneNumber;

  Home.from(Map<String, dynamic> data) {
    phoneNumber = data['phoneNumber'];
  }

  Home.mock() {
    phoneNumber = '(780) 123 - 4567';
  }
  String get phoneLauncherURL => 'tel:$phoneNumber';
}
