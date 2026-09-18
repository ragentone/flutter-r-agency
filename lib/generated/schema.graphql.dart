class Input$accountUpdateData {
  factory Input$accountUpdateData({
    required String id,
    required String alias,
    required String gender,
    String? birthday,
    Input$userDetailsInput? details,
    required Input$userDescriptionInput description,
    required Input$userSettingsInput settings,
  }) => Input$accountUpdateData._({
    r'id': id,
    r'alias': alias,
    r'gender': gender,
    if (birthday != null) r'birthday': birthday,
    if (details != null) r'details': details,
    r'description': description,
    r'settings': settings,
  });

  Input$accountUpdateData._(this._$data);

  factory Input$accountUpdateData.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$alias = data['alias'];
    result$data['alias'] = (l$alias as String);
    final l$gender = data['gender'];
    result$data['gender'] = (l$gender as String);
    if (data.containsKey('birthday')) {
      final l$birthday = data['birthday'];
      result$data['birthday'] = (l$birthday as String?);
    }
    if (data.containsKey('details')) {
      final l$details = data['details'];
      result$data['details'] = l$details == null
          ? null
          : Input$userDetailsInput.fromJson(
              (l$details as Map<String, dynamic>),
            );
    }
    final l$description = data['description'];
    result$data['description'] = Input$userDescriptionInput.fromJson(
      (l$description as Map<String, dynamic>),
    );
    final l$settings = data['settings'];
    result$data['settings'] = Input$userSettingsInput.fromJson(
      (l$settings as Map<String, dynamic>),
    );
    return Input$accountUpdateData._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String get alias => (_$data['alias'] as String);

  String get gender => (_$data['gender'] as String);

  String? get birthday => (_$data['birthday'] as String?);

  Input$userDetailsInput? get details =>
      (_$data['details'] as Input$userDetailsInput?);

  Input$userDescriptionInput get description =>
      (_$data['description'] as Input$userDescriptionInput);

  Input$userSettingsInput get settings =>
      (_$data['settings'] as Input$userSettingsInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$alias = alias;
    result$data['alias'] = l$alias;
    final l$gender = gender;
    result$data['gender'] = l$gender;
    if (_$data.containsKey('birthday')) {
      final l$birthday = birthday;
      result$data['birthday'] = l$birthday;
    }
    if (_$data.containsKey('details')) {
      final l$details = details;
      result$data['details'] = l$details?.toJson();
    }
    final l$description = description;
    result$data['description'] = l$description.toJson();
    final l$settings = settings;
    result$data['settings'] = l$settings.toJson();
    return result$data;
  }

  CopyWith$Input$accountUpdateData<Input$accountUpdateData> get copyWith =>
      CopyWith$Input$accountUpdateData(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$accountUpdateData || runtimeType != other.runtimeType) {
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
    final l$gender = gender;
    final lOther$gender = other.gender;
    if (l$gender != lOther$gender) {
      return false;
    }
    final l$birthday = birthday;
    final lOther$birthday = other.birthday;
    if (_$data.containsKey('birthday') !=
        other._$data.containsKey('birthday')) {
      return false;
    }
    if (l$birthday != lOther$birthday) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (_$data.containsKey('details') != other._$data.containsKey('details')) {
      return false;
    }
    if (l$details != lOther$details) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$settings = settings;
    final lOther$settings = other.settings;
    if (l$settings != lOther$settings) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$alias = alias;
    final l$gender = gender;
    final l$birthday = birthday;
    final l$details = details;
    final l$description = description;
    final l$settings = settings;
    return Object.hashAll([
      l$id,
      l$alias,
      l$gender,
      _$data.containsKey('birthday') ? l$birthday : const {},
      _$data.containsKey('details') ? l$details : const {},
      l$description,
      l$settings,
    ]);
  }
}

abstract class CopyWith$Input$accountUpdateData<TRes> {
  factory CopyWith$Input$accountUpdateData(
    Input$accountUpdateData instance,
    TRes Function(Input$accountUpdateData) then,
  ) = _CopyWithImpl$Input$accountUpdateData;

  factory CopyWith$Input$accountUpdateData.stub(TRes res) =
      _CopyWithStubImpl$Input$accountUpdateData;

  TRes call({
    String? id,
    String? alias,
    String? gender,
    String? birthday,
    Input$userDetailsInput? details,
    Input$userDescriptionInput? description,
    Input$userSettingsInput? settings,
  });
  CopyWith$Input$userDetailsInput<TRes> get details;
  CopyWith$Input$userDescriptionInput<TRes> get description;
  CopyWith$Input$userSettingsInput<TRes> get settings;
}

class _CopyWithImpl$Input$accountUpdateData<TRes>
    implements CopyWith$Input$accountUpdateData<TRes> {
  _CopyWithImpl$Input$accountUpdateData(this._instance, this._then);

  final Input$accountUpdateData _instance;

  final TRes Function(Input$accountUpdateData) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? alias = _undefined,
    Object? gender = _undefined,
    Object? birthday = _undefined,
    Object? details = _undefined,
    Object? description = _undefined,
    Object? settings = _undefined,
  }) => _then(
    Input$accountUpdateData._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (alias != _undefined && alias != null) 'alias': (alias as String),
      if (gender != _undefined && gender != null) 'gender': (gender as String),
      if (birthday != _undefined) 'birthday': (birthday as String?),
      if (details != _undefined)
        'details': (details as Input$userDetailsInput?),
      if (description != _undefined && description != null)
        'description': (description as Input$userDescriptionInput),
      if (settings != _undefined && settings != null)
        'settings': (settings as Input$userSettingsInput),
    }),
  );

  CopyWith$Input$userDetailsInput<TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Input$userDetailsInput.stub(_then(_instance))
        : CopyWith$Input$userDetailsInput(
            local$details,
            (e) => call(details: e),
          );
  }

  CopyWith$Input$userDescriptionInput<TRes> get description {
    final local$description = _instance.description;
    return CopyWith$Input$userDescriptionInput(
      local$description,
      (e) => call(description: e),
    );
  }

  CopyWith$Input$userSettingsInput<TRes> get settings {
    final local$settings = _instance.settings;
    return CopyWith$Input$userSettingsInput(
      local$settings,
      (e) => call(settings: e),
    );
  }
}

class _CopyWithStubImpl$Input$accountUpdateData<TRes>
    implements CopyWith$Input$accountUpdateData<TRes> {
  _CopyWithStubImpl$Input$accountUpdateData(this._res);

  TRes _res;

  call({
    String? id,
    String? alias,
    String? gender,
    String? birthday,
    Input$userDetailsInput? details,
    Input$userDescriptionInput? description,
    Input$userSettingsInput? settings,
  }) => _res;

  CopyWith$Input$userDetailsInput<TRes> get details =>
      CopyWith$Input$userDetailsInput.stub(_res);

  CopyWith$Input$userDescriptionInput<TRes> get description =>
      CopyWith$Input$userDescriptionInput.stub(_res);

  CopyWith$Input$userSettingsInput<TRes> get settings =>
      CopyWith$Input$userSettingsInput.stub(_res);
}

class Input$currencyParams {
  factory Input$currencyParams({
    required String base,
    double? amount,
    String? symbols,
  }) => Input$currencyParams._({
    r'base': base,
    if (amount != null) r'amount': amount,
    if (symbols != null) r'symbols': symbols,
  });

  Input$currencyParams._(this._$data);

  factory Input$currencyParams.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$base = data['base'];
    result$data['base'] = (l$base as String);
    if (data.containsKey('amount')) {
      final l$amount = data['amount'];
      result$data['amount'] = (l$amount as num?)?.toDouble();
    }
    if (data.containsKey('symbols')) {
      final l$symbols = data['symbols'];
      result$data['symbols'] = (l$symbols as String?);
    }
    return Input$currencyParams._(result$data);
  }

  Map<String, dynamic> _$data;

  String get base => (_$data['base'] as String);

  double? get amount => (_$data['amount'] as double?);

  String? get symbols => (_$data['symbols'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$base = base;
    result$data['base'] = l$base;
    if (_$data.containsKey('amount')) {
      final l$amount = amount;
      result$data['amount'] = l$amount;
    }
    if (_$data.containsKey('symbols')) {
      final l$symbols = symbols;
      result$data['symbols'] = l$symbols;
    }
    return result$data;
  }

  CopyWith$Input$currencyParams<Input$currencyParams> get copyWith =>
      CopyWith$Input$currencyParams(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$currencyParams || runtimeType != other.runtimeType) {
      return false;
    }
    final l$base = base;
    final lOther$base = other.base;
    if (l$base != lOther$base) {
      return false;
    }
    final l$amount = amount;
    final lOther$amount = other.amount;
    if (_$data.containsKey('amount') != other._$data.containsKey('amount')) {
      return false;
    }
    if (l$amount != lOther$amount) {
      return false;
    }
    final l$symbols = symbols;
    final lOther$symbols = other.symbols;
    if (_$data.containsKey('symbols') != other._$data.containsKey('symbols')) {
      return false;
    }
    if (l$symbols != lOther$symbols) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$base = base;
    final l$amount = amount;
    final l$symbols = symbols;
    return Object.hashAll([
      l$base,
      _$data.containsKey('amount') ? l$amount : const {},
      _$data.containsKey('symbols') ? l$symbols : const {},
    ]);
  }
}

abstract class CopyWith$Input$currencyParams<TRes> {
  factory CopyWith$Input$currencyParams(
    Input$currencyParams instance,
    TRes Function(Input$currencyParams) then,
  ) = _CopyWithImpl$Input$currencyParams;

  factory CopyWith$Input$currencyParams.stub(TRes res) =
      _CopyWithStubImpl$Input$currencyParams;

  TRes call({String? base, double? amount, String? symbols});
}

