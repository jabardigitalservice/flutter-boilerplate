class StringUtils {
  static String enumName(String enumToString) {
    return enumToString.split('.').last;
  }
}