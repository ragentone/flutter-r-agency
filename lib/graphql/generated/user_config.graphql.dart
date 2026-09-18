import 'dart:async';

import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$UserConfig {
  Query$UserConfig({this.userLoadConfig, this.$__typename = 'Query'});

  factory Query$UserConfig.fromJson(Map<String, dynamic> json) {
    final l$userLoadConfig = json['userLoadConfig'];
    final l$$__typename = json['__typename'];
    return Query$UserConfig(
      userLoadConfig: l$userLoadConfig == null
          ? null
          : Query$UserConfig$userLoadConfig.fromJson(
              (l$userLoadConfig as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$UserConfig$userLoadConfig? userLoadConfig;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$userLoadConfig = userLoadConfig;
    _resultData['userLoadConfig'] = l$userLoadConfig?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$userLoadConfig = userLoadConfig;
    final l$$__typename = $__typename;
    return Object.hashAll([l$userLoadConfig, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$UserConfig || runtimeType != other.runtimeType) {
      return false;
    }
    final l$userLoadConfig = userLoadConfig;
    final lOther$userLoadConfig = other.userLoadConfig;
    if (l$userLoadConfig != lOther$userLoadConfig) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$UserConfig on Query$UserConfig {
  CopyWith$Query$UserConfig<Query$UserConfig> get copyWith =>
      CopyWith$Query$UserConfig(this, (i) => i);
}

abstract class CopyWith$Query$UserConfig<TRes> {
  factory CopyWith$Query$UserConfig(
    Query$UserConfig instance,
    TRes Function(Query$UserConfig) then,
  ) = _CopyWithImpl$Query$UserConfig;

  factory CopyWith$Query$UserConfig.stub(TRes res) =
      _CopyWithStubImpl$Query$UserConfig;

  TRes call({
    Query$UserConfig$userLoadConfig? userLoadConfig,
    String? $__typename,
  });
  CopyWith$Query$UserConfig$userLoadConfig<TRes> get userLoadConfig;
}

class _CopyWithImpl$Query$UserConfig<TRes>
    implements CopyWith$Query$UserConfig<TRes> {
  _CopyWithImpl$Query$UserConfig(this._instance, this._then);

  final Query$UserConfig _instance;

  final TRes Function(Query$UserConfig) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? userLoadConfig = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$UserConfig(
      userLoadConfig: userLoadConfig == _undefined
          ? _instance.userLoadConfig
          : (userLoadConfig as Query$UserConfig$userLoadConfig?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$UserConfig$userLoadConfig<TRes> get userLoadConfig {
    final local$userLoadConfig = _instance.userLoadConfig;
    return local$userLoadConfig == null
        ? CopyWith$Query$UserConfig$userLoadConfig.stub(_then(_instance))
        : CopyWith$Query$UserConfig$userLoadConfig(
            local$userLoadConfig,
            (e) => call(userLoadConfig: e),
          );
  }
}

class _CopyWithStubImpl$Query$UserConfig<TRes>
    implements CopyWith$Query$UserConfig<TRes> {
  _CopyWithStubImpl$Query$UserConfig(this._res);

  TRes _res;

  call({
    Query$UserConfig$userLoadConfig? userLoadConfig,
    String? $__typename,
  }) => _res;

  CopyWith$Query$UserConfig$userLoadConfig<TRes> get userLoadConfig =>
      CopyWith$Query$UserConfig$userLoadConfig.stub(_res);
}

const documentNodeQueryUserConfig = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'UserConfig'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'userLoadConfig'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'authorized'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'refreshToken'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'userId'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'meta'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'alias'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'avatarUrl'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'teaserUrl'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'lastLogin'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'email'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'role'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'superUser'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'userType'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'settings'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'public'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'searchable'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'showFullName'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'showEmail'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: '__typename'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                          ],
                        ),
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ],
                  ),
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
  ],
);
Query$UserConfig _parserFn$Query$UserConfig(Map<String, dynamic> data) =>
    Query$UserConfig.fromJson(data);
typedef OnQueryComplete$Query$UserConfig = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$UserConfig?,
);

class Options$Query$UserConfig extends graphql.QueryOptions<Query$UserConfig> {
  Options$Query$UserConfig({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$UserConfig? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$UserConfig? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(
                 data,
                 data == null ? null : _parserFn$Query$UserConfig(data),
               ),
         onError: onError,
         document: documentNodeQueryUserConfig,
         parserFn: _parserFn$Query$UserConfig,
       );

  final OnQueryComplete$Query$UserConfig? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$UserConfig
    extends graphql.WatchQueryOptions<Query$UserConfig> {
  WatchOptions$Query$UserConfig({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$UserConfig? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryUserConfig,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$UserConfig,
       );
}

class FetchMoreOptions$Query$UserConfig extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$UserConfig({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryUserConfig);
}

extension ClientExtension$Query$UserConfig on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$UserConfig>> query$UserConfig([
    Options$Query$UserConfig? options,
  ]) async => await this.query(options ?? Options$Query$UserConfig());

  graphql.ObservableQuery<Query$UserConfig> watchQuery$UserConfig([
    WatchOptions$Query$UserConfig? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$UserConfig());

  void writeQuery$UserConfig({
    required Query$UserConfig data,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryUserConfig),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$UserConfig? readQuery$UserConfig({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryUserConfig),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$UserConfig.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$UserConfig> useQuery$UserConfig([
  Options$Query$UserConfig? options,
]) => graphql_flutter.useQuery(options ?? Options$Query$UserConfig());
graphql.ObservableQuery<Query$UserConfig> useWatchQuery$UserConfig([
  WatchOptions$Query$UserConfig? options,
]) => graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$UserConfig());

class Query$UserConfig$Widget extends graphql_flutter.Query<Query$UserConfig> {
  Query$UserConfig$Widget({
    widgets.Key? key,
    Options$Query$UserConfig? options,
    required graphql_flutter.QueryBuilder<Query$UserConfig> builder,
  }) : super(
         key: key,
         options: options ?? Options$Query$UserConfig(),
         builder: builder,
       );
}

class Query$UserConfig$userLoadConfig {
  Query$UserConfig$userLoadConfig({
    this.authorized,
    this.refreshToken,
    this.userId,
    this.meta,
    this.$__typename = 'userLoadConfig',
  });

  factory Query$UserConfig$userLoadConfig.fromJson(Map<String, dynamic> json) {
    final l$authorized = json['authorized'];
    final l$refreshToken = json['refreshToken'];
    final l$userId = json['userId'];
    final l$meta = json['meta'];
    final l$$__typename = json['__typename'];
    return Query$UserConfig$userLoadConfig(
      authorized: (l$authorized as bool?),
      refreshToken: (l$refreshToken as String?),
      userId: (l$userId as String?),
      meta: l$meta == null
          ? null
          : Query$UserConfig$userLoadConfig$meta.fromJson(
              (l$meta as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? authorized;

  final String? refreshToken;

  final String? userId;

  final Query$UserConfig$userLoadConfig$meta? meta;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$authorized = authorized;
    _resultData['authorized'] = l$authorized;
    final l$refreshToken = refreshToken;
    _resultData['refreshToken'] = l$refreshToken;
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$meta = meta;
    _resultData['meta'] = l$meta?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$authorized = authorized;
    final l$refreshToken = refreshToken;
    final l$userId = userId;
    final l$meta = meta;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$authorized,
      l$refreshToken,
      l$userId,
      l$meta,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$UserConfig$userLoadConfig ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$authorized = authorized;
    final lOther$authorized = other.authorized;
    if (l$authorized != lOther$authorized) {
      return false;
    }
    final l$refreshToken = refreshToken;
    final lOther$refreshToken = other.refreshToken;
    if (l$refreshToken != lOther$refreshToken) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    final l$meta = meta;
    final lOther$meta = other.meta;
    if (l$meta != lOther$meta) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$UserConfig$userLoadConfig
    on Query$UserConfig$userLoadConfig {
  CopyWith$Query$UserConfig$userLoadConfig<Query$UserConfig$userLoadConfig>
  get copyWith => CopyWith$Query$UserConfig$userLoadConfig(this, (i) => i);
}

abstract class CopyWith$Query$UserConfig$userLoadConfig<TRes> {
  factory CopyWith$Query$UserConfig$userLoadConfig(
    Query$UserConfig$userLoadConfig instance,
    TRes Function(Query$UserConfig$userLoadConfig) then,
  ) = _CopyWithImpl$Query$UserConfig$userLoadConfig;

  factory CopyWith$Query$UserConfig$userLoadConfig.stub(TRes res) =
      _CopyWithStubImpl$Query$UserConfig$userLoadConfig;

  TRes call({
    bool? authorized,
    String? refreshToken,
    String? userId,
    Query$UserConfig$userLoadConfig$meta? meta,
    String? $__typename,
  });
  CopyWith$Query$UserConfig$userLoadConfig$meta<TRes> get meta;
}

class _CopyWithImpl$Query$UserConfig$userLoadConfig<TRes>
    implements CopyWith$Query$UserConfig$userLoadConfig<TRes> {
  _CopyWithImpl$Query$UserConfig$userLoadConfig(this._instance, this._then);

  final Query$UserConfig$userLoadConfig _instance;

  final TRes Function(Query$UserConfig$userLoadConfig) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? authorized = _undefined,
    Object? refreshToken = _undefined,
    Object? userId = _undefined,
    Object? meta = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$UserConfig$userLoadConfig(
      authorized: authorized == _undefined
          ? _instance.authorized
          : (authorized as bool?),
      refreshToken: refreshToken == _undefined
          ? _instance.refreshToken
          : (refreshToken as String?),
      userId: userId == _undefined ? _instance.userId : (userId as String?),
      meta: meta == _undefined
          ? _instance.meta
          : (meta as Query$UserConfig$userLoadConfig$meta?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$UserConfig$userLoadConfig$meta<TRes> get meta {
    final local$meta = _instance.meta;
    return local$meta == null
        ? CopyWith$Query$UserConfig$userLoadConfig$meta.stub(_then(_instance))
        : CopyWith$Query$UserConfig$userLoadConfig$meta(
            local$meta,
            (e) => call(meta: e),
          );
  }
}

class _CopyWithStubImpl$Query$UserConfig$userLoadConfig<TRes>
    implements CopyWith$Query$UserConfig$userLoadConfig<TRes> {
  _CopyWithStubImpl$Query$UserConfig$userLoadConfig(this._res);

  TRes _res;

  call({
    bool? authorized,
    String? refreshToken,
    String? userId,
    Query$UserConfig$userLoadConfig$meta? meta,
    String? $__typename,
  }) => _res;

  CopyWith$Query$UserConfig$userLoadConfig$meta<TRes> get meta =>
      CopyWith$Query$UserConfig$userLoadConfig$meta.stub(_res);
}

class Query$UserConfig$userLoadConfig$meta {
  Query$UserConfig$userLoadConfig$meta({
    this.id,
    this.alias,
    this.avatarUrl,
    this.teaserUrl,
    this.lastLogin,
    this.email,
    this.role,
    this.superUser,
    this.userType,
    this.settings,
    this.$__typename = 'userMetaData',
  });

  factory Query$UserConfig$userLoadConfig$meta.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$alias = json['alias'];
    final l$avatarUrl = json['avatarUrl'];
    final l$teaserUrl = json['teaserUrl'];
    final l$lastLogin = json['lastLogin'];
    final l$email = json['email'];
    final l$role = json['role'];
    final l$superUser = json['superUser'];
    final l$userType = json['userType'];
    final l$settings = json['settings'];
    final l$$__typename = json['__typename'];
    return Query$UserConfig$userLoadConfig$meta(
      id: (l$id as String?),
      alias: (l$alias as String?),
      avatarUrl: (l$avatarUrl as String?),
      teaserUrl: (l$teaserUrl as String?),
      lastLogin: l$lastLogin == null
          ? null
          : DateTime.parse((l$lastLogin as String)),
      email: (l$email as String?),
      role: (l$role as Map<String, dynamic>?),
      superUser: (l$superUser as bool?),
      userType: (l$userType as String?),
      settings: l$settings == null
          ? null
          : Query$UserConfig$userLoadConfig$meta$settings.fromJson(
              (l$settings as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String? id;

  final String? alias;

  final String? avatarUrl;

  final String? teaserUrl;

  final DateTime? lastLogin;

  final String? email;

  final Map<String, dynamic>? role;

  final bool? superUser;

  final String? userType;

  final Query$UserConfig$userLoadConfig$meta$settings? settings;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$alias = alias;
    _resultData['alias'] = l$alias;
    final l$avatarUrl = avatarUrl;
    _resultData['avatarUrl'] = l$avatarUrl;
    final l$teaserUrl = teaserUrl;
    _resultData['teaserUrl'] = l$teaserUrl;
    final l$lastLogin = lastLogin;
    _resultData['lastLogin'] = l$lastLogin?.toIso8601String();
    final l$email = email;
    _resultData['email'] = l$email;
    final l$role = role;
    _resultData['role'] = l$role;
    final l$superUser = superUser;
    _resultData['superUser'] = l$superUser;
    final l$userType = userType;
    _resultData['userType'] = l$userType;
    final l$settings = settings;
    _resultData['settings'] = l$settings?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$alias = alias;
    final l$avatarUrl = avatarUrl;
    final l$teaserUrl = teaserUrl;
    final l$lastLogin = lastLogin;
    final l$email = email;
    final l$role = role;
    final l$superUser = superUser;
    final l$userType = userType;
    final l$settings = settings;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$alias,
      l$avatarUrl,
      l$teaserUrl,
      l$lastLogin,
      l$email,
      l$role,
      l$superUser,
      l$userType,
      l$settings,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$UserConfig$userLoadConfig$meta ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$alias = alias;
    final lOther$alias = other.alias;
    if (l$alias != lOther$alias) {
      return false;
    }
    final l$avatarUrl = avatarUrl;
    final lOther$avatarUrl = other.avatarUrl;
    if (l$avatarUrl != lOther$avatarUrl) {
      return false;
    }
    final l$teaserUrl = teaserUrl;
    final lOther$teaserUrl = other.teaserUrl;
    if (l$teaserUrl != lOther$teaserUrl) {
      return false;
    }
    final l$lastLogin = lastLogin;
    final lOther$lastLogin = other.lastLogin;
    if (l$lastLogin != lOther$lastLogin) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$role = role;
    final lOther$role = other.role;
    if (l$role != lOther$role) {
      return false;
    }
    final l$superUser = superUser;
    final lOther$superUser = other.superUser;
    if (l$superUser != lOther$superUser) {
      return false;
    }
    final l$userType = userType;
    final lOther$userType = other.userType;
    if (l$userType != lOther$userType) {
      return false;
    }
    final l$settings = settings;
    final lOther$settings = other.settings;
    if (l$settings != lOther$settings) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$UserConfig$userLoadConfig$meta
    on Query$UserConfig$userLoadConfig$meta {
  CopyWith$Query$UserConfig$userLoadConfig$meta<
    Query$UserConfig$userLoadConfig$meta
  >
  get copyWith => CopyWith$Query$UserConfig$userLoadConfig$meta(this, (i) => i);
}

abstract class CopyWith$Query$UserConfig$userLoadConfig$meta<TRes> {
  factory CopyWith$Query$UserConfig$userLoadConfig$meta(
    Query$UserConfig$userLoadConfig$meta instance,
    TRes Function(Query$UserConfig$userLoadConfig$meta) then,
  ) = _CopyWithImpl$Query$UserConfig$userLoadConfig$meta;

  factory CopyWith$Query$UserConfig$userLoadConfig$meta.stub(TRes res) =
      _CopyWithStubImpl$Query$UserConfig$userLoadConfig$meta;

  TRes call({
    String? id,
    String? alias,
    String? avatarUrl,
    String? teaserUrl,
    DateTime? lastLogin,
    String? email,
    Map<String, dynamic>? role,
    bool? superUser,
    String? userType,
    Query$UserConfig$userLoadConfig$meta$settings? settings,
    String? $__typename,
  });
  CopyWith$Query$UserConfig$userLoadConfig$meta$settings<TRes> get settings;
}

class _CopyWithImpl$Query$UserConfig$userLoadConfig$meta<TRes>
    implements CopyWith$Query$UserConfig$userLoadConfig$meta<TRes> {
  _CopyWithImpl$Query$UserConfig$userLoadConfig$meta(
    this._instance,
    this._then,
  );

  final Query$UserConfig$userLoadConfig$meta _instance;

  final TRes Function(Query$UserConfig$userLoadConfig$meta) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? alias = _undefined,
    Object? avatarUrl = _undefined,
    Object? teaserUrl = _undefined,
    Object? lastLogin = _undefined,
    Object? email = _undefined,
    Object? role = _undefined,
    Object? superUser = _undefined,
    Object? userType = _undefined,
    Object? settings = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$UserConfig$userLoadConfig$meta(
      id: id == _undefined ? _instance.id : (id as String?),
      alias: alias == _undefined ? _instance.alias : (alias as String?),
      avatarUrl: avatarUrl == _undefined
          ? _instance.avatarUrl
          : (avatarUrl as String?),
      teaserUrl: teaserUrl == _undefined
          ? _instance.teaserUrl
          : (teaserUrl as String?),
      lastLogin: lastLogin == _undefined
          ? _instance.lastLogin
          : (lastLogin as DateTime?),
      email: email == _undefined ? _instance.email : (email as String?),
      role: role == _undefined
          ? _instance.role
          : (role as Map<String, dynamic>?),
      superUser: superUser == _undefined
          ? _instance.superUser
          : (superUser as bool?),
      userType: userType == _undefined
          ? _instance.userType
          : (userType as String?),
      settings: settings == _undefined
          ? _instance.settings
          : (settings as Query$UserConfig$userLoadConfig$meta$settings?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$UserConfig$userLoadConfig$meta$settings<TRes> get settings {
    final local$settings = _instance.settings;
    return local$settings == null
        ? CopyWith$Query$UserConfig$userLoadConfig$meta$settings.stub(
            _then(_instance),
          )
        : CopyWith$Query$UserConfig$userLoadConfig$meta$settings(
            local$settings,
            (e) => call(settings: e),
          );
  }
}

class _CopyWithStubImpl$Query$UserConfig$userLoadConfig$meta<TRes>
    implements CopyWith$Query$UserConfig$userLoadConfig$meta<TRes> {
  _CopyWithStubImpl$Query$UserConfig$userLoadConfig$meta(this._res);

  TRes _res;

  call({
    String? id,
    String? alias,
    String? avatarUrl,
    String? teaserUrl,
    DateTime? lastLogin,
    String? email,
    Map<String, dynamic>? role,
    bool? superUser,
    String? userType,
    Query$UserConfig$userLoadConfig$meta$settings? settings,
    String? $__typename,
  }) => _res;

  CopyWith$Query$UserConfig$userLoadConfig$meta$settings<TRes> get settings =>
      CopyWith$Query$UserConfig$userLoadConfig$meta$settings.stub(_res);
}

class Query$UserConfig$userLoadConfig$meta$settings {
  Query$UserConfig$userLoadConfig$meta$settings({
    this.public,
    this.searchable,
    this.showFullName,
    this.showEmail,
    this.$__typename = 'userSettings',
  });

  factory Query$UserConfig$userLoadConfig$meta$settings.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$public = json['public'];
    final l$searchable = json['searchable'];
    final l$showFullName = json['showFullName'];
    final l$showEmail = json['showEmail'];
    final l$$__typename = json['__typename'];
    return Query$UserConfig$userLoadConfig$meta$settings(
      public: (l$public as bool?),
      searchable: (l$searchable as bool?),
      showFullName: (l$showFullName as bool?),
      showEmail: (l$showEmail as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? public;

  final bool? searchable;

  final bool? showFullName;

  final bool? showEmail;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$public = public;
    _resultData['public'] = l$public;
    final l$searchable = searchable;
    _resultData['searchable'] = l$searchable;
    final l$showFullName = showFullName;
    _resultData['showFullName'] = l$showFullName;
    final l$showEmail = showEmail;
    _resultData['showEmail'] = l$showEmail;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$public = public;
    final l$searchable = searchable;
    final l$showFullName = showFullName;
    final l$showEmail = showEmail;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$public,
      l$searchable,
      l$showFullName,
      l$showEmail,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$UserConfig$userLoadConfig$meta$settings ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$public = public;
    final lOther$public = other.public;
    if (l$public != lOther$public) {
      return false;
    }
    final l$searchable = searchable;
    final lOther$searchable = other.searchable;
    if (l$searchable != lOther$searchable) {
      return false;
    }
    final l$showFullName = showFullName;
    final lOther$showFullName = other.showFullName;
    if (l$showFullName != lOther$showFullName) {
      return false;
    }
    final l$showEmail = showEmail;
    final lOther$showEmail = other.showEmail;
    if (l$showEmail != lOther$showEmail) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$UserConfig$userLoadConfig$meta$settings
    on Query$UserConfig$userLoadConfig$meta$settings {
  CopyWith$Query$UserConfig$userLoadConfig$meta$settings<
    Query$UserConfig$userLoadConfig$meta$settings
  >
  get copyWith =>
      CopyWith$Query$UserConfig$userLoadConfig$meta$settings(this, (i) => i);
}

abstract class CopyWith$Query$UserConfig$userLoadConfig$meta$settings<TRes> {
  factory CopyWith$Query$UserConfig$userLoadConfig$meta$settings(
    Query$UserConfig$userLoadConfig$meta$settings instance,
    TRes Function(Query$UserConfig$userLoadConfig$meta$settings) then,
  ) = _CopyWithImpl$Query$UserConfig$userLoadConfig$meta$settings;

  factory CopyWith$Query$UserConfig$userLoadConfig$meta$settings.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$UserConfig$userLoadConfig$meta$settings;

  TRes call({
    bool? public,
    bool? searchable,
    bool? showFullName,
    bool? showEmail,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$UserConfig$userLoadConfig$meta$settings<TRes>
    implements CopyWith$Query$UserConfig$userLoadConfig$meta$settings<TRes> {
  _CopyWithImpl$Query$UserConfig$userLoadConfig$meta$settings(
    this._instance,
    this._then,
  );

  final Query$UserConfig$userLoadConfig$meta$settings _instance;

  final TRes Function(Query$UserConfig$userLoadConfig$meta$settings) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? public = _undefined,
    Object? searchable = _undefined,
    Object? showFullName = _undefined,
    Object? showEmail = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$UserConfig$userLoadConfig$meta$settings(
      public: public == _undefined ? _instance.public : (public as bool?),
      searchable: searchable == _undefined
          ? _instance.searchable
          : (searchable as bool?),
      showFullName: showFullName == _undefined
          ? _instance.showFullName
          : (showFullName as bool?),
      showEmail: showEmail == _undefined
          ? _instance.showEmail
          : (showEmail as bool?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$UserConfig$userLoadConfig$meta$settings<TRes>
    implements CopyWith$Query$UserConfig$userLoadConfig$meta$settings<TRes> {
  _CopyWithStubImpl$Query$UserConfig$userLoadConfig$meta$settings(this._res);

  TRes _res;

  call({
    bool? public,
    bool? searchable,
    bool? showFullName,
    bool? showEmail,
    String? $__typename,
  }) => _res;
}
