class ConfigResponse {
  final bool success;
  final Config config;
  final Map<String, dynamic> actions;
  final String clientId;
  final String deviceId;

  ConfigResponse({
    required this.success,
    required this.config,
    required this.actions,
    required this.clientId,
    required this.deviceId,
  });

  factory ConfigResponse.fromJson(Map<String, dynamic> json) {
    return ConfigResponse(
      success: json['success'] as bool,
      config: Config.fromJson(json['config'] as Map<String, dynamic>),
      actions: json['actions'] as Map<String, dynamic>? ?? {},
      clientId: json['clientId'] as String,
      deviceId: json['deviceId'] as String,
    );
  }
}

class Config {
  final UrlContainer graphql;
  final UrlContainer websocket;
  final UrlContainer api;
  final UrlContainer staticUrl;
  final UrlContainer publicUrl;
  final String frontendUrl;
  final PeerConfig peer;
  final AppSettings app;

  Config({
    required this.graphql,
    required this.websocket,
    required this.api,
    required this.staticUrl,
    required this.publicUrl,
    required this.frontendUrl,
    required this.peer,
    required this.app,
  });

  factory Config.fromJson(Map<String, dynamic> json) {
    return Config(
      graphql: UrlContainer.fromJson(json['graphql'] as Map<String, dynamic>),
      websocket: UrlContainer.fromJson(
        json['websocket'] as Map<String, dynamic>,
      ),
      api: UrlContainer.fromJson(json['api'] as Map<String, dynamic>),
      staticUrl: UrlContainer.fromJson(json['static'] as Map<String, dynamic>),
      publicUrl: UrlContainer.fromJson(json['public'] as Map<String, dynamic>),
      frontendUrl: json['frontendUrl'] as String,
      peer: PeerConfig.fromJson(json['peer'] as Map<String, dynamic>),
      app: AppSettings.fromJson(json['app'] as Map<String, dynamic>),
    );
  }
}

class UrlContainer {
  final String url;

  UrlContainer({required this.url});

  factory UrlContainer.fromJson(Map<String, dynamic> json) {
    return UrlContainer(url: json['url'] as String);
  }
}

class PeerConfig {
  final int port;
  final String host;
  final String path;
  final bool secure;
  final PeerToken token;

  PeerConfig({
    required this.port,
    required this.host,
    required this.path,
    required this.secure,
    required this.token,
  });

  factory PeerConfig.fromJson(Map<String, dynamic> json) {
    return PeerConfig(
      port: json['port'] as int,
      host: json['host'] as String,
      path: json['path'] as String,
      secure: json['secure'] as bool,
      token: PeerToken.fromJson(json['token'] as Map<String, dynamic>),
    );
  }
}

class PeerToken {
  final String clientId;

  PeerToken({required this.clientId});

  factory PeerToken.fromJson(Map<String, dynamic> json) {
    return PeerToken(clientId: json['clientId'] as String);
  }
}

class AppSettings {
  final bool allowLogin;
  final bool allowRegister;
  final bool allowLoginWithGoogle;

  AppSettings({
    required this.allowLogin,
    required this.allowRegister,
    required this.allowLoginWithGoogle,
  });

  factory AppSettings.fromJson(Map<String, dynamic> json) {
    return AppSettings(
      allowLogin: json['allow_login'] as bool,
      allowRegister: json['allow_register'] as bool,
      allowLoginWithGoogle: json['allow_login_with_google'] as bool,
    );
  }
}
