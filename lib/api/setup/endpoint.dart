import 'api_host.dart';

class Endpoint {
  String path;
  dynamic data;
  String method;
  String? contentType;
  final Map<String, String> _queryParameters = ApiHost.defaultQuery;

  set queryParameters(Map<String, String> params) {
    _queryParameters.addAll(params);
  }

  Map<String, String> get queryParameters {
    return _queryParameters;
  }

  Endpoint({
    this.data,
    this.contentType,
    Map<String, String>? queryParameters,
    required this.path,
    required this.method,
  }) {
    if (queryParameters != null) {
      this.queryParameters = queryParameters;
    }
  }
}
