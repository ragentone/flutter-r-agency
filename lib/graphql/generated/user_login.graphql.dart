import '../../generated/schema.graphql.dart';

import 'dart:async';

import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$UserLogin {
  factory Variables$Mutation$UserLogin({
    required Input$userLoginParams params,
  }) => Variables$Mutation$UserLogin._({r'params': params});

  Variables$Mutation$UserLogin._(this._$data);

  factory Variables$Mutation$UserLogin.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$params = data['params'];
    result$data['params'] = Input$userLoginParams.fromJson(
      (l$params as Map<String, dynamic>),
    );
    return Variables$Mutation$UserLogin._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$userLoginParams get params =>
      (_$data['params'] as Input$userLoginParams);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$params = params;
    result$data['params'] = l$params.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$UserLogin<Variables$Mutation$UserLogin>
  get copyWith => CopyWith$Variables$Mutation$UserLogin(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UserLogin ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$params = params;
    final lOther$params = other.params;
    if (l$params != lOther$params) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$params = params;
    return Object.hashAll([l$params]);
  }
}

abstract class CopyWith$Variables$Mutation$UserLogin<TRes> {
  factory CopyWith$Variables$Mutation$UserLogin(
    Variables$Mutation$UserLogin instance,
    TRes Function(Variables$Mutation$UserLogin) then,
  ) = _CopyWithImpl$Variables$Mutation$UserLogin;

  factory CopyWith$Variables$Mutation$UserLogin.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UserLogin;

  TRes call({Input$userLoginParams? params});
}