class _CopyWithImpl$Input$currencyParams<TRes>
    implements CopyWith$Input$currencyParams<TRes> {
  _CopyWithImpl$Input$currencyParams(this._instance, this._then);

  final Input$currencyParams _instance;

  final TRes Function(Input$currencyParams) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? base = _undefined,
    Object? amount = _undefined,
    Object? symbols = _undefined,
  }) => _then(
    Input$currencyParams._({
      ..._instance._$data,
      if (base != _undefined && base != null) 'base': (base as String),
      if (amount != _undefined) 'amount': (amount as double?),
      if (symbols != _undefined) 'symbols': (symbols as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$currencyParams<TRes>
    implements CopyWith$Input$currencyParams<TRes> {
  _CopyWithStubImpl$Input$currencyParams(this._res);

  TRes _res;

  call({String? base, double? amount, String? symbols}) => _res;
}

class Input$dbFilter {
  factory Input$dbFilter({
    required String field,
    required String value,
    required Enum$dbFilter_enum type,
  }) => Input$dbFilter._({r'field': field, r'value': value, r'type': type});

  Input$dbFilter._(this._$data);

  factory Input$dbFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$field = data['field'];
    result$data['field'] = (l$field as String);
    final l$value = data['value'];
    result$data['value'] = (l$value as String);
    final l$type = data['type'];
    result$data['type'] = fromJson$Enum$dbFilter_enum((l$type as String));
    return Input$dbFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  String get field => (_$data['field'] as String);

  String get value => (_$data['value'] as String);

  Enum$dbFilter_enum get type => (_$data['type'] as Enum$dbFilter_enum);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$field = field;
    result$data['field'] = l$field;
    final l$value = value;
    result$data['value'] = l$value;
    final l$type = type;
    result$data['type'] = toJson$Enum$dbFilter_enum(l$type);
    return result$data;
  }

  CopyWith$Input$dbFilter<Input$dbFilter> get copyWith =>
      CopyWith$Input$dbFilter(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$dbFilter || runtimeType != other.runtimeType) {
      return false;
    }
    final l$field = field;
    final lOther$field = other.field;
    if (l$field != lOther$field) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$field = field;
    final l$value = value;
    final l$type = type;
    return Object.hashAll([l$field, l$value, l$type]);
  }
}

abstract class CopyWith$Input$dbFilter<TRes> {
  factory CopyWith$Input$dbFilter(
    Input$dbFilter instance,
    TRes Function(Input$dbFilter) then,
  ) = _CopyWithImpl$Input$dbFilter;

  factory CopyWith$Input$dbFilter.stub(TRes res) =
      _CopyWithStubImpl$Input$dbFilter;

  TRes call({String? field, String? value, Enum$dbFilter_enum? type});
}

class _CopyWithImpl$Input$dbFilter<TRes>
    implements CopyWith$Input$dbFilter<TRes> {
  _CopyWithImpl$Input$dbFilter(this._instance, this._then);

  final Input$dbFilter _instance;

  final TRes Function(Input$dbFilter) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? field = _undefined,
    Object? value = _undefined,
    Object? type = _undefined,
  }) => _then(
    Input$dbFilter._({
      ..._instance._$data,
      if (field != _undefined && field != null) 'field': (field as String),
      if (value != _undefined && value != null) 'value': (value as String),
      if (type != _undefined && type != null)
        'type': (type as Enum$dbFilter_enum),
    }),
  );
}

class _CopyWithStubImpl$Input$dbFilter<TRes>
    implements CopyWith$Input$dbFilter<TRes> {
  _CopyWithStubImpl$Input$dbFilter(this._res);

  TRes _res;

  call({String? field, String? value, Enum$dbFilter_enum? type}) => _res;
}

class Input$dbOrder {
  factory Input$dbOrder({
    required String field,
    required Enum$dbOrder_enum type,
  }) => Input$dbOrder._({r'field': field, r'type': type});

  Input$dbOrder._(this._$data);

  factory Input$dbOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$field = data['field'];
    result$data['field'] = (l$field as String);
    final l$type = data['type'];
    result$data['type'] = fromJson$Enum$dbOrder_enum((l$type as String));
    return Input$dbOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  String get field => (_$data['field'] as String);

  Enum$dbOrder_enum get type => (_$data['type'] as Enum$dbOrder_enum);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$field = field;
    result$data['field'] = l$field;
    final l$type = type;
    result$data['type'] = toJson$Enum$dbOrder_enum(l$type);
    return result$data;
  }

  CopyWith$Input$dbOrder<Input$dbOrder> get copyWith =>
      CopyWith$Input$dbOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$dbOrder || runtimeType != other.runtimeType) {
      return false;
    }
    final l$field = field;
    final lOther$field = other.field;
    if (l$field != lOther$field) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$field = field;
    final l$type = type;
    return Object.hashAll([l$field, l$type]);
  }
}

abstract class CopyWith$Input$dbOrder<TRes> {
  factory CopyWith$Input$dbOrder(
    Input$dbOrder instance,
    TRes Function(Input$dbOrder) then,
  ) = _CopyWithImpl$Input$dbOrder;

  factory CopyWith$Input$dbOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$dbOrder;

  TRes call({String? field, Enum$dbOrder_enum? type});
}

class _CopyWithImpl$Input$dbOrder<TRes>
    implements CopyWith$Input$dbOrder<TRes> {
  _CopyWithImpl$Input$dbOrder(this._instance, this._then);

  final Input$dbOrder _instance;

  final TRes Function(Input$dbOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? field = _undefined, Object? type = _undefined}) => _then(
    Input$dbOrder._({
      ..._instance._$data,
      if (field != _undefined && field != null) 'field': (field as String),
      if (type != _undefined && type != null)
        'type': (type as Enum$dbOrder_enum),
    }),
  );
}

class _CopyWithStubImpl$Input$dbOrder<TRes>
    implements CopyWith$Input$dbOrder<TRes> {
  _CopyWithStubImpl$Input$dbOrder(this._res);

  TRes _res;

  call({String? field, Enum$dbOrder_enum? type}) => _res;
}

class Input$dbPagination {
  factory Input$dbPagination({required int limit, required int offset}) =>
      Input$dbPagination._({r'limit': limit, r'offset': offset});

  Input$dbPagination._(this._$data);

  factory Input$dbPagination.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$limit = data['limit'];
    result$data['limit'] = (l$limit as int);
    final l$offset = data['offset'];
    result$data['offset'] = (l$offset as int);
    return Input$dbPagination._(result$data);
  }

  Map<String, dynamic> _$data;

  int get limit => (_$data['limit'] as int);

  int get offset => (_$data['offset'] as int);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$limit = limit;
    result$data['limit'] = l$limit;
    final l$offset = offset;
    result$data['offset'] = l$offset;
    return result$data;
  }

  CopyWith$Input$dbPagination<Input$dbPagination> get copyWith =>
      CopyWith$Input$dbPagination(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$dbPagination || runtimeType != other.runtimeType) {
      return false;
    }
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (l$limit != lOther$limit) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (l$offset != lOther$offset) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$limit = limit;
    final l$offset = offset;
    return Object.hashAll([l$limit, l$offset]);
  }
}

abstract class CopyWith$Input$dbPagination<TRes> {
  factory CopyWith$Input$dbPagination(
    Input$dbPagination instance,
    TRes Function(Input$dbPagination) then,
  ) = _CopyWithImpl$Input$dbPagination;

  factory CopyWith$Input$dbPagination.stub(TRes res) =
      _CopyWithStubImpl$Input$dbPagination;

  TRes call({int? limit, int? offset});
}

class _CopyWithImpl$Input$dbPagination<TRes>
    implements CopyWith$Input$dbPagination<TRes> {
  _CopyWithImpl$Input$dbPagination(this._instance, this._then);

  final Input$dbPagination _instance;

  final TRes Function(Input$dbPagination) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? limit = _undefined, Object? offset = _undefined}) => _then(
    Input$dbPagination._({
      ..._instance._$data,
      if (limit != _undefined && limit != null) 'limit': (limit as int),
      if (offset != _undefined && offset != null) 'offset': (offset as int),
    }),
  );
}

class _CopyWithStubImpl$Input$dbPagination<TRes>
    implements CopyWith$Input$dbPagination<TRes> {
  _CopyWithStubImpl$Input$dbPagination(this._res);

  TRes _res;

  call({int? limit, int? offset}) => _res;
}

class Input$dbQueryOptions {
  factory Input$dbQueryOptions({
    int? limit,
    int? offset,
    List<Input$dbFilter?>? filter,
    List<Input$dbOrder?>? order,
  }) => Input$dbQueryOptions._({
    if (limit != null) r'limit': limit,
    if (offset != null) r'offset': offset,
    if (filter != null) r'filter': filter,
    if (order != null) r'order': order,
  });

  Input$dbQueryOptions._(this._$data);

