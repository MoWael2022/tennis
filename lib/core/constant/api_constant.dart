class Constant {
  static const String _apikey = "d2f0fce600d14115ae6165632242909";
  static const String _baseUrl = "https://api.weatherapi.com/v1";

  static String getWeatherData(String countryName) =>
      "$_baseUrl/forecast.json?q=$countryName&days=7&key=$_apikey";
}