class _CopyWithImpl$Variables$Mutation$UserLogin<TRes>
    implements CopyWith$Variables$Mutation$UserLogin<TRes> {
  _CopyWithImpl$Variables$Mutation$UserLogin(this._instance, this._then);

  final Variables$Mutation$UserLogin _instance;

  final TRes Function(Variables$Mutation$UserLogin) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? params = _undefined}) => _then(
    Variables$Mutation$UserLogin._({
      ..._instance._$data,
      if (params != _undefined && params != null)
        'params': (params as Input$userLoginParams),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$UserLogin<TRes>
    implements CopyWith$Variables$Mutation$UserLogin<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UserLogin(this._res);

  TRes _res;

  call({Input$userLoginParams? params}) => _res;
}

class Mutation$UserLogin {
  Mutation$UserLogin({this.userLogin, this.$__typename = 'Mutation'});

  factory Mutation$UserLogin.fromJson(Map<String, dynamic> json) {
    final l$userLogin = json['userLogin'];
    final l$$__typename = json['__typename'];
    return Mutation$UserLogin(
      userLogin: l$userLogin == null
          ? null
          : Mutation$UserLogin$userLogin.fromJson(
              (l$userLogin as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UserLogin$userLogin? userLogin;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$userLogin = userLogin;
    _resultData['userLogin'] = l$userLogin?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$userLogin = userLogin;
    final l$$__typename = $__typename;
    return Object.hashAll([l$userLogin, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UserLogin || runtimeType != other.runtimeType) {
      return false;
    }
    final l$userLogin = userLogin;
    final lOther$userLogin = other.userLogin;
    if (l$userLogin != lOther$userLogin) {
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

extension UtilityExtension$Mutation$UserLogin on Mutation$UserLogin {
  CopyWith$Mutation$UserLogin<Mutation$UserLogin> get copyWith =>
      CopyWith$Mutation$UserLogin(this, (i) => i);
}

abstract class CopyWith$Mutation$UserLogin<TRes> {
  factory CopyWith$Mutation$UserLogin(
    Mutation$UserLogin instance,
    TRes Function(Mutation$UserLogin) then,
  ) = _CopyWithImpl$Mutation$UserLogin;

  factory CopyWith$Mutation$UserLogin.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UserLogin;

  TRes call({Mutation$UserLogin$userLogin? userLogin, String? $__typename});
  CopyWith$Mutation$UserLogin$userLogin<TRes> get userLogin;
}

class _CopyWithImpl$Mutation$UserLogin<TRes>
    implements CopyWith$Mutation$UserLogin<TRes> {
  _CopyWithImpl$Mutation$UserLogin(this._instance, this._then);

  final Mutation$UserLogin _instance;

  final TRes Function(Mutation$UserLogin) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? userLogin = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UserLogin(
      userLogin: userLogin == _undefined
          ? _instance.userLogin
          : (userLogin as Mutation$UserLogin$userLogin?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$UserLogin$userLogin<TRes> get userLogin {
    final local$userLogin = _instance.userLogin;
    return local$userLogin == null
        ? CopyWith$Mutation$UserLogin$userLogin.stub(_then(_instance))
        : CopyWith$Mutation$UserLogin$userLogin(
            local$userLogin,
            (e) => call(userLogin: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$UserLogin<TRes>
    implements CopyWith$Mutation$UserLogin<TRes> {
  _CopyWithStubImpl$Mutation$UserLogin(this._res);

  TRes _res;

  call({Mutation$UserLogin$userLogin? userLogin, String? $__typename}) => _res;

  CopyWith$Mutation$UserLogin$userLogin<TRes> get userLogin =>
      CopyWith$Mutation$UserLogin$userLogin.stub(_res);
}

const documentNodeMutationUserLogin = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UserLogin'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'params')),
          type: NamedTypeNode(
            name: NameNode(value: 'userLoginParams'),
            isNonNull: true,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'userLogin'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'params'),
                value: VariableNode(name: NameNode(value: 'params')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'success'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'authToken'),
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
Mutation$UserLogin _parserFn$Mutation$UserLogin(Map<String, dynamic> data) =>
    Mutation$UserLogin.fromJson(data);
typedef OnMutationCompleted$Mutation$UserLogin = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$UserLogin?,
);

class Options$Mutation$UserLogin
    extends graphql.MutationOptions<Mutation$UserLogin> {
  Options$Mutation$UserLogin({
    String? operationName,
    required Variables$Mutation$UserLogin variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UserLogin? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UserLogin? onCompleted,
    graphql.OnMutationUpdate<Mutation$UserLogin>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFn$Mutation$UserLogin(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUserLogin,
         parserFn: _parserFn$Mutation$UserLogin,
       );

  final OnMutationCompleted$Mutation$UserLogin? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$UserLogin
    extends graphql.WatchQueryOptions<Mutation$UserLogin> {
  WatchOptions$Mutation$UserLogin({
    String? operationName,
    required Variables$Mutation$UserLogin variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UserLogin? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationUserLogin,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$UserLogin,
       );
}

extension ClientExtension$Mutation$UserLogin on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UserLogin>> mutate$UserLogin(
    Options$Mutation$UserLogin options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$UserLogin> watchMutation$UserLogin(
    WatchOptions$Mutation$UserLogin options,
  ) => this.watchMutation(options);
}

class Mutation$UserLogin$HookResult {
  Mutation$UserLogin$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$UserLogin runMutation;

  final graphql.QueryResult<Mutation$UserLogin> result;
}

Mutation$UserLogin$HookResult useMutation$UserLogin([
  WidgetOptions$Mutation$UserLogin? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$UserLogin(),
  );
  return Mutation$UserLogin$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UserLogin> useWatchMutation$UserLogin(
  WatchOptions$Mutation$UserLogin options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UserLogin
    extends graphql.MutationOptions<Mutation$UserLogin> {
  WidgetOptions$Mutation$UserLogin({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UserLogin? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UserLogin? onCompleted,
    graphql.OnMutationUpdate<Mutation$UserLogin>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFn$Mutation$UserLogin(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUserLogin,
         parserFn: _parserFn$Mutation$UserLogin,
       );

  final OnMutationCompleted$Mutation$UserLogin? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$UserLogin =
    graphql.MultiSourceResult<Mutation$UserLogin> Function(
      Variables$Mutation$UserLogin, {
      Object? optimisticResult,
      Mutation$UserLogin? typedOptimisticResult,
    });
typedef Builder$Mutation$UserLogin = widgets.Widget Function(
  RunMutation$Mutation$UserLogin,
  graphql.QueryResult<Mutation$UserLogin>?,
);

class Mutation$UserLogin$Widget
    extends graphql_flutter.Mutation<Mutation$UserLogin> {
  Mutation$UserLogin$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UserLogin? options,
    required Builder$Mutation$UserLogin builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$UserLogin(),
         builder: (run, result) => builder(
           (variables, {optimisticResult, typedOptimisticResult}) => run(
             variables.toJson(),
             optimisticResult:
                 optimisticResult ?? typedOptimisticResult?.toJson(),
           ),
           result,
         ),
       );
}

class Mutation$UserLogin$userLogin {
  Mutation$UserLogin$userLogin({
    this.success,
    this.authToken,
    this.userId,
    this.$__typename = 'userLoginReturn',
  });

  factory Mutation$UserLogin$userLogin.fromJson(Map<String, dynamic> json) {
    final l$success = json['success'];
    final l$authToken = json['authToken'];
    final l$userId = json['userId'];
    final l$$__typename = json['__typename'];
    return Mutation$UserLogin$userLogin(
      success: (l$success as bool?),
      authToken: (l$authToken as String?),
      userId: (l$userId as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? success;

  final String? authToken;

  final String? userId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$success = success;
    _resultData['success'] = l$success;
    final l$authToken = authToken;
    _resultData['authToken'] = l$authToken;
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$success = success;
    final l$authToken = authToken;
    final l$userId = userId;
    final l$$__typename = $__typename;
    return Object.hashAll([l$success, l$authToken, l$userId, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UserLogin$userLogin ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$success = success;
    final lOther$success = other.success;
    if (l$success != lOther$success) {
      return false;
    }
    final l$authToken = authToken;
    final lOther$authToken = other.authToken;
    if (l$authToken != lOther$authToken) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
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

extension UtilityExtension$Mutation$UserLogin$userLogin
    on Mutation$UserLogin$userLogin {
  CopyWith$Mutation$UserLogin$userLogin<Mutation$UserLogin$userLogin>
  get copyWith => CopyWith$Mutation$UserLogin$userLogin(this, (i) => i);
}

abstract class CopyWith$Mutation$UserLogin$userLogin<TRes> {
  factory CopyWith$Mutation$UserLogin$userLogin(
    Mutation$UserLogin$userLogin instance,
    TRes Function(Mutation$UserLogin$userLogin) then,
  ) = _CopyWithImpl$Mutation$UserLogin$userLogin;

  factory CopyWith$Mutation$UserLogin$userLogin.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UserLogin$userLogin;

  TRes call({
    bool? success,
    String? authToken,
    String? userId,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UserLogin$userLogin<TRes>
    implements CopyWith$Mutation$UserLogin$userLogin<TRes> {
  _CopyWithImpl$Mutation$UserLogin$userLogin(this._instance, this._then);

  final Mutation$UserLogin$userLogin _instance;

  final TRes Function(Mutation$UserLogin$userLogin) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? success = _undefined,
    Object? authToken = _undefined,
    Object? userId = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UserLogin$userLogin(
      success: success == _undefined ? _instance.success : (success as bool?),
      authToken: authToken == _undefined
          ? _instance.authToken
          : (authToken as String?),
      userId: userId == _undefined ? _instance.userId : (userId as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$UserLogin$userLogin<TRes>
    implements CopyWith$Mutation$UserLogin$userLogin<TRes> {
  _CopyWithStubImpl$Mutation$UserLogin$userLogin(this._res);

  TRes _res;

  call({
    bool? success,
    String? authToken,
    String? userId,
    String? $__typename,
  }) => _res;
}
