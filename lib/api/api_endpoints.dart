class ApiEndpoints {
  //Auth Endpoints.............................................
  static String logIn = '/api/v1/auth/login';
  static String signUp = '/api/v1/auth/register';
  static String sendOtp = '/api/v1/auth/getOtp';
  static String verifyOtp = '/api/v1/auth/verifyOtp';
  static String refreshToken = '/api/v1/auth/regenerate-token';

  //Home Page Endpoints........................................
  static String allDivision = '/api/v1/user/allDivision';
  static String store = '/api/v1/user/store';
  static String event = '/api/v1/user/event';

  //Social Page Endpoints......................................
  static String post = '/api/v1/user/post';

  // Payment Endpoints.........................................
  static String donation = '/api/v1/user/donation';

  //profile Endpoints..........................................
  static String profile = '/api/v1/user/user';

  //Map Endpoints..............................................
  static String map = '/api/v1/user/getMapLocaton';

  //Get All Organizations......................................
  static String getAllOrganizations = "/api/v1/user/organizations";

  //Get All Details............................................
  static String getAllDetails = "/api/v1/user/organizationsById";
}
