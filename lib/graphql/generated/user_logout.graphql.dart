import 'dart:async';

import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$UserLogout {
  Query$UserLogout({this.userLogout, this.$__typename = 'Query'});

  factory Query$UserLogout.fromJson(Map<String, dynamic> json) {
    final l$userLogout = json['userLogout'];
    final l$$__typename = json['__typename'];
    return Query$UserLogout(
      userLogout: l$userLogout == null
          ? null
          : Query$UserLogout$userLogout.fromJson(
              (l$userLogout as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$UserLogout$userLogout? userLogout;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$userLogout = userLogout;
    _resultData['userLogout'] = l$userLogout?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$userLogout = userLogout;
    final l$$__typename = $__typename;
    return Object.hashAll([l$userLogout, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$UserLogout || runtimeType != other.runtimeType) {
      return false;
    }
    final l$userLogout = userLogout;
    final lOther$userLogout = other.userLogout;
    if (l$userLogout != lOther$userLogout) {
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

extension UtilityExtension$Query$UserLogout on Query$UserLogout {
  CopyWith$Query$UserLogout<Query$UserLogout> get copyWith =>
      CopyWith$Query$UserLogout(this, (i) => i);
}

abstract class CopyWith$Query$UserLogout<TRes> {
  factory CopyWith$Query$UserLogout(
    Query$UserLogout instance,
    TRes Function(Query$UserLogout) then,
  ) = _CopyWithImpl$Query$UserLogout;

  factory CopyWith$Query$UserLogout.stub(TRes res) =
      _CopyWithStubImpl$Query$UserLogout;

  TRes call({Query$UserLogout$userLogout? userLogout, String? $__typename});
  CopyWith$Query$UserLogout$userLogout<TRes> get userLogout;
}

class _CopyWithImpl$Query$UserLogout<TRes>
    implements CopyWith$Query$UserLogout<TRes> {
  _CopyWithImpl$Query$UserLogout(this._instance, this._then);

  final Query$UserLogout _instance;

  final TRes Function(Query$UserLogout) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? userLogout = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$UserLogout(
      userLogout: userLogout == _undefined
          ? _instance.userLogout
          : (userLogout as Query$UserLogout$userLogout?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$UserLogout$userLogout<TRes> get userLogout {
    final local$userLogout = _instance.userLogout;
    return local$userLogout == null
        ? CopyWith$Query$UserLogout$userLogout.stub(_then(_instance))
        : CopyWith$Query$UserLogout$userLogout(
            local$userLogout,
            (e) => call(userLogout: e),
          );
  }
}

class _CopyWithStubImpl$Query$UserLogout<TRes>
    implements CopyWith$Query$UserLogout<TRes> {
  _CopyWithStubImpl$Query$UserLogout(this._res);

  TRes _res;

  call({Query$UserLogout$userLogout? userLogout, String? $__typename}) => _res;

  CopyWith$Query$UserLogout$userLogout<TRes> get userLogout =>
      CopyWith$Query$UserLogout$userLogout.stub(_res);
}

const documentNodeQueryUserLogout = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'UserLogout'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'userLogout'),
            alias: null,
            arguments: [],
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
Query$UserLogout _parserFn$Query$UserLogout(Map<String, dynamic> data) =>
    Query$UserLogout.fromJson(data);
typedef OnQueryComplete$Query$UserLogout = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$UserLogout?,
);

class Options$Query$UserLogout extends graphql.QueryOptions<Query$UserLogout> {
  Options$Query$UserLogout({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$UserLogout? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$UserLogout? onComplete,
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
                 data == null ? null : _parserFn$Query$UserLogout(data),
               ),
         onError: onError,
         document: documentNodeQueryUserLogout,
         parserFn: _parserFn$Query$UserLogout,
       );

  final OnQueryComplete$Query$UserLogout? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$UserLogout
    extends graphql.WatchQueryOptions<Query$UserLogout> {
  WatchOptions$Query$UserLogout({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$UserLogout? typedOptimisticResult,
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
         document: documentNodeQueryUserLogout,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$UserLogout,
       );
}

class FetchMoreOptions$Query$UserLogout extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$UserLogout({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryUserLogout);
}

extension ClientExtension$Query$UserLogout on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$UserLogout>> query$UserLogout([
    Options$Query$UserLogout? options,
  ]) async => await this.query(options ?? Options$Query$UserLogout());

  graphql.ObservableQuery<Query$UserLogout> watchQuery$UserLogout([
    WatchOptions$Query$UserLogout? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$UserLogout());

  void writeQuery$UserLogout({
    required Query$UserLogout data,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryUserLogout),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$UserLogout? readQuery$UserLogout({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryUserLogout),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$UserLogout.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$UserLogout> useQuery$UserLogout([
  Options$Query$UserLogout? options,
]) => graphql_flutter.useQuery(options ?? Options$Query$UserLogout());
graphql.ObservableQuery<Query$UserLogout> useWatchQuery$UserLogout([
  WatchOptions$Query$UserLogout? options,
]) => graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$UserLogout());

class Query$UserLogout$Widget extends graphql_flutter.Query<Query$UserLogout> {
  Query$UserLogout$Widget({
    widgets.Key? key,
    Options$Query$UserLogout? options,
    required graphql_flutter.QueryBuilder<Query$UserLogout> builder,
  }) : super(
         key: key,
         options: options ?? Options$Query$UserLogout(),
         builder: builder,
       );
}

class Query$UserLogout$userLogout {
  Query$UserLogout$userLogout({this.success, this.$__typename = 'userLogout'});

  factory Query$UserLogout$userLogout.fromJson(Map<String, dynamic> json) {
    final l$success = json['success'];
    final l$$__typename = json['__typename'];
    return Query$UserLogout$userLogout(
      success: (l$success as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? success;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$success = success;
    _resultData['success'] = l$success;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$success = success;
    final l$$__typename = $__typename;
    return Object.hashAll([l$success, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$UserLogout$userLogout ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$success = success;
    final lOther$success = other.success;
    if (l$success != lOther$success) {
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

extension UtilityExtension$Query$UserLogout$userLogout
    on Query$UserLogout$userLogout {
  CopyWith$Query$UserLogout$userLogout<Query$UserLogout$userLogout>
  get copyWith => CopyWith$Query$UserLogout$userLogout(this, (i) => i);
}

abstract class CopyWith$Query$UserLogout$userLogout<TRes> {
  factory CopyWith$Query$UserLogout$userLogout(
    Query$UserLogout$userLogout instance,
    TRes Function(Query$UserLogout$userLogout) then,
  ) = _CopyWithImpl$Query$UserLogout$userLogout;

  factory CopyWith$Query$UserLogout$userLogout.stub(TRes res) =
      _CopyWithStubImpl$Query$UserLogout$userLogout;

  TRes call({bool? success, String? $__typename});
}

class _CopyWithImpl$Query$UserLogout$userLogout<TRes>
    implements CopyWith$Query$UserLogout$userLogout<TRes> {
  _CopyWithImpl$Query$UserLogout$userLogout(this._instance, this._then);

  final Query$UserLogout$userLogout _instance;

  final TRes Function(Query$UserLogout$userLogout) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? success = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$UserLogout$userLogout(
          success: success == _undefined
              ? _instance.success
              : (success as bool?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );
}

class _CopyWithStubImpl$Query$UserLogout$userLogout<TRes>
    implements CopyWith$Query$UserLogout$userLogout<TRes> {
  _CopyWithStubImpl$Query$UserLogout$userLogout(this._res);

  TRes _res;

  call({bool? success, String? $__typename}) => _res;
}
