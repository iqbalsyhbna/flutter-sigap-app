class ApiMessage {
  static message(String errorMessage) {
    switch (errorMessage) {
      case 'user not found' :
        return 'Pengguna tidak ditemukan!';

      // case 'Api backend message' :
      //   return 'Your converted message to show for users';

      default:
        return errorMessage;
    }
  }
}