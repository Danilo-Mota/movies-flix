class ApiHost {
  static String versionPath = '3';
  static String get baseURL => 'https://api.themoviedb.org/$versionPath';

  static Map<String, String> get defaultQuery => {
        'api_key': '3b9fba8b00c40dcb824c888f7e7a7405',
        'language': 'pt-BR',
      };
}
