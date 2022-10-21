class Endpoints {
  static const baseUrl = 'https://www.mymockapi.com/api'; // Removed actual endpoint

  static String postLogin(String username, String password) {
    final path = '$baseUrl/auth/generate_auth_cookie?username=$username&password=$password';

    return path;
  }

  static String postLead(String cookie) {
    final path = '$baseUrl/gemstonev2/get_leads?cookie=$cookie';

    return path;
  }
}
