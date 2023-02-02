import 'package:http/http.dart';
import 'package:logger/logger.dart';

class AppLogger {
  static const printServiceLogs = true;
  static final _logger = Logger(printer: PrettyPrinter());

  static void printServiceCall(Response response) {
    List<String> serviceCall = [];
    serviceCall.add("Call ${response.request?.method.toString()}: ${response.request?.url}");
    serviceCall.add("Status: ${response.statusCode}");
    serviceCall.add("Response body: ${response.body}");
    if (printServiceLogs) {
      _logger.d(serviceCall);
    }
  }
}