  factory Input$dbQueryOptions.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('limit')) {
      final l$limit = data['limit'];
      result$data['limit'] = (l$limit as int?);
    }
    if (data.containsKey('offset')) {
      final l$offset = data['offset'];
      result$data['offset'] = (l$offset as int?);
    }
    if (data.containsKey('filter')) {
      final l$filter = data['filter'];
      result$data['filter'] = (l$filter as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$dbFilter.fromJson((e as Map<String, dynamic>)),
          )
          .toList();
    }
    if (data.containsKey('order')) {
      final l$order = data['order'];
      result$data['order'] = (l$order as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$dbOrder.fromJson((e as Map<String, dynamic>)),
          )
          .toList();
    }
    return Input$dbQueryOptions._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get limit => (_$data['limit'] as int?);

  int? get offset => (_$data['offset'] as int?);

  List<Input$dbFilter?>? get filter =>
      (_$data['filter'] as List<Input$dbFilter?>?);

  List<Input$dbOrder?>? get order => (_$data['order'] as List<Input$dbOrder?>?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('limit')) {
      final l$limit = limit;
      result$data['limit'] = l$limit;
    }
    if (_$data.containsKey('offset')) {
      final l$offset = offset;
      result$data['offset'] = l$offset;
    }
    if (_$data.containsKey('filter')) {
      final l$filter = filter;
      result$data['filter'] = l$filter?.map((e) => e?.toJson()).toList();
    }
    if (_$data.containsKey('order')) {
      final l$order = order;
      result$data['order'] = l$order?.map((e) => e?.toJson()).toList();
    }
    return result$data;
  }

  CopyWith$Input$dbQueryOptions<Input$dbQueryOptions> get copyWith =>
      CopyWith$Input$dbQueryOptions(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$dbQueryOptions || runtimeType != other.runtimeType) {
      return false;
    }
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (_$data.containsKey('limit') != other._$data.containsKey('limit')) {
      return false;
    }
    if (l$limit != lOther$limit) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (_$data.containsKey('offset') != other._$data.containsKey('offset')) {
      return false;
    }
    if (l$offset != lOther$offset) {
      return false;
    }
    final l$filter = filter;
    final lOther$filter = other.filter;
    if (_$data.containsKey('filter') != other._$data.containsKey('filter')) {
      return false;
    }
    if (l$filter != null && lOther$filter != null) {
      if (l$filter.length != lOther$filter.length) {
        return false;
      }
      for (int i = 0; i < l$filter.length; i++) {
        final l$filter$entry = l$filter[i];
        final lOther$filter$entry = lOther$filter[i];
        if (l$filter$entry != lOther$filter$entry) {
          return false;
        }
      }
    } else if (l$filter != lOther$filter) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (_$data.containsKey('order') != other._$data.containsKey('order')) {
      return false;
    }
    if (l$order != null && lOther$order != null) {
      if (l$order.length != lOther$order.length) {
        return false;
      }
      for (int i = 0; i < l$order.length; i++) {
        final l$order$entry = l$order[i];
        final lOther$order$entry = lOther$order[i];
        if (l$order$entry != lOther$order$entry) {
          return false;
        }
      }
    } else if (l$order != lOther$order) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$limit = limit;
    final l$offset = offset;
    final l$filter = filter;
    final l$order = order;
    return Object.hashAll([
      _$data.containsKey('limit') ? l$limit : const {},
      _$data.containsKey('offset') ? l$offset : const {},
      _$data.containsKey('filter')
          ? l$filter == null
                ? null
                : Object.hashAll(l$filter.map((v) => v))
          : const {},
      _$data.containsKey('order')
          ? l$order == null
                ? null
                : Object.hashAll(l$order.map((v) => v))
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$dbQueryOptions<TRes> {
  factory CopyWith$Input$dbQueryOptions(
    Input$dbQueryOptions instance,
    TRes Function(Input$dbQueryOptions) then,
  ) = _CopyWithImpl$Input$dbQueryOptions;

  factory CopyWith$Input$dbQueryOptions.stub(TRes res) =
      _CopyWithStubImpl$Input$dbQueryOptions;

  TRes call({
    int? limit,
    int? offset,
    List<Input$dbFilter?>? filter,
    List<Input$dbOrder?>? order,
  });
  TRes filter(
    Iterable<Input$dbFilter?>? Function(
      Iterable<CopyWith$Input$dbFilter<Input$dbFilter>?>?,
    )
    _fn,
  );
  TRes order(
    Iterable<Input$dbOrder?>? Function(
      Iterable<CopyWith$Input$dbOrder<Input$dbOrder>?>?,
    )
    _fn,
  );
}

class _CopyWithImpl$Input$dbQueryOptions<TRes>
    implements CopyWith$Input$dbQueryOptions<TRes> {
  _CopyWithImpl$Input$dbQueryOptions(this._instance, this._then);

  final Input$dbQueryOptions _instance;

  final TRes Function(Input$dbQueryOptions) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? limit = _undefined,
    Object? offset = _undefined,
    Object? filter = _undefined,
    Object? order = _undefined,
  }) => _then(
    Input$dbQueryOptions._({
      ..._instance._$data,
      if (limit != _undefined) 'limit': (limit as int?),
      if (offset != _undefined) 'offset': (offset as int?),
      if (filter != _undefined) 'filter': (filter as List<Input$dbFilter?>?),
      if (order != _undefined) 'order': (order as List<Input$dbOrder?>?),
    }),
  );

  TRes filter(
    Iterable<Input$dbFilter?>? Function(
      Iterable<CopyWith$Input$dbFilter<Input$dbFilter>?>?,
    )
    _fn,
  ) => call(
    filter: _fn(
      _instance.filter?.map(
        (e) => e == null ? null : CopyWith$Input$dbFilter(e, (i) => i),
      ),
    )?.toList(),
  );

  TRes order(
    Iterable<Input$dbOrder?>? Function(
      Iterable<CopyWith$Input$dbOrder<Input$dbOrder>?>?,
    )
    _fn,
  ) => call(
    order: _fn(
      _instance.order?.map(
        (e) => e == null ? null : CopyWith$Input$dbOrder(e, (i) => i),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Input$dbQueryOptions<TRes>
    implements CopyWith$Input$dbQueryOptions<TRes> {
  _CopyWithStubImpl$Input$dbQueryOptions(this._res);

  TRes _res;

  call({
    int? limit,
    int? offset,
    List<Input$dbFilter?>? filter,
    List<Input$dbOrder?>? order,
  }) => _res;

  filter(_fn) => _res;

  order(_fn) => _res;
}

class Input$findOptions {
  factory Input$findOptions({
    Input$pagination? pagination,
    Map<String, dynamic>? orderBy,
    Map<String, dynamic>? where,
    Map<String, dynamic>? select,
  }) => Input$findOptions._({
    if (pagination != null) r'pagination': pagination,
    if (orderBy != null) r'orderBy': orderBy,
    if (where != null) r'where': where,
    if (select != null) r'select': select,
  });

  Input$findOptions._(this._$data);

  factory Input$findOptions.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('pagination')) {
      final l$pagination = data['pagination'];
      result$data['pagination'] = l$pagination == null
          ? null
          : Input$pagination.fromJson((l$pagination as Map<String, dynamic>));
    }
    if (data.containsKey('orderBy')) {
      final l$orderBy = data['orderBy'];
      result$data['orderBy'] = (l$orderBy as Map<String, dynamic>?);
    }
    if (data.containsKey('where')) {
      final l$where = data['where'];
      result$data['where'] = (l$where as Map<String, dynamic>?);
    }
    if (data.containsKey('select')) {
      final l$select = data['select'];
      result$data['select'] = (l$select as Map<String, dynamic>?);
    }
    return Input$findOptions._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$pagination? get pagination =>
      (_$data['pagination'] as Input$pagination?);

  Map<String, dynamic>? get orderBy =>
      (_$data['orderBy'] as Map<String, dynamic>?);

  Map<String, dynamic>? get where => (_$data['where'] as Map<String, dynamic>?);

  Map<String, dynamic>? get select =>
      (_$data['select'] as Map<String, dynamic>?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('pagination')) {
      final l$pagination = pagination;
      result$data['pagination'] = l$pagination?.toJson();
    }
    if (_$data.containsKey('orderBy')) {
      final l$orderBy = orderBy;
      result$data['orderBy'] = l$orderBy;
    }
    if (_$data.containsKey('where')) {
      final l$where = where;
      result$data['where'] = l$where;
    }
    if (_$data.containsKey('select')) {
      final l$select = select;
      result$data['select'] = l$select;
    }
    return result$data;
  }

  CopyWith$Input$findOptions<Input$findOptions> get copyWith =>
      CopyWith$Input$findOptions(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$findOptions || runtimeType != other.runtimeType) {
      return false;
    }
    final l$pagination = pagination;
    final lOther$pagination = other.pagination;
    if (_$data.containsKey('pagination') !=
        other._$data.containsKey('pagination')) {
      return false;
    }
    if (l$pagination != lOther$pagination) {
      return false;
    }
    final l$orderBy = orderBy;
    final lOther$orderBy = other.orderBy;
    if (_$data.containsKey('orderBy') != other._$data.containsKey('orderBy')) {
      return false;
    }
    if (l$orderBy != lOther$orderBy) {
      return false;
    }
    final l$where = where;
    final lOther$where = other.where;
    if (_$data.containsKey('where') != other._$data.containsKey('where')) {
      return false;
    }
    if (l$where != lOther$where) {
      return false;
    }
    final l$select = select;
    final lOther$select = other.select;
    if (_$data.containsKey('select') != other._$data.containsKey('select')) {
      return false;
    }
    if (l$select != lOther$select) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$pagination = pagination;
    final l$orderBy = orderBy;
    final l$where = where;
    final l$select = select;
    return Object.hashAll([
      _$data.containsKey('pagination') ? l$pagination : const {},
      _$data.containsKey('orderBy') ? l$orderBy : const {},
      _$data.containsKey('where') ? l$where : const {},
      _$data.containsKey('select') ? l$select : const {},
    ]);
  }
}

abstract class CopyWith$Input$findOptions<TRes> {
  factory CopyWith$Input$findOptions(
    Input$findOptions instance,
    TRes Function(Input$findOptions) then,
  ) = _CopyWithImpl$Input$findOptions;

  factory CopyWith$Input$findOptions.stub(TRes res) =
      _CopyWithStubImpl$Input$findOptions;

  TRes call({
    Input$pagination? pagination,
    Map<String, dynamic>? orderBy,
    Map<String, dynamic>? where,
    Map<String, dynamic>? select,
  });
  CopyWith$Input$pagination<TRes> get pagination;
}

class _CopyWithImpl$Input$findOptions<TRes>
    implements CopyWith$Input$findOptions<TRes> {
  _CopyWithImpl$Input$findOptions(this._instance, this._then);

  final Input$findOptions _instance;

  final TRes Function(Input$findOptions) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? pagination = _undefined,
    Object? orderBy = _undefined,
    Object? where = _undefined,
    Object? select = _undefined,
  }) => _then(
    Input$findOptions._({
      ..._instance._$data,
      if (pagination != _undefined)
        'pagination': (pagination as Input$pagination?),
      if (orderBy != _undefined) 'orderBy': (orderBy as Map<String, dynamic>?),
      if (where != _undefined) 'where': (where as Map<String, dynamic>?),
      if (select != _undefined) 'select': (select as Map<String, dynamic>?),
    }),
  );

  CopyWith$Input$pagination<TRes> get pagination {
    final local$pagination = _instance.pagination;
    return local$pagination == null
        ? CopyWith$Input$pagination.stub(_then(_instance))
        : CopyWith$Input$pagination(
            local$pagination,
            (e) => call(pagination: e),
          );
  }
}

class _CopyWithStubImpl$Input$findOptions<TRes>
    implements CopyWith$Input$findOptions<TRes> {
  _CopyWithStubImpl$Input$findOptions(this._res);

  TRes _res;

  call({
    Input$pagination? pagination,
    Map<String, dynamic>? orderBy,
    Map<String, dynamic>? where,
    Map<String, dynamic>? select,
  }) => _res;

  CopyWith$Input$pagination<TRes> get pagination =>
      CopyWith$Input$pagination.stub(_res);
}

class Input$pagination {
  factory Input$pagination({int? limit, int? offset}) => Input$pagination._({
    if (limit != null) r'limit': limit,
    if (offset != null) r'offset': offset,
  });

  Input$pagination._(this._$data);

  factory Input$pagination.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('limit')) {
      final l$limit = data['limit'];
      result$data['limit'] = (l$limit as int?);
    }
    if (data.containsKey('offset')) {
      final l$offset = data['offset'];
      result$data['offset'] = (l$offset as int?);
    }
    return Input$pagination._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get limit => (_$data['limit'] as int?);

  int? get offset => (_$data['offset'] as int?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('limit')) {
      final l$limit = limit;
      result$data['limit'] = l$limit;
    }
    if (_$data.containsKey('offset')) {
      final l$offset = offset;
      result$data['offset'] = l$offset;
    }
    return result$data;
  }

  CopyWith$Input$pagination<Input$pagination> get copyWith =>
      CopyWith$Input$pagination(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$pagination || runtimeType != other.runtimeType) {
      return false;
    }
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (_$data.containsKey('limit') != other._$data.containsKey('limit')) {
      return false;
    }
    if (l$limit != lOther$limit) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (_$data.containsKey('offset') != other._$data.containsKey('offset')) {
      return false;
    }
    if (l$offset != lOther$offset) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$limit = limit;
    final l$offset = offset;
    return Object.hashAll([
      _$data.containsKey('limit') ? l$limit : const {},
      _$data.containsKey('offset') ? l$offset : const {},
    ]);
  }
}

abstract class CopyWith$Input$pagination<TRes> {
  factory CopyWith$Input$pagination(
    Input$pagination instance,
    TRes Function(Input$pagination) then,
  ) = _CopyWithImpl$Input$pagination;

  factory CopyWith$Input$pagination.stub(TRes res) =
      _CopyWithStubImpl$Input$pagination;

  TRes call({int? limit, int? offset});
}

class _CopyWithImpl$Input$pagination<TRes>
    implements CopyWith$Input$pagination<TRes> {
  _CopyWithImpl$Input$pagination(this._instance, this._then);

  final Input$pagination _instance;

  final TRes Function(Input$pagination) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? limit = _undefined, Object? offset = _undefined}) => _then(
    Input$pagination._({
      ..._instance._$data,
      if (limit != _undefined) 'limit': (limit as int?),
      if (offset != _undefined) 'offset': (offset as int?),
    }),
  );
}

class _CopyWithStubImpl$Input$pagination<TRes>
    implements CopyWith$Input$pagination<TRes> {
  _CopyWithStubImpl$Input$pagination(this._res);

  TRes _res;

  call({int? limit, int? offset}) => _res;
}

class Input$searchOptions {
  factory Input$searchOptions({required int page, required int limit}) =>
      Input$searchOptions._({r'page': page, r'limit': limit});

  Input$searchOptions._(this._$data);

  factory Input$searchOptions.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$page = data['page'];
    result$data['page'] = (l$page as int);
    final l$limit = data['limit'];
    result$data['limit'] = (l$limit as int);
    return Input$searchOptions._(result$data);
  }

  Map<String, dynamic> _$data;

  int get page => (_$data['page'] as int);

  int get limit => (_$data['limit'] as int);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$page = page;
    result$data['page'] = l$page;
    final l$limit = limit;
    result$data['limit'] = l$limit;
    return result$data;
  }

  CopyWith$Input$searchOptions<Input$searchOptions> get copyWith =>
      CopyWith$Input$searchOptions(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$searchOptions || runtimeType != other.runtimeType) {
      return false;
    }
    final l$page = page;
    final lOther$page = other.page;
    if (l$page != lOther$page) {
      return false;
    }
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (l$limit != lOther$limit) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$page = page;
    final l$limit = limit;
    return Object.hashAll([l$page, l$limit]);
  }
}

abstract class CopyWith$Input$searchOptions<TRes> {
  factory CopyWith$Input$searchOptions(
    Input$searchOptions instance,
    TRes Function(Input$searchOptions) then,
  ) = _CopyWithImpl$Input$searchOptions;

  factory CopyWith$Input$searchOptions.stub(TRes res) =
      _CopyWithStubImpl$Input$searchOptions;

  TRes call({int? page, int? limit});
}

class _CopyWithImpl$Input$searchOptions<TRes>
    implements CopyWith$Input$searchOptions<TRes> {
  _CopyWithImpl$Input$searchOptions(this._instance, this._then);

  final Input$searchOptions _instance;

  final TRes Function(Input$searchOptions) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? page = _undefined, Object? limit = _undefined}) => _then(
    Input$searchOptions._({
      ..._instance._$data,
      if (page != _undefined && page != null) 'page': (page as int),
      if (limit != _undefined && limit != null) 'limit': (limit as int),
    }),
  );
}

class _CopyWithStubImpl$Input$searchOptions<TRes>
    implements CopyWith$Input$searchOptions<TRes> {
  _CopyWithStubImpl$Input$searchOptions(this._res);

  TRes _res;

  call({int? page, int? limit}) => _res;
}

class Input$sendMailContext {
  factory Input$sendMailContext({String? content}) =>
      Input$sendMailContext._({if (content != null) r'content': content});

  Input$sendMailContext._(this._$data);

  factory Input$sendMailContext.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('content')) {
      final l$content = data['content'];
      result$data['content'] = (l$content as String?);
    }
    return Input$sendMailContext._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get content => (_$data['content'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('content')) {
      final l$content = content;
      result$data['content'] = l$content;
    }
    return result$data;
  }

  CopyWith$Input$sendMailContext<Input$sendMailContext> get copyWith =>
      CopyWith$Input$sendMailContext(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$sendMailContext || runtimeType != other.runtimeType) {
      return false;
    }
    final l$content = content;
    final lOther$content = other.content;
    if (_$data.containsKey('content') != other._$data.containsKey('content')) {
      return false;
    }
    if (l$content != lOther$content) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$content = content;
    return Object.hashAll([
      _$data.containsKey('content') ? l$content : const {},
    ]);
  }
}

abstract class CopyWith$Input$sendMailContext<TRes> {
  factory CopyWith$Input$sendMailContext(
    Input$sendMailContext instance,
    TRes Function(Input$sendMailContext) then,
  ) = _CopyWithImpl$Input$sendMailContext;

  factory CopyWith$Input$sendMailContext.stub(TRes res) =
      _CopyWithStubImpl$Input$sendMailContext;

  TRes call({String? content});
}

class _CopyWithImpl$Input$sendMailContext<TRes>
    implements CopyWith$Input$sendMailContext<TRes> {
  _CopyWithImpl$Input$sendMailContext(this._instance, this._then);

  final Input$sendMailContext _instance;

  final TRes Function(Input$sendMailContext) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? content = _undefined}) => _then(
    Input$sendMailContext._({
      ..._instance._$data,
      if (content != _undefined) 'content': (content as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$sendMailContext<TRes>
    implements CopyWith$Input$sendMailContext<TRes> {
  _CopyWithStubImpl$Input$sendMailContext(this._res);

  TRes _res;

  call({String? content}) => _res;
}

class Input$timelineCategoryInput {
  factory Input$timelineCategoryInput({String? value, String? label}) =>
      Input$timelineCategoryInput._({
        if (value != null) r'value': value,
        if (label != null) r'label': label,
      });

  Input$timelineCategoryInput._(this._$data);

  factory Input$timelineCategoryInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('value')) {
      final l$value = data['value'];
      result$data['value'] = (l$value as String?);
    }
    if (data.containsKey('label')) {
      final l$label = data['label'];
      result$data['label'] = (l$label as String?);
    }
    return Input$timelineCategoryInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get value => (_$data['value'] as String?);

  String? get label => (_$data['label'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('value')) {
      final l$value = value;
      result$data['value'] = l$value;
    }
    if (_$data.containsKey('label')) {
      final l$label = label;
      result$data['label'] = l$label;
    }
    return result$data;
  }

  CopyWith$Input$timelineCategoryInput<Input$timelineCategoryInput>
  get copyWith => CopyWith$Input$timelineCategoryInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$timelineCategoryInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (_$data.containsKey('value') != other._$data.containsKey('value')) {
      return false;
    }
    if (l$value != lOther$value) {
      return false;
    }
    final l$label = label;
    final lOther$label = other.label;
    if (_$data.containsKey('label') != other._$data.containsKey('label')) {
      return false;
    }
    if (l$label != lOther$label) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$value = value;
    final l$label = label;
    return Object.hashAll([
      _$data.containsKey('value') ? l$value : const {},
      _$data.containsKey('label') ? l$label : const {},
    ]);
  }
}

abstract class CopyWith$Input$timelineCategoryInput<TRes> {
  factory CopyWith$Input$timelineCategoryInput(
    Input$timelineCategoryInput instance,
    TRes Function(Input$timelineCategoryInput) then,
  ) = _CopyWithImpl$Input$timelineCategoryInput;

  factory CopyWith$Input$timelineCategoryInput.stub(TRes res) =
      _CopyWithStubImpl$Input$timelineCategoryInput;

  TRes call({String? value, String? label});
}

class _CopyWithImpl$Input$timelineCategoryInput<TRes>
    implements CopyWith$Input$timelineCategoryInput<TRes> {
  _CopyWithImpl$Input$timelineCategoryInput(this._instance, this._then);

  final Input$timelineCategoryInput _instance;

  final TRes Function(Input$timelineCategoryInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? value = _undefined, Object? label = _undefined}) => _then(
    Input$timelineCategoryInput._({
      ..._instance._$data,
      if (value != _undefined) 'value': (value as String?),
      if (label != _undefined) 'label': (label as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$timelineCategoryInput<TRes>
    implements CopyWith$Input$timelineCategoryInput<TRes> {
  _CopyWithStubImpl$Input$timelineCategoryInput(this._res);

  TRes _res;

  call({String? value, String? label}) => _res;
}

class Input$timelineEntryInput {
  factory Input$timelineEntryInput({
    required String html,
    String? title,
    required Input$timelineCategoryInput category,
    List<String?>? tags,
  }) => Input$timelineEntryInput._({
    r'html': html,
    if (title != null) r'title': title,
    r'category': category,
    if (tags != null) r'tags': tags,
  });

  Input$timelineEntryInput._(this._$data);

  factory Input$timelineEntryInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$html = data['html'];
    result$data['html'] = (l$html as String);
    if (data.containsKey('title')) {
      final l$title = data['title'];
      result$data['title'] = (l$title as String?);
    }
    final l$category = data['category'];
    result$data['category'] = Input$timelineCategoryInput.fromJson(
      (l$category as Map<String, dynamic>),
    );
    if (data.containsKey('tags')) {
      final l$tags = data['tags'];
      result$data['tags'] = (l$tags as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    return Input$timelineEntryInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get html => (_$data['html'] as String);

  String? get title => (_$data['title'] as String?);

  Input$timelineCategoryInput get category =>
      (_$data['category'] as Input$timelineCategoryInput);

  List<String?>? get tags => (_$data['tags'] as List<String?>?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$html = html;
    result$data['html'] = l$html;
    if (_$data.containsKey('title')) {
      final l$title = title;
      result$data['title'] = l$title;
    }
    final l$category = category;
    result$data['category'] = l$category.toJson();
    if (_$data.containsKey('tags')) {
      final l$tags = tags;
      result$data['tags'] = l$tags?.map((e) => e).toList();
    }
    return result$data;
  }

  CopyWith$Input$timelineEntryInput<Input$timelineEntryInput> get copyWith =>
      CopyWith$Input$timelineEntryInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$timelineEntryInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$html = html;
    final lOther$html = other.html;
    if (l$html != lOther$html) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (_$data.containsKey('title') != other._$data.containsKey('title')) {
      return false;
    }
    if (l$title != lOther$title) {
      return false;
    }
    final l$category = category;
    final lOther$category = other.category;
    if (l$category != lOther$category) {
      return false;
    }
    final l$tags = tags;
    final lOther$tags = other.tags;
    if (_$data.containsKey('tags') != other._$data.containsKey('tags')) {
      return false;
    }
    if (l$tags != null && lOther$tags != null) {
      if (l$tags.length != lOther$tags.length) {
        return false;
      }
      for (int i = 0; i < l$tags.length; i++) {
        final l$tags$entry = l$tags[i];
        final lOther$tags$entry = lOther$tags[i];
        if (l$tags$entry != lOther$tags$entry) {
          return false;
        }
      }
    } else if (l$tags != lOther$tags) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$html = html;
    final l$title = title;
    final l$category = category;
    final l$tags = tags;
    return Object.hashAll([
      l$html,
      _$data.containsKey('title') ? l$title : const {},
      l$category,
      _$data.containsKey('tags')
          ? l$tags == null
                ? null
                : Object.hashAll(l$tags.map((v) => v))
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$timelineEntryInput<TRes> {
  factory CopyWith$Input$timelineEntryInput(
    Input$timelineEntryInput instance,
    TRes Function(Input$timelineEntryInput) then,
  ) = _CopyWithImpl$Input$timelineEntryInput;

  factory CopyWith$Input$timelineEntryInput.stub(TRes res) =
      _CopyWithStubImpl$Input$timelineEntryInput;

  TRes call({
    String? html,
    String? title,
    Input$timelineCategoryInput? category,
    List<String?>? tags,
  });
  CopyWith$Input$timelineCategoryInput<TRes> get category;
}

class _CopyWithImpl$Input$timelineEntryInput<TRes>
    implements CopyWith$Input$timelineEntryInput<TRes> {
  _CopyWithImpl$Input$timelineEntryInput(this._instance, this._then);

  final Input$timelineEntryInput _instance;

  final TRes Function(Input$timelineEntryInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? html = _undefined,
    Object? title = _undefined,
    Object? category = _undefined,
    Object? tags = _undefined,
  }) => _then(
    Input$timelineEntryInput._({
      ..._instance._$data,
      if (html != _undefined && html != null) 'html': (html as String),
      if (title != _undefined) 'title': (title as String?),
      if (category != _undefined && category != null)
        'category': (category as Input$timelineCategoryInput),
      if (tags != _undefined) 'tags': (tags as List<String?>?),
    }),
  );

  CopyWith$Input$timelineCategoryInput<TRes> get category {
    final local$category = _instance.category;
    return CopyWith$Input$timelineCategoryInput(
      local$category,
      (e) => call(category: e),
    );
  }
}

class _CopyWithStubImpl$Input$timelineEntryInput<TRes>
    implements CopyWith$Input$timelineEntryInput<TRes> {
  _CopyWithStubImpl$Input$timelineEntryInput(this._res);

  TRes _res;

  call({
    String? html,
    String? title,
    Input$timelineCategoryInput? category,
    List<String?>? tags,
  }) => _res;

  CopyWith$Input$timelineCategoryInput<TRes> get category =>
      CopyWith$Input$timelineCategoryInput.stub(_res);
}

class Input$timelineListingOptions {
  factory Input$timelineListingOptions({
    required int page,
    List<String?>? type,
    String? userId,
    required String listingId,
    String? listingType,
    String? category,
    String? postId,
    String? pageId,
    String? entryId,
  }) => Input$timelineListingOptions._({
    r'page': page,
    if (type != null) r'type': type,
    if (userId != null) r'userId': userId,
    r'listingId': listingId,
    if (listingType != null) r'listingType': listingType,
    if (category != null) r'category': category,
    if (postId != null) r'postId': postId,
    if (pageId != null) r'pageId': pageId,
    if (entryId != null) r'entryId': entryId,
  });

  Input$timelineListingOptions._(this._$data);

  factory Input$timelineListingOptions.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$page = data['page'];
    result$data['page'] = (l$page as int);
    if (data.containsKey('type')) {
      final l$type = data['type'];
      result$data['type'] = (l$type as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('userId')) {
      final l$userId = data['userId'];
      result$data['userId'] = (l$userId as String?);
    }
    final l$listingId = data['listingId'];
    result$data['listingId'] = (l$listingId as String);
    if (data.containsKey('listingType')) {
      final l$listingType = data['listingType'];
      result$data['listingType'] = (l$listingType as String?);
    }
    if (data.containsKey('category')) {
      final l$category = data['category'];
      result$data['category'] = (l$category as String?);
    }
    if (data.containsKey('postId')) {
      final l$postId = data['postId'];
      result$data['postId'] = (l$postId as String?);
    }
    if (data.containsKey('pageId')) {
      final l$pageId = data['pageId'];
      result$data['pageId'] = (l$pageId as String?);
    }
    if (data.containsKey('entryId')) {
      final l$entryId = data['entryId'];
      result$data['entryId'] = (l$entryId as String?);
    }
    return Input$timelineListingOptions._(result$data);
  }

  Map<String, dynamic> _$data;

  int get page => (_$data['page'] as int);

  List<String?>? get type => (_$data['type'] as List<String?>?);

  String? get userId => (_$data['userId'] as String?);

  String get listingId => (_$data['listingId'] as String);

  String? get listingType => (_$data['listingType'] as String?);

  String? get category => (_$data['category'] as String?);

  String? get postId => (_$data['postId'] as String?);

  String? get pageId => (_$data['pageId'] as String?);

  String? get entryId => (_$data['entryId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$page = page;
    result$data['page'] = l$page;
    if (_$data.containsKey('type')) {
      final l$type = type;
      result$data['type'] = l$type?.map((e) => e).toList();
    }
    if (_$data.containsKey('userId')) {
      final l$userId = userId;
      result$data['userId'] = l$userId;
    }
    final l$listingId = listingId;
    result$data['listingId'] = l$listingId;
    if (_$data.containsKey('listingType')) {
      final l$listingType = listingType;
      result$data['listingType'] = l$listingType;
    }
    if (_$data.containsKey('category')) {
      final l$category = category;
      result$data['category'] = l$category;
    }
    if (_$data.containsKey('postId')) {
      final l$postId = postId;
      result$data['postId'] = l$postId;
    }
    if (_$data.containsKey('pageId')) {
      final l$pageId = pageId;
      result$data['pageId'] = l$pageId;
    }
    if (_$data.containsKey('entryId')) {
      final l$entryId = entryId;
      result$data['entryId'] = l$entryId;
    }
    return result$data;
  }

  CopyWith$Input$timelineListingOptions<Input$timelineListingOptions>
  get copyWith => CopyWith$Input$timelineListingOptions(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$timelineListingOptions ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$page = page;
    final lOther$page = other.page;
    if (l$page != lOther$page) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (_$data.containsKey('type') != other._$data.containsKey('type')) {
      return false;
    }
    if (l$type != null && lOther$type != null) {
      if (l$type.length != lOther$type.length) {
        return false;
      }
      for (int i = 0; i < l$type.length; i++) {
        final l$type$entry = l$type[i];
        final lOther$type$entry = lOther$type[i];
        if (l$type$entry != lOther$type$entry) {
          return false;
        }
      }
    } else if (l$type != lOther$type) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (_$data.containsKey('userId') != other._$data.containsKey('userId')) {
      return false;
    }
    if (l$userId != lOther$userId) {
      return false;
    }
    final l$listingId = listingId;
    final lOther$listingId = other.listingId;
    if (l$listingId != lOther$listingId) {
      return false;
    }
    final l$listingType = listingType;
    final lOther$listingType = other.listingType;
    if (_$data.containsKey('listingType') !=
        other._$data.containsKey('listingType')) {
      return false;
    }
    if (l$listingType != lOther$listingType) {
      return false;
    }
    final l$category = category;
    final lOther$category = other.category;
    if (_$data.containsKey('category') !=
        other._$data.containsKey('category')) {
      return false;
    }
    if (l$category != lOther$category) {
      return false;
    }
    final l$postId = postId;
    final lOther$postId = other.postId;
    if (_$data.containsKey('postId') != other._$data.containsKey('postId')) {
      return false;
    }
    if (l$postId != lOther$postId) {
      return false;
    }
    final l$pageId = pageId;
    final lOther$pageId = other.pageId;
    if (_$data.containsKey('pageId') != other._$data.containsKey('pageId')) {
      return false;
    }
    if (l$pageId != lOther$pageId) {
      return false;
    }
    final l$entryId = entryId;
    final lOther$entryId = other.entryId;
    if (_$data.containsKey('entryId') != other._$data.containsKey('entryId')) {
      return false;
    }
    if (l$entryId != lOther$entryId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$page = page;
    final l$type = type;
    final l$userId = userId;
    final l$listingId = listingId;
    final l$listingType = listingType;
    final l$category = category;
    final l$postId = postId;
    final l$pageId = pageId;
    final l$entryId = entryId;
    return Object.hashAll([
      l$page,
      _$data.containsKey('type')
          ? l$type == null
                ? null
                : Object.hashAll(l$type.map((v) => v))
          : const {},
      _$data.containsKey('userId') ? l$userId : const {},
      l$listingId,
      _$data.containsKey('listingType') ? l$listingType : const {},
      _$data.containsKey('category') ? l$category : const {},
      _$data.containsKey('postId') ? l$postId : const {},
      _$data.containsKey('pageId') ? l$pageId : const {},
      _$data.containsKey('entryId') ? l$entryId : const {},
    ]);
  }
}

abstract class CopyWith$Input$timelineListingOptions<TRes> {
  factory CopyWith$Input$timelineListingOptions(
    Input$timelineListingOptions instance,
    TRes Function(Input$timelineListingOptions) then,
  ) = _CopyWithImpl$Input$timelineListingOptions;

  factory CopyWith$Input$timelineListingOptions.stub(TRes res) =
      _CopyWithStubImpl$Input$timelineListingOptions;

  TRes call({
    int? page,
    List<String?>? type,
    String? userId,
    String? listingId,
    String? listingType,
    String? category,
    String? postId,
    String? pageId,
    String? entryId,
  });
}

class _CopyWithImpl$Input$timelineListingOptions<TRes>
    implements CopyWith$Input$timelineListingOptions<TRes> {
  _CopyWithImpl$Input$timelineListingOptions(this._instance, this._then);

  final Input$timelineListingOptions _instance;

  final TRes Function(Input$timelineListingOptions) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? page = _undefined,
    Object? type = _undefined,
    Object? userId = _undefined,
    Object? listingId = _undefined,
    Object? listingType = _undefined,
    Object? category = _undefined,
    Object? postId = _undefined,
    Object? pageId = _undefined,
    Object? entryId = _undefined,
  }) => _then(
    Input$timelineListingOptions._({
      ..._instance._$data,
      if (page != _undefined && page != null) 'page': (page as int),
      if (type != _undefined) 'type': (type as List<String?>?),
      if (userId != _undefined) 'userId': (userId as String?),
      if (listingId != _undefined && listingId != null)
        'listingId': (listingId as String),
      if (listingType != _undefined) 'listingType': (listingType as String?),
      if (category != _undefined) 'category': (category as String?),
      if (postId != _undefined) 'postId': (postId as String?),
      if (pageId != _undefined) 'pageId': (pageId as String?),
      if (entryId != _undefined) 'entryId': (entryId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$timelineListingOptions<TRes>
    implements CopyWith$Input$timelineListingOptions<TRes> {
  _CopyWithStubImpl$Input$timelineListingOptions(this._res);

  TRes _res;

  call({
    int? page,
    List<String?>? type,
    String? userId,
    String? listingId,
    String? listingType,
    String? category,
    String? postId,
    String? pageId,
    String? entryId,
  }) => _res;
}

class Input$timelineLoadEntryOptions {
  factory Input$timelineLoadEntryOptions({String? entryId}) =>
      Input$timelineLoadEntryOptions._({
        if (entryId != null) r'entryId': entryId,
      });

  Input$timelineLoadEntryOptions._(this._$data);

  factory Input$timelineLoadEntryOptions.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('entryId')) {
      final l$entryId = data['entryId'];
      result$data['entryId'] = (l$entryId as String?);
    }
    return Input$timelineLoadEntryOptions._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get entryId => (_$data['entryId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('entryId')) {
      final l$entryId = entryId;
      result$data['entryId'] = l$entryId;
    }
    return result$data;
  }

  CopyWith$Input$timelineLoadEntryOptions<Input$timelineLoadEntryOptions>
  get copyWith => CopyWith$Input$timelineLoadEntryOptions(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$timelineLoadEntryOptions ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$entryId = entryId;
    final lOther$entryId = other.entryId;
    if (_$data.containsKey('entryId') != other._$data.containsKey('entryId')) {
      return false;
    }
    if (l$entryId != lOther$entryId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$entryId = entryId;
    return Object.hashAll([
      _$data.containsKey('entryId') ? l$entryId : const {},
    ]);
  }
}

abstract class CopyWith$Input$timelineLoadEntryOptions<TRes> {
  factory CopyWith$Input$timelineLoadEntryOptions(
    Input$timelineLoadEntryOptions instance,
    TRes Function(Input$timelineLoadEntryOptions) then,
  ) = _CopyWithImpl$Input$timelineLoadEntryOptions;

  factory CopyWith$Input$timelineLoadEntryOptions.stub(TRes res) =
      _CopyWithStubImpl$Input$timelineLoadEntryOptions;

  TRes call({String? entryId});
}

class _CopyWithImpl$Input$timelineLoadEntryOptions<TRes>
    implements CopyWith$Input$timelineLoadEntryOptions<TRes> {
  _CopyWithImpl$Input$timelineLoadEntryOptions(this._instance, this._then);

  final Input$timelineLoadEntryOptions _instance;

  final TRes Function(Input$timelineLoadEntryOptions) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? entryId = _undefined}) => _then(
    Input$timelineLoadEntryOptions._({
      ..._instance._$data,
      if (entryId != _undefined) 'entryId': (entryId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$timelineLoadEntryOptions<TRes>
    implements CopyWith$Input$timelineLoadEntryOptions<TRes> {
  _CopyWithStubImpl$Input$timelineLoadEntryOptions(this._res);

  TRes _res;

  call({String? entryId}) => _res;
}

class Input$timelineLocationInput {
  factory Input$timelineLocationInput({String? lat, String? lon}) =>
      Input$timelineLocationInput._({
        if (lat != null) r'lat': lat,
        if (lon != null) r'lon': lon,
      });

  Input$timelineLocationInput._(this._$data);

  factory Input$timelineLocationInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('lat')) {
      final l$lat = data['lat'];
      result$data['lat'] = (l$lat as String?);
    }
    if (data.containsKey('lon')) {
      final l$lon = data['lon'];
      result$data['lon'] = (l$lon as String?);
    }
    return Input$timelineLocationInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get lat => (_$data['lat'] as String?);

  String? get lon => (_$data['lon'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('lat')) {
      final l$lat = lat;
      result$data['lat'] = l$lat;
    }
    if (_$data.containsKey('lon')) {
      final l$lon = lon;
      result$data['lon'] = l$lon;
    }
    return result$data;
  }

  CopyWith$Input$timelineLocationInput<Input$timelineLocationInput>
  get copyWith => CopyWith$Input$timelineLocationInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$timelineLocationInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$lat = lat;
    final lOther$lat = other.lat;
    if (_$data.containsKey('lat') != other._$data.containsKey('lat')) {
      return false;
    }
    if (l$lat != lOther$lat) {
      return false;
    }
    final l$lon = lon;
    final lOther$lon = other.lon;
    if (_$data.containsKey('lon') != other._$data.containsKey('lon')) {
      return false;
    }
    if (l$lon != lOther$lon) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$lat = lat;
    final l$lon = lon;
    return Object.hashAll([
      _$data.containsKey('lat') ? l$lat : const {},
      _$data.containsKey('lon') ? l$lon : const {},
    ]);
  }
}

abstract class CopyWith$Input$timelineLocationInput<TRes> {
  factory CopyWith$Input$timelineLocationInput(
    Input$timelineLocationInput instance,
    TRes Function(Input$timelineLocationInput) then,
  ) = _CopyWithImpl$Input$timelineLocationInput;

  factory CopyWith$Input$timelineLocationInput.stub(TRes res) =
      _CopyWithStubImpl$Input$timelineLocationInput;

  TRes call({String? lat, String? lon});
}

class _CopyWithImpl$Input$timelineLocationInput<TRes>
    implements CopyWith$Input$timelineLocationInput<TRes> {
  _CopyWithImpl$Input$timelineLocationInput(this._instance, this._then);

  final Input$timelineLocationInput _instance;

  final TRes Function(Input$timelineLocationInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? lat = _undefined, Object? lon = _undefined}) => _then(
    Input$timelineLocationInput._({
      ..._instance._$data,
      if (lat != _undefined) 'lat': (lat as String?),
      if (lon != _undefined) 'lon': (lon as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$timelineLocationInput<TRes>
    implements CopyWith$Input$timelineLocationInput<TRes> {
  _CopyWithStubImpl$Input$timelineLocationInput(this._res);

  TRes _res;

  call({String? lat, String? lon}) => _res;
}

class Input$timelineSearchInput {
  factory Input$timelineSearchInput({
    required String title,
    required String description,
  }) => Input$timelineSearchInput._({
    r'title': title,
    r'description': description,
  });

  Input$timelineSearchInput._(this._$data);

  factory Input$timelineSearchInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$title = data['title'];
    result$data['title'] = (l$title as String);
    final l$description = data['description'];
    result$data['description'] = (l$description as String);
    return Input$timelineSearchInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get title => (_$data['title'] as String);

  String get description => (_$data['description'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$title = title;
    result$data['title'] = l$title;
    final l$description = description;
    result$data['description'] = l$description;
    return result$data;
  }

  CopyWith$Input$timelineSearchInput<Input$timelineSearchInput> get copyWith =>
      CopyWith$Input$timelineSearchInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$timelineSearchInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$description = description;
    return Object.hashAll([l$title, l$description]);
  }
}

abstract class CopyWith$Input$timelineSearchInput<TRes> {
  factory CopyWith$Input$timelineSearchInput(
    Input$timelineSearchInput instance,
    TRes Function(Input$timelineSearchInput) then,
  ) = _CopyWithImpl$Input$timelineSearchInput;

  factory CopyWith$Input$timelineSearchInput.stub(TRes res) =
      _CopyWithStubImpl$Input$timelineSearchInput;

  TRes call({String? title, String? description});
}

class _CopyWithImpl$Input$timelineSearchInput<TRes>
    implements CopyWith$Input$timelineSearchInput<TRes> {
  _CopyWithImpl$Input$timelineSearchInput(this._instance, this._then);

  final Input$timelineSearchInput _instance;

  final TRes Function(Input$timelineSearchInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? title = _undefined, Object? description = _undefined}) =>
      _then(
        Input$timelineSearchInput._({
          ..._instance._$data,
          if (title != _undefined && title != null) 'title': (title as String),
          if (description != _undefined && description != null)
            'description': (description as String),
        }),
      );
}

class _CopyWithStubImpl$Input$timelineSearchInput<TRes>
    implements CopyWith$Input$timelineSearchInput<TRes> {
  _CopyWithStubImpl$Input$timelineSearchInput(this._res);

  TRes _res;

  call({String? title, String? description}) => _res;
}

class Input$userCreateParams {
  factory Input$userCreateParams({
    required String alias,
    required String email,
    required String password,
  }) => Input$userCreateParams._({
    r'alias': alias,
    r'email': email,
    r'password': password,
  });

  Input$userCreateParams._(this._$data);

  factory Input$userCreateParams.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$alias = data['alias'];
    result$data['alias'] = (l$alias as String);
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    final l$password = data['password'];
    result$data['password'] = (l$password as String);
    return Input$userCreateParams._(result$data);
  }

  Map<String, dynamic> _$data;

  String get alias => (_$data['alias'] as String);

  String get email => (_$data['email'] as String);

  String get password => (_$data['password'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$alias = alias;
    result$data['alias'] = l$alias;
    final l$email = email;
    result$data['email'] = l$email;
    final l$password = password;
    result$data['password'] = l$password;
    return result$data;
  }

  CopyWith$Input$userCreateParams<Input$userCreateParams> get copyWith =>
      CopyWith$Input$userCreateParams(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$userCreateParams || runtimeType != other.runtimeType) {
      return false;
    }
    final l$alias = alias;
    final lOther$alias = other.alias;
    if (l$alias != lOther$alias) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$password = password;
    final lOther$password = other.password;
    if (l$password != lOther$password) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$alias = alias;
    final l$email = email;
    final l$password = password;
    return Object.hashAll([l$alias, l$email, l$password]);
  }
}

abstract class CopyWith$Input$userCreateParams<TRes> {
  factory CopyWith$Input$userCreateParams(
    Input$userCreateParams instance,
    TRes Function(Input$userCreateParams) then,
  ) = _CopyWithImpl$Input$userCreateParams;

  factory CopyWith$Input$userCreateParams.stub(TRes res) =
      _CopyWithStubImpl$Input$userCreateParams;

  TRes call({String? alias, String? email, String? password});
}

class _CopyWithImpl$Input$userCreateParams<TRes>
    implements CopyWith$Input$userCreateParams<TRes> {
  _CopyWithImpl$Input$userCreateParams(this._instance, this._then);

  final Input$userCreateParams _instance;

  final TRes Function(Input$userCreateParams) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? alias = _undefined,
    Object? email = _undefined,
    Object? password = _undefined,
  }) => _then(
    Input$userCreateParams._({
      ..._instance._$data,
      if (alias != _undefined && alias != null) 'alias': (alias as String),
      if (email != _undefined && email != null) 'email': (email as String),
      if (password != _undefined && password != null)
        'password': (password as String),
    }),
  );
}

class _CopyWithStubImpl$Input$userCreateParams<TRes>
    implements CopyWith$Input$userCreateParams<TRes> {
  _CopyWithStubImpl$Input$userCreateParams(this._res);

  TRes _res;

  call({String? alias, String? email, String? password}) => _res;
}

class Input$userDescriptionInput {
  factory Input$userDescriptionInput({required String html}) =>
      Input$userDescriptionInput._({r'html': html});

  Input$userDescriptionInput._(this._$data);

  factory Input$userDescriptionInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$html = data['html'];
    result$data['html'] = (l$html as String);
    return Input$userDescriptionInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get html => (_$data['html'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$html = html;
    result$data['html'] = l$html;
    return result$data;
  }

  CopyWith$Input$userDescriptionInput<Input$userDescriptionInput>
  get copyWith => CopyWith$Input$userDescriptionInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$userDescriptionInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$html = html;
    final lOther$html = other.html;
    if (l$html != lOther$html) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$html = html;
    return Object.hashAll([l$html]);
  }
}

abstract class CopyWith$Input$userDescriptionInput<TRes> {
  factory CopyWith$Input$userDescriptionInput(
    Input$userDescriptionInput instance,
    TRes Function(Input$userDescriptionInput) then,
  ) = _CopyWithImpl$Input$userDescriptionInput;

  factory CopyWith$Input$userDescriptionInput.stub(TRes res) =
      _CopyWithStubImpl$Input$userDescriptionInput;

  TRes call({String? html});
}

class _CopyWithImpl$Input$userDescriptionInput<TRes>
    implements CopyWith$Input$userDescriptionInput<TRes> {
  _CopyWithImpl$Input$userDescriptionInput(this._instance, this._then);

  final Input$userDescriptionInput _instance;

  final TRes Function(Input$userDescriptionInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? html = _undefined}) => _then(
    Input$userDescriptionInput._({
      ..._instance._$data,
      if (html != _undefined && html != null) 'html': (html as String),
    }),
  );
}

class _CopyWithStubImpl$Input$userDescriptionInput<TRes>
    implements CopyWith$Input$userDescriptionInput<TRes> {
  _CopyWithStubImpl$Input$userDescriptionInput(this._res);

  TRes _res;

  call({String? html}) => _res;
}

class Input$userDetailsInput {
  factory Input$userDetailsInput({String? firstname, String? lastname}) =>
      Input$userDetailsInput._({
        if (firstname != null) r'firstname': firstname,
        if (lastname != null) r'lastname': lastname,
      });

  Input$userDetailsInput._(this._$data);

  factory Input$userDetailsInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('firstname')) {
      final l$firstname = data['firstname'];
      result$data['firstname'] = (l$firstname as String?);
    }
    if (data.containsKey('lastname')) {
      final l$lastname = data['lastname'];
      result$data['lastname'] = (l$lastname as String?);
    }
    return Input$userDetailsInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get firstname => (_$data['firstname'] as String?);

  String? get lastname => (_$data['lastname'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('firstname')) {
      final l$firstname = firstname;
      result$data['firstname'] = l$firstname;
    }
    if (_$data.containsKey('lastname')) {
      final l$lastname = lastname;
      result$data['lastname'] = l$lastname;
    }
    return result$data;
  }

  CopyWith$Input$userDetailsInput<Input$userDetailsInput> get copyWith =>
      CopyWith$Input$userDetailsInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$userDetailsInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$firstname = firstname;
    final lOther$firstname = other.firstname;
    if (_$data.containsKey('firstname') !=
        other._$data.containsKey('firstname')) {
      return false;
    }
    if (l$firstname != lOther$firstname) {
      return false;
    }
    final l$lastname = lastname;
    final lOther$lastname = other.lastname;
    if (_$data.containsKey('lastname') !=
        other._$data.containsKey('lastname')) {
      return false;
    }
    if (l$lastname != lOther$lastname) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$firstname = firstname;
    final l$lastname = lastname;
    return Object.hashAll([
      _$data.containsKey('firstname') ? l$firstname : const {},
      _$data.containsKey('lastname') ? l$lastname : const {},
    ]);
  }
}

abstract class CopyWith$Input$userDetailsInput<TRes> {
  factory CopyWith$Input$userDetailsInput(
    Input$userDetailsInput instance,
    TRes Function(Input$userDetailsInput) then,
  ) = _CopyWithImpl$Input$userDetailsInput;

  factory CopyWith$Input$userDetailsInput.stub(TRes res) =
      _CopyWithStubImpl$Input$userDetailsInput;

  TRes call({String? firstname, String? lastname});
}

class _CopyWithImpl$Input$userDetailsInput<TRes>
    implements CopyWith$Input$userDetailsInput<TRes> {
  _CopyWithImpl$Input$userDetailsInput(this._instance, this._then);

  final Input$userDetailsInput _instance;

  final TRes Function(Input$userDetailsInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? firstname = _undefined, Object? lastname = _undefined}) =>
      _then(
        Input$userDetailsInput._({
          ..._instance._$data,
          if (firstname != _undefined) 'firstname': (firstname as String?),
          if (lastname != _undefined) 'lastname': (lastname as String?),
        }),
      );
}

class _CopyWithStubImpl$Input$userDetailsInput<TRes>
    implements CopyWith$Input$userDetailsInput<TRes> {
  _CopyWithStubImpl$Input$userDetailsInput(this._res);

  TRes _res;

  call({String? firstname, String? lastname}) => _res;
}

class Input$userLoginParams {
  factory Input$userLoginParams({
    required String email,
    required String password,
    String? userType,
  }) => Input$userLoginParams._({
    r'email': email,
    r'password': password,
    if (userType != null) r'userType': userType,
  });

  Input$userLoginParams._(this._$data);

  factory Input$userLoginParams.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    final l$password = data['password'];
    result$data['password'] = (l$password as String);
    if (data.containsKey('userType')) {
      final l$userType = data['userType'];
      result$data['userType'] = (l$userType as String?);
    }
    return Input$userLoginParams._(result$data);
  }

  Map<String, dynamic> _$data;

  String get email => (_$data['email'] as String);

  String get password => (_$data['password'] as String);

  String? get userType => (_$data['userType'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$email = email;
    result$data['email'] = l$email;
    final l$password = password;
    result$data['password'] = l$password;
    if (_$data.containsKey('userType')) {
      final l$userType = userType;
      result$data['userType'] = l$userType;
    }
    return result$data;
  }

  CopyWith$Input$userLoginParams<Input$userLoginParams> get copyWith =>
      CopyWith$Input$userLoginParams(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$userLoginParams || runtimeType != other.runtimeType) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$password = password;
    final lOther$password = other.password;
    if (l$password != lOther$password) {
      return false;
    }
    final l$userType = userType;
    final lOther$userType = other.userType;
    if (_$data.containsKey('userType') !=
        other._$data.containsKey('userType')) {
      return false;
    }
    if (l$userType != lOther$userType) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    final l$password = password;
    final l$userType = userType;
    return Object.hashAll([
      l$email,
      l$password,
      _$data.containsKey('userType') ? l$userType : const {},
    ]);
  }
}

abstract class CopyWith$Input$userLoginParams<TRes> {
  factory CopyWith$Input$userLoginParams(
    Input$userLoginParams instance,
    TRes Function(Input$userLoginParams) then,
  ) = _CopyWithImpl$Input$userLoginParams;

  factory CopyWith$Input$userLoginParams.stub(TRes res) =
      _CopyWithStubImpl$Input$userLoginParams;

  TRes call({String? email, String? password, String? userType});
}

class _CopyWithImpl$Input$userLoginParams<TRes>
    implements CopyWith$Input$userLoginParams<TRes> {
  _CopyWithImpl$Input$userLoginParams(this._instance, this._then);

  final Input$userLoginParams _instance;

  final TRes Function(Input$userLoginParams) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? email = _undefined,
    Object? password = _undefined,
    Object? userType = _undefined,
  }) => _then(
    Input$userLoginParams._({
      ..._instance._$data,
      if (email != _undefined && email != null) 'email': (email as String),
      if (password != _undefined && password != null)
        'password': (password as String),
      if (userType != _undefined) 'userType': (userType as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$userLoginParams<TRes>
    implements CopyWith$Input$userLoginParams<TRes> {
  _CopyWithStubImpl$Input$userLoginParams(this._res);

  TRes _res;

  call({String? email, String? password, String? userType}) => _res;
}

class Input$userSettingsInput {
  factory Input$userSettingsInput({
    required bool public,
    required bool searchable,
    required bool showEmail,
    required bool showFullName,
  }) => Input$userSettingsInput._({
    r'public': public,
    r'searchable': searchable,
    r'showEmail': showEmail,
    r'showFullName': showFullName,
  });

  Input$userSettingsInput._(this._$data);

  factory Input$userSettingsInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$public = data['public'];
    result$data['public'] = (l$public as bool);
    final l$searchable = data['searchable'];
    result$data['searchable'] = (l$searchable as bool);
    final l$showEmail = data['showEmail'];
    result$data['showEmail'] = (l$showEmail as bool);
    final l$showFullName = data['showFullName'];
    result$data['showFullName'] = (l$showFullName as bool);
    return Input$userSettingsInput._(result$data);
  }

  Map<String, dynamic> _$data;

  bool get public => (_$data['public'] as bool);

  bool get searchable => (_$data['searchable'] as bool);

  bool get showEmail => (_$data['showEmail'] as bool);

  bool get showFullName => (_$data['showFullName'] as bool);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$public = public;
    result$data['public'] = l$public;
    final l$searchable = searchable;
    result$data['searchable'] = l$searchable;
    final l$showEmail = showEmail;
    result$data['showEmail'] = l$showEmail;
    final l$showFullName = showFullName;
    result$data['showFullName'] = l$showFullName;
    return result$data;
  }

  CopyWith$Input$userSettingsInput<Input$userSettingsInput> get copyWith =>
      CopyWith$Input$userSettingsInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$userSettingsInput || runtimeType != other.runtimeType) {
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
    final l$showEmail = showEmail;
    final lOther$showEmail = other.showEmail;
    if (l$showEmail != lOther$showEmail) {
      return false;
    }
    final l$showFullName = showFullName;
    final lOther$showFullName = other.showFullName;
    if (l$showFullName != lOther$showFullName) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$public = public;
    final l$searchable = searchable;
    final l$showEmail = showEmail;
    final l$showFullName = showFullName;
    return Object.hashAll([
      l$public,
      l$searchable,
      l$showEmail,
      l$showFullName,
    ]);
  }
}

abstract class CopyWith$Input$userSettingsInput<TRes> {
  factory CopyWith$Input$userSettingsInput(
    Input$userSettingsInput instance,
    TRes Function(Input$userSettingsInput) then,
  ) = _CopyWithImpl$Input$userSettingsInput;

  factory CopyWith$Input$userSettingsInput.stub(TRes res) =
      _CopyWithStubImpl$Input$userSettingsInput;

  TRes call({
    bool? public,
    bool? searchable,
    bool? showEmail,
    bool? showFullName,
  });
}

class _CopyWithImpl$Input$userSettingsInput<TRes>
    implements CopyWith$Input$userSettingsInput<TRes> {
  _CopyWithImpl$Input$userSettingsInput(this._instance, this._then);

  final Input$userSettingsInput _instance;

  final TRes Function(Input$userSettingsInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? public = _undefined,
    Object? searchable = _undefined,
    Object? showEmail = _undefined,
    Object? showFullName = _undefined,
  }) => _then(
    Input$userSettingsInput._({
      ..._instance._$data,
      if (public != _undefined && public != null) 'public': (public as bool),
      if (searchable != _undefined && searchable != null)
        'searchable': (searchable as bool),
      if (showEmail != _undefined && showEmail != null)
        'showEmail': (showEmail as bool),
      if (showFullName != _undefined && showFullName != null)
        'showFullName': (showFullName as bool),
    }),
  );
}

class _CopyWithStubImpl$Input$userSettingsInput<TRes>
    implements CopyWith$Input$userSettingsInput<TRes> {
  _CopyWithStubImpl$Input$userSettingsInput(this._res);

  TRes _res;

  call({bool? public, bool? searchable, bool? showEmail, bool? showFullName}) =>
      _res;
}

enum Enum$dbFilter_enum {
  like,
  equals,
  $unknown;

  factory Enum$dbFilter_enum.fromJson(String value) =>
      fromJson$Enum$dbFilter_enum(value);

  String toJson() => toJson$Enum$dbFilter_enum(this);
}

String toJson$Enum$dbFilter_enum(Enum$dbFilter_enum e) {
  switch (e) {
    case Enum$dbFilter_enum.like:
      return r'like';
    case Enum$dbFilter_enum.equals:
      return r'equals';
    case Enum$dbFilter_enum.$unknown:
      return r'$unknown';
  }
}

Enum$dbFilter_enum fromJson$Enum$dbFilter_enum(String value) {
  switch (value) {
    case r'like':
      return Enum$dbFilter_enum.like;
    case r'equals':
      return Enum$dbFilter_enum.equals;
    default:
      return Enum$dbFilter_enum.$unknown;
  }
}

enum Enum$dbOrder_enum {
  asc,
  desc,
  $unknown;

  factory Enum$dbOrder_enum.fromJson(String value) =>
      fromJson$Enum$dbOrder_enum(value);

  String toJson() => toJson$Enum$dbOrder_enum(this);
}

String toJson$Enum$dbOrder_enum(Enum$dbOrder_enum e) {
  switch (e) {
    case Enum$dbOrder_enum.asc:
      return r'asc';
    case Enum$dbOrder_enum.desc:
      return r'desc';
    case Enum$dbOrder_enum.$unknown:
      return r'$unknown';
  }
}

Enum$dbOrder_enum fromJson$Enum$dbOrder_enum(String value) {
  switch (value) {
    case r'asc':
      return Enum$dbOrder_enum.asc;
    case r'desc':
      return Enum$dbOrder_enum.desc;
    default:
      return Enum$dbOrder_enum.$unknown;
  }
}

enum Enum$newsTypes_enum {
  current,
  alert,
  warning,
  $unknown;

  factory Enum$newsTypes_enum.fromJson(String value) =>
      fromJson$Enum$newsTypes_enum(value);

  String toJson() => toJson$Enum$newsTypes_enum(this);
}

String toJson$Enum$newsTypes_enum(Enum$newsTypes_enum e) {
  switch (e) {
    case Enum$newsTypes_enum.current:
      return r'current';
    case Enum$newsTypes_enum.alert:
      return r'alert';
    case Enum$newsTypes_enum.warning:
      return r'warning';
    case Enum$newsTypes_enum.$unknown:
      return r'$unknown';
  }
}

Enum$newsTypes_enum fromJson$Enum$newsTypes_enum(String value) {
  switch (value) {
    case r'current':
      return Enum$newsTypes_enum.current;
    case r'alert':
      return Enum$newsTypes_enum.alert;
    case r'warning':
      return Enum$newsTypes_enum.warning;
    default:
      return Enum$newsTypes_enum.$unknown;
  }
}

enum Enum$switch_enum {
  ON,
  OFF,
  $unknown;

  factory Enum$switch_enum.fromJson(String value) =>
      fromJson$Enum$switch_enum(value);

  String toJson() => toJson$Enum$switch_enum(this);
}

String toJson$Enum$switch_enum(Enum$switch_enum e) {
  switch (e) {
    case Enum$switch_enum.ON:
      return r'ON';
    case Enum$switch_enum.OFF:
      return r'OFF';
    case Enum$switch_enum.$unknown:
      return r'$unknown';
  }
}

Enum$switch_enum fromJson$Enum$switch_enum(String value) {
  switch (value) {
    case r'ON':
      return Enum$switch_enum.ON;
    case r'OFF':
      return Enum$switch_enum.OFF;
    default:
      return Enum$switch_enum.$unknown;
  }
}

enum Enum$yesNo_enum {
  YES,
  NO,
  $unknown;

  factory Enum$yesNo_enum.fromJson(String value) =>
      fromJson$Enum$yesNo_enum(value);

  String toJson() => toJson$Enum$yesNo_enum(this);
}

String toJson$Enum$yesNo_enum(Enum$yesNo_enum e) {
  switch (e) {
    case Enum$yesNo_enum.YES:
      return r'YES';
    case Enum$yesNo_enum.NO:
      return r'NO';
    case Enum$yesNo_enum.$unknown:
      return r'$unknown';
  }
}

Enum$yesNo_enum fromJson$Enum$yesNo_enum(String value) {
  switch (value) {
    case r'YES':
      return Enum$yesNo_enum.YES;
    case r'NO':
      return Enum$yesNo_enum.NO;
    default:
      return Enum$yesNo_enum.$unknown;
  }
}

enum Enum$__TypeKind {
  SCALAR,
  OBJECT,
  INTERFACE,
  UNION,
  ENUM,
  INPUT_OBJECT,
  LIST,
  NON_NULL,
  $unknown;

  factory Enum$__TypeKind.fromJson(String value) =>
      fromJson$Enum$__TypeKind(value);

  String toJson() => toJson$Enum$__TypeKind(this);
}

String toJson$Enum$__TypeKind(Enum$__TypeKind e) {
  switch (e) {
    case Enum$__TypeKind.SCALAR:
      return r'SCALAR';
    case Enum$__TypeKind.OBJECT:
      return r'OBJECT';
    case Enum$__TypeKind.INTERFACE:
      return r'INTERFACE';
    case Enum$__TypeKind.UNION:
      return r'UNION';
    case Enum$__TypeKind.ENUM:
      return r'ENUM';
    case Enum$__TypeKind.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__TypeKind.LIST:
      return r'LIST';
    case Enum$__TypeKind.NON_NULL:
      return r'NON_NULL';
    case Enum$__TypeKind.$unknown:
      return r'$unknown';
  }
}

Enum$__TypeKind fromJson$Enum$__TypeKind(String value) {
  switch (value) {
    case r'SCALAR':
      return Enum$__TypeKind.SCALAR;
    case r'OBJECT':
      return Enum$__TypeKind.OBJECT;
    case r'INTERFACE':
      return Enum$__TypeKind.INTERFACE;
    case r'UNION':
      return Enum$__TypeKind.UNION;
    case r'ENUM':
      return Enum$__TypeKind.ENUM;
    case r'INPUT_OBJECT':
      return Enum$__TypeKind.INPUT_OBJECT;
    case r'LIST':
      return Enum$__TypeKind.LIST;
    case r'NON_NULL':
      return Enum$__TypeKind.NON_NULL;
    default:
      return Enum$__TypeKind.$unknown;
  }
}

enum Enum$__DirectiveLocation {
  QUERY,
  MUTATION,
  SUBSCRIPTION,
  FIELD,
  FRAGMENT_DEFINITION,
  FRAGMENT_SPREAD,
  INLINE_FRAGMENT,
  VARIABLE_DEFINITION,
  SCHEMA,
  SCALAR,
  OBJECT,
  FIELD_DEFINITION,
  ARGUMENT_DEFINITION,
  INTERFACE,
  UNION,
  ENUM,
  ENUM_VALUE,
  INPUT_OBJECT,
  INPUT_FIELD_DEFINITION,
  $unknown;

  factory Enum$__DirectiveLocation.fromJson(String value) =>
      fromJson$Enum$__DirectiveLocation(value);

  String toJson() => toJson$Enum$__DirectiveLocation(this);
}

String toJson$Enum$__DirectiveLocation(Enum$__DirectiveLocation e) {
  switch (e) {
    case Enum$__DirectiveLocation.QUERY:
      return r'QUERY';
    case Enum$__DirectiveLocation.MUTATION:
      return r'MUTATION';
    case Enum$__DirectiveLocation.SUBSCRIPTION:
      return r'SUBSCRIPTION';
    case Enum$__DirectiveLocation.FIELD:
      return r'FIELD';
    case Enum$__DirectiveLocation.FRAGMENT_DEFINITION:
      return r'FRAGMENT_DEFINITION';
    case Enum$__DirectiveLocation.FRAGMENT_SPREAD:
      return r'FRAGMENT_SPREAD';
    case Enum$__DirectiveLocation.INLINE_FRAGMENT:
      return r'INLINE_FRAGMENT';
    case Enum$__DirectiveLocation.VARIABLE_DEFINITION:
      return r'VARIABLE_DEFINITION';
    case Enum$__DirectiveLocation.SCHEMA:
      return r'SCHEMA';
    case Enum$__DirectiveLocation.SCALAR:
      return r'SCALAR';
    case Enum$__DirectiveLocation.OBJECT:
      return r'OBJECT';
    case Enum$__DirectiveLocation.FIELD_DEFINITION:
      return r'FIELD_DEFINITION';
    case Enum$__DirectiveLocation.ARGUMENT_DEFINITION:
      return r'ARGUMENT_DEFINITION';
    case Enum$__DirectiveLocation.INTERFACE:
      return r'INTERFACE';
    case Enum$__DirectiveLocation.UNION:
      return r'UNION';
    case Enum$__DirectiveLocation.ENUM:
      return r'ENUM';
    case Enum$__DirectiveLocation.ENUM_VALUE:
      return r'ENUM_VALUE';
    case Enum$__DirectiveLocation.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION:
      return r'INPUT_FIELD_DEFINITION';
    case Enum$__DirectiveLocation.$unknown:
      return r'$unknown';
  }
}

Enum$__DirectiveLocation fromJson$Enum$__DirectiveLocation(String value) {
  switch (value) {
    case r'QUERY':
      return Enum$__DirectiveLocation.QUERY;
    case r'MUTATION':
      return Enum$__DirectiveLocation.MUTATION;
    case r'SUBSCRIPTION':
      return Enum$__DirectiveLocation.SUBSCRIPTION;
    case r'FIELD':
      return Enum$__DirectiveLocation.FIELD;
    case r'FRAGMENT_DEFINITION':
      return Enum$__DirectiveLocation.FRAGMENT_DEFINITION;
    case r'FRAGMENT_SPREAD':
      return Enum$__DirectiveLocation.FRAGMENT_SPREAD;
    case r'INLINE_FRAGMENT':
      return Enum$__DirectiveLocation.INLINE_FRAGMENT;
    case r'VARIABLE_DEFINITION':
      return Enum$__DirectiveLocation.VARIABLE_DEFINITION;
    case r'SCHEMA':
      return Enum$__DirectiveLocation.SCHEMA;
    case r'SCALAR':
      return Enum$__DirectiveLocation.SCALAR;
    case r'OBJECT':
      return Enum$__DirectiveLocation.OBJECT;
    case r'FIELD_DEFINITION':
      return Enum$__DirectiveLocation.FIELD_DEFINITION;
    case r'ARGUMENT_DEFINITION':
      return Enum$__DirectiveLocation.ARGUMENT_DEFINITION;
    case r'INTERFACE':
      return Enum$__DirectiveLocation.INTERFACE;
    case r'UNION':
      return Enum$__DirectiveLocation.UNION;
    case r'ENUM':
      return Enum$__DirectiveLocation.ENUM;
    case r'ENUM_VALUE':
      return Enum$__DirectiveLocation.ENUM_VALUE;
    case r'INPUT_OBJECT':
      return Enum$__DirectiveLocation.INPUT_OBJECT;
    case r'INPUT_FIELD_DEFINITION':
      return Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION;
    default:
      return Enum$__DirectiveLocation.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{};
