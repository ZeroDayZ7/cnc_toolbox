// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $SearchResultsTable extends SearchResults
    with TableInfo<$SearchResultsTable, SearchResult> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SearchResultsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _queryMeta = const VerificationMeta('query');
  @override
  late final GeneratedColumn<String> query = GeneratedColumn<String>(
    'query',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _resultJsonMeta = const VerificationMeta(
    'resultJson',
  );
  @override
  late final GeneratedColumn<String> resultJson = GeneratedColumn<String>(
    'result_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, query, resultJson, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'search_results';
  @override
  VerificationContext validateIntegrity(
    Insertable<SearchResult> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('query')) {
      context.handle(
        _queryMeta,
        query.isAcceptableOrUnknown(data['query']!, _queryMeta),
      );
    } else if (isInserting) {
      context.missing(_queryMeta);
    }
    if (data.containsKey('result_json')) {
      context.handle(
        _resultJsonMeta,
        resultJson.isAcceptableOrUnknown(data['result_json']!, _resultJsonMeta),
      );
    } else if (isInserting) {
      context.missing(_resultJsonMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SearchResult map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SearchResult(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      query: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}query'],
      )!,
      resultJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}result_json'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $SearchResultsTable createAlias(String alias) {
    return $SearchResultsTable(attachedDatabase, alias);
  }
}

class SearchResult extends DataClass implements Insertable<SearchResult> {
  final int id;
  final String query;
  final String resultJson;
  final DateTime createdAt;
  const SearchResult({
    required this.id,
    required this.query,
    required this.resultJson,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['query'] = Variable<String>(query);
    map['result_json'] = Variable<String>(resultJson);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SearchResultsCompanion toCompanion(bool nullToAbsent) {
    return SearchResultsCompanion(
      id: Value(id),
      query: Value(query),
      resultJson: Value(resultJson),
      createdAt: Value(createdAt),
    );
  }

  factory SearchResult.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SearchResult(
      id: serializer.fromJson<int>(json['id']),
      query: serializer.fromJson<String>(json['query']),
      resultJson: serializer.fromJson<String>(json['resultJson']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'query': serializer.toJson<String>(query),
      'resultJson': serializer.toJson<String>(resultJson),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  SearchResult copyWith({
    int? id,
    String? query,
    String? resultJson,
    DateTime? createdAt,
  }) => SearchResult(
    id: id ?? this.id,
    query: query ?? this.query,
    resultJson: resultJson ?? this.resultJson,
    createdAt: createdAt ?? this.createdAt,
  );
  SearchResult copyWithCompanion(SearchResultsCompanion data) {
    return SearchResult(
      id: data.id.present ? data.id.value : this.id,
      query: data.query.present ? data.query.value : this.query,
      resultJson: data.resultJson.present
          ? data.resultJson.value
          : this.resultJson,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SearchResult(')
          ..write('id: $id, ')
          ..write('query: $query, ')
          ..write('resultJson: $resultJson, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, query, resultJson, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchResult &&
          other.id == this.id &&
          other.query == this.query &&
          other.resultJson == this.resultJson &&
          other.createdAt == this.createdAt);
}

class SearchResultsCompanion extends UpdateCompanion<SearchResult> {
  final Value<int> id;
  final Value<String> query;
  final Value<String> resultJson;
  final Value<DateTime> createdAt;
  const SearchResultsCompanion({
    this.id = const Value.absent(),
    this.query = const Value.absent(),
    this.resultJson = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  SearchResultsCompanion.insert({
    this.id = const Value.absent(),
    required String query,
    required String resultJson,
    this.createdAt = const Value.absent(),
  }) : query = Value(query),
       resultJson = Value(resultJson);
  static Insertable<SearchResult> custom({
    Expression<int>? id,
    Expression<String>? query,
    Expression<String>? resultJson,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (query != null) 'query': query,
      if (resultJson != null) 'result_json': resultJson,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SearchResultsCompanion copyWith({
    Value<int>? id,
    Value<String>? query,
    Value<String>? resultJson,
    Value<DateTime>? createdAt,
  }) {
    return SearchResultsCompanion(
      id: id ?? this.id,
      query: query ?? this.query,
      resultJson: resultJson ?? this.resultJson,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (query.present) {
      map['query'] = Variable<String>(query.value);
    }
    if (resultJson.present) {
      map['result_json'] = Variable<String>(resultJson.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SearchResultsCompanion(')
          ..write('id: $id, ')
          ..write('query: $query, ')
          ..write('resultJson: $resultJson, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $FeedCalculationsTable extends FeedCalculations
    with TableInfo<$FeedCalculationsTable, FeedCalculation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FeedCalculationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _spindleSpeedMeta = const VerificationMeta(
    'spindleSpeed',
  );
  @override
  late final GeneratedColumn<double> spindleSpeed = GeneratedColumn<double>(
    'spindle_speed',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _feedPerToothMeta = const VerificationMeta(
    'feedPerTooth',
  );
  @override
  late final GeneratedColumn<double> feedPerTooth = GeneratedColumn<double>(
    'feed_per_tooth',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _teethMeta = const VerificationMeta('teeth');
  @override
  late final GeneratedColumn<int> teeth = GeneratedColumn<int>(
    'teeth',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _toolDiameterMeta = const VerificationMeta(
    'toolDiameter',
  );
  @override
  late final GeneratedColumn<double> toolDiameter = GeneratedColumn<double>(
    'tool_diameter',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _featureDiameterMeta = const VerificationMeta(
    'featureDiameter',
  );
  @override
  late final GeneratedColumn<double> featureDiameter = GeneratedColumn<double>(
    'feature_diameter',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _resultVfMeta = const VerificationMeta(
    'resultVf',
  );
  @override
  late final GeneratedColumn<double> resultVf = GeneratedColumn<double>(
    'result_vf',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    spindleSpeed,
    feedPerTooth,
    teeth,
    toolDiameter,
    featureDiameter,
    resultVf,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'feed_calculations';
  @override
  VerificationContext validateIntegrity(
    Insertable<FeedCalculation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('spindle_speed')) {
      context.handle(
        _spindleSpeedMeta,
        spindleSpeed.isAcceptableOrUnknown(
          data['spindle_speed']!,
          _spindleSpeedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_spindleSpeedMeta);
    }
    if (data.containsKey('feed_per_tooth')) {
      context.handle(
        _feedPerToothMeta,
        feedPerTooth.isAcceptableOrUnknown(
          data['feed_per_tooth']!,
          _feedPerToothMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_feedPerToothMeta);
    }
    if (data.containsKey('teeth')) {
      context.handle(
        _teethMeta,
        teeth.isAcceptableOrUnknown(data['teeth']!, _teethMeta),
      );
    } else if (isInserting) {
      context.missing(_teethMeta);
    }
    if (data.containsKey('tool_diameter')) {
      context.handle(
        _toolDiameterMeta,
        toolDiameter.isAcceptableOrUnknown(
          data['tool_diameter']!,
          _toolDiameterMeta,
        ),
      );
    }
    if (data.containsKey('feature_diameter')) {
      context.handle(
        _featureDiameterMeta,
        featureDiameter.isAcceptableOrUnknown(
          data['feature_diameter']!,
          _featureDiameterMeta,
        ),
      );
    }
    if (data.containsKey('result_vf')) {
      context.handle(
        _resultVfMeta,
        resultVf.isAcceptableOrUnknown(data['result_vf']!, _resultVfMeta),
      );
    } else if (isInserting) {
      context.missing(_resultVfMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FeedCalculation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FeedCalculation(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      spindleSpeed: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}spindle_speed'],
      )!,
      feedPerTooth: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}feed_per_tooth'],
      )!,
      teeth: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}teeth'],
      )!,
      toolDiameter: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}tool_diameter'],
      ),
      featureDiameter: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}feature_diameter'],
      ),
      resultVf: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}result_vf'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $FeedCalculationsTable createAlias(String alias) {
    return $FeedCalculationsTable(attachedDatabase, alias);
  }
}

class FeedCalculation extends DataClass implements Insertable<FeedCalculation> {
  final int id;
  final double spindleSpeed;
  final double feedPerTooth;
  final int teeth;
  final double? toolDiameter;
  final double? featureDiameter;
  final double resultVf;
  final DateTime createdAt;
  const FeedCalculation({
    required this.id,
    required this.spindleSpeed,
    required this.feedPerTooth,
    required this.teeth,
    this.toolDiameter,
    this.featureDiameter,
    required this.resultVf,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['spindle_speed'] = Variable<double>(spindleSpeed);
    map['feed_per_tooth'] = Variable<double>(feedPerTooth);
    map['teeth'] = Variable<int>(teeth);
    if (!nullToAbsent || toolDiameter != null) {
      map['tool_diameter'] = Variable<double>(toolDiameter);
    }
    if (!nullToAbsent || featureDiameter != null) {
      map['feature_diameter'] = Variable<double>(featureDiameter);
    }
    map['result_vf'] = Variable<double>(resultVf);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  FeedCalculationsCompanion toCompanion(bool nullToAbsent) {
    return FeedCalculationsCompanion(
      id: Value(id),
      spindleSpeed: Value(spindleSpeed),
      feedPerTooth: Value(feedPerTooth),
      teeth: Value(teeth),
      toolDiameter: toolDiameter == null && nullToAbsent
          ? const Value.absent()
          : Value(toolDiameter),
      featureDiameter: featureDiameter == null && nullToAbsent
          ? const Value.absent()
          : Value(featureDiameter),
      resultVf: Value(resultVf),
      createdAt: Value(createdAt),
    );
  }

  factory FeedCalculation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FeedCalculation(
      id: serializer.fromJson<int>(json['id']),
      spindleSpeed: serializer.fromJson<double>(json['spindleSpeed']),
      feedPerTooth: serializer.fromJson<double>(json['feedPerTooth']),
      teeth: serializer.fromJson<int>(json['teeth']),
      toolDiameter: serializer.fromJson<double?>(json['toolDiameter']),
      featureDiameter: serializer.fromJson<double?>(json['featureDiameter']),
      resultVf: serializer.fromJson<double>(json['resultVf']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'spindleSpeed': serializer.toJson<double>(spindleSpeed),
      'feedPerTooth': serializer.toJson<double>(feedPerTooth),
      'teeth': serializer.toJson<int>(teeth),
      'toolDiameter': serializer.toJson<double?>(toolDiameter),
      'featureDiameter': serializer.toJson<double?>(featureDiameter),
      'resultVf': serializer.toJson<double>(resultVf),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  FeedCalculation copyWith({
    int? id,
    double? spindleSpeed,
    double? feedPerTooth,
    int? teeth,
    Value<double?> toolDiameter = const Value.absent(),
    Value<double?> featureDiameter = const Value.absent(),
    double? resultVf,
    DateTime? createdAt,
  }) => FeedCalculation(
    id: id ?? this.id,
    spindleSpeed: spindleSpeed ?? this.spindleSpeed,
    feedPerTooth: feedPerTooth ?? this.feedPerTooth,
    teeth: teeth ?? this.teeth,
    toolDiameter: toolDiameter.present ? toolDiameter.value : this.toolDiameter,
    featureDiameter: featureDiameter.present
        ? featureDiameter.value
        : this.featureDiameter,
    resultVf: resultVf ?? this.resultVf,
    createdAt: createdAt ?? this.createdAt,
  );
  FeedCalculation copyWithCompanion(FeedCalculationsCompanion data) {
    return FeedCalculation(
      id: data.id.present ? data.id.value : this.id,
      spindleSpeed: data.spindleSpeed.present
          ? data.spindleSpeed.value
          : this.spindleSpeed,
      feedPerTooth: data.feedPerTooth.present
          ? data.feedPerTooth.value
          : this.feedPerTooth,
      teeth: data.teeth.present ? data.teeth.value : this.teeth,
      toolDiameter: data.toolDiameter.present
          ? data.toolDiameter.value
          : this.toolDiameter,
      featureDiameter: data.featureDiameter.present
          ? data.featureDiameter.value
          : this.featureDiameter,
      resultVf: data.resultVf.present ? data.resultVf.value : this.resultVf,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FeedCalculation(')
          ..write('id: $id, ')
          ..write('spindleSpeed: $spindleSpeed, ')
          ..write('feedPerTooth: $feedPerTooth, ')
          ..write('teeth: $teeth, ')
          ..write('toolDiameter: $toolDiameter, ')
          ..write('featureDiameter: $featureDiameter, ')
          ..write('resultVf: $resultVf, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    spindleSpeed,
    feedPerTooth,
    teeth,
    toolDiameter,
    featureDiameter,
    resultVf,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FeedCalculation &&
          other.id == this.id &&
          other.spindleSpeed == this.spindleSpeed &&
          other.feedPerTooth == this.feedPerTooth &&
          other.teeth == this.teeth &&
          other.toolDiameter == this.toolDiameter &&
          other.featureDiameter == this.featureDiameter &&
          other.resultVf == this.resultVf &&
          other.createdAt == this.createdAt);
}

class FeedCalculationsCompanion extends UpdateCompanion<FeedCalculation> {
  final Value<int> id;
  final Value<double> spindleSpeed;
  final Value<double> feedPerTooth;
  final Value<int> teeth;
  final Value<double?> toolDiameter;
  final Value<double?> featureDiameter;
  final Value<double> resultVf;
  final Value<DateTime> createdAt;
  const FeedCalculationsCompanion({
    this.id = const Value.absent(),
    this.spindleSpeed = const Value.absent(),
    this.feedPerTooth = const Value.absent(),
    this.teeth = const Value.absent(),
    this.toolDiameter = const Value.absent(),
    this.featureDiameter = const Value.absent(),
    this.resultVf = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  FeedCalculationsCompanion.insert({
    this.id = const Value.absent(),
    required double spindleSpeed,
    required double feedPerTooth,
    required int teeth,
    this.toolDiameter = const Value.absent(),
    this.featureDiameter = const Value.absent(),
    required double resultVf,
    this.createdAt = const Value.absent(),
  }) : spindleSpeed = Value(spindleSpeed),
       feedPerTooth = Value(feedPerTooth),
       teeth = Value(teeth),
       resultVf = Value(resultVf);
  static Insertable<FeedCalculation> custom({
    Expression<int>? id,
    Expression<double>? spindleSpeed,
    Expression<double>? feedPerTooth,
    Expression<int>? teeth,
    Expression<double>? toolDiameter,
    Expression<double>? featureDiameter,
    Expression<double>? resultVf,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (spindleSpeed != null) 'spindle_speed': spindleSpeed,
      if (feedPerTooth != null) 'feed_per_tooth': feedPerTooth,
      if (teeth != null) 'teeth': teeth,
      if (toolDiameter != null) 'tool_diameter': toolDiameter,
      if (featureDiameter != null) 'feature_diameter': featureDiameter,
      if (resultVf != null) 'result_vf': resultVf,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  FeedCalculationsCompanion copyWith({
    Value<int>? id,
    Value<double>? spindleSpeed,
    Value<double>? feedPerTooth,
    Value<int>? teeth,
    Value<double?>? toolDiameter,
    Value<double?>? featureDiameter,
    Value<double>? resultVf,
    Value<DateTime>? createdAt,
  }) {
    return FeedCalculationsCompanion(
      id: id ?? this.id,
      spindleSpeed: spindleSpeed ?? this.spindleSpeed,
      feedPerTooth: feedPerTooth ?? this.feedPerTooth,
      teeth: teeth ?? this.teeth,
      toolDiameter: toolDiameter ?? this.toolDiameter,
      featureDiameter: featureDiameter ?? this.featureDiameter,
      resultVf: resultVf ?? this.resultVf,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (spindleSpeed.present) {
      map['spindle_speed'] = Variable<double>(spindleSpeed.value);
    }
    if (feedPerTooth.present) {
      map['feed_per_tooth'] = Variable<double>(feedPerTooth.value);
    }
    if (teeth.present) {
      map['teeth'] = Variable<int>(teeth.value);
    }
    if (toolDiameter.present) {
      map['tool_diameter'] = Variable<double>(toolDiameter.value);
    }
    if (featureDiameter.present) {
      map['feature_diameter'] = Variable<double>(featureDiameter.value);
    }
    if (resultVf.present) {
      map['result_vf'] = Variable<double>(resultVf.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FeedCalculationsCompanion(')
          ..write('id: $id, ')
          ..write('spindleSpeed: $spindleSpeed, ')
          ..write('feedPerTooth: $feedPerTooth, ')
          ..write('teeth: $teeth, ')
          ..write('toolDiameter: $toolDiameter, ')
          ..write('featureDiameter: $featureDiameter, ')
          ..write('resultVf: $resultVf, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SearchResultsTable searchResults = $SearchResultsTable(this);
  late final $FeedCalculationsTable feedCalculations = $FeedCalculationsTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    searchResults,
    feedCalculations,
  ];
}

typedef $$SearchResultsTableCreateCompanionBuilder =
    SearchResultsCompanion Function({
      Value<int> id,
      required String query,
      required String resultJson,
      Value<DateTime> createdAt,
    });
typedef $$SearchResultsTableUpdateCompanionBuilder =
    SearchResultsCompanion Function({
      Value<int> id,
      Value<String> query,
      Value<String> resultJson,
      Value<DateTime> createdAt,
    });

class $$SearchResultsTableFilterComposer
    extends Composer<_$AppDatabase, $SearchResultsTable> {
  $$SearchResultsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get query => $composableBuilder(
    column: $table.query,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get resultJson => $composableBuilder(
    column: $table.resultJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SearchResultsTableOrderingComposer
    extends Composer<_$AppDatabase, $SearchResultsTable> {
  $$SearchResultsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get query => $composableBuilder(
    column: $table.query,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get resultJson => $composableBuilder(
    column: $table.resultJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SearchResultsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SearchResultsTable> {
  $$SearchResultsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get query =>
      $composableBuilder(column: $table.query, builder: (column) => column);

  GeneratedColumn<String> get resultJson => $composableBuilder(
    column: $table.resultJson,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$SearchResultsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SearchResultsTable,
          SearchResult,
          $$SearchResultsTableFilterComposer,
          $$SearchResultsTableOrderingComposer,
          $$SearchResultsTableAnnotationComposer,
          $$SearchResultsTableCreateCompanionBuilder,
          $$SearchResultsTableUpdateCompanionBuilder,
          (
            SearchResult,
            BaseReferences<_$AppDatabase, $SearchResultsTable, SearchResult>,
          ),
          SearchResult,
          PrefetchHooks Function()
        > {
  $$SearchResultsTableTableManager(_$AppDatabase db, $SearchResultsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SearchResultsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SearchResultsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SearchResultsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> query = const Value.absent(),
                Value<String> resultJson = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SearchResultsCompanion(
                id: id,
                query: query,
                resultJson: resultJson,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String query,
                required String resultJson,
                Value<DateTime> createdAt = const Value.absent(),
              }) => SearchResultsCompanion.insert(
                id: id,
                query: query,
                resultJson: resultJson,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SearchResultsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SearchResultsTable,
      SearchResult,
      $$SearchResultsTableFilterComposer,
      $$SearchResultsTableOrderingComposer,
      $$SearchResultsTableAnnotationComposer,
      $$SearchResultsTableCreateCompanionBuilder,
      $$SearchResultsTableUpdateCompanionBuilder,
      (
        SearchResult,
        BaseReferences<_$AppDatabase, $SearchResultsTable, SearchResult>,
      ),
      SearchResult,
      PrefetchHooks Function()
    >;
typedef $$FeedCalculationsTableCreateCompanionBuilder =
    FeedCalculationsCompanion Function({
      Value<int> id,
      required double spindleSpeed,
      required double feedPerTooth,
      required int teeth,
      Value<double?> toolDiameter,
      Value<double?> featureDiameter,
      required double resultVf,
      Value<DateTime> createdAt,
    });
typedef $$FeedCalculationsTableUpdateCompanionBuilder =
    FeedCalculationsCompanion Function({
      Value<int> id,
      Value<double> spindleSpeed,
      Value<double> feedPerTooth,
      Value<int> teeth,
      Value<double?> toolDiameter,
      Value<double?> featureDiameter,
      Value<double> resultVf,
      Value<DateTime> createdAt,
    });

class $$FeedCalculationsTableFilterComposer
    extends Composer<_$AppDatabase, $FeedCalculationsTable> {
  $$FeedCalculationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get spindleSpeed => $composableBuilder(
    column: $table.spindleSpeed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get feedPerTooth => $composableBuilder(
    column: $table.feedPerTooth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get teeth => $composableBuilder(
    column: $table.teeth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get toolDiameter => $composableBuilder(
    column: $table.toolDiameter,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get featureDiameter => $composableBuilder(
    column: $table.featureDiameter,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get resultVf => $composableBuilder(
    column: $table.resultVf,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FeedCalculationsTableOrderingComposer
    extends Composer<_$AppDatabase, $FeedCalculationsTable> {
  $$FeedCalculationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get spindleSpeed => $composableBuilder(
    column: $table.spindleSpeed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get feedPerTooth => $composableBuilder(
    column: $table.feedPerTooth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get teeth => $composableBuilder(
    column: $table.teeth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get toolDiameter => $composableBuilder(
    column: $table.toolDiameter,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get featureDiameter => $composableBuilder(
    column: $table.featureDiameter,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get resultVf => $composableBuilder(
    column: $table.resultVf,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FeedCalculationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FeedCalculationsTable> {
  $$FeedCalculationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get spindleSpeed => $composableBuilder(
    column: $table.spindleSpeed,
    builder: (column) => column,
  );

  GeneratedColumn<double> get feedPerTooth => $composableBuilder(
    column: $table.feedPerTooth,
    builder: (column) => column,
  );

  GeneratedColumn<int> get teeth =>
      $composableBuilder(column: $table.teeth, builder: (column) => column);

  GeneratedColumn<double> get toolDiameter => $composableBuilder(
    column: $table.toolDiameter,
    builder: (column) => column,
  );

  GeneratedColumn<double> get featureDiameter => $composableBuilder(
    column: $table.featureDiameter,
    builder: (column) => column,
  );

  GeneratedColumn<double> get resultVf =>
      $composableBuilder(column: $table.resultVf, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$FeedCalculationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FeedCalculationsTable,
          FeedCalculation,
          $$FeedCalculationsTableFilterComposer,
          $$FeedCalculationsTableOrderingComposer,
          $$FeedCalculationsTableAnnotationComposer,
          $$FeedCalculationsTableCreateCompanionBuilder,
          $$FeedCalculationsTableUpdateCompanionBuilder,
          (
            FeedCalculation,
            BaseReferences<
              _$AppDatabase,
              $FeedCalculationsTable,
              FeedCalculation
            >,
          ),
          FeedCalculation,
          PrefetchHooks Function()
        > {
  $$FeedCalculationsTableTableManager(
    _$AppDatabase db,
    $FeedCalculationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FeedCalculationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FeedCalculationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FeedCalculationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double> spindleSpeed = const Value.absent(),
                Value<double> feedPerTooth = const Value.absent(),
                Value<int> teeth = const Value.absent(),
                Value<double?> toolDiameter = const Value.absent(),
                Value<double?> featureDiameter = const Value.absent(),
                Value<double> resultVf = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => FeedCalculationsCompanion(
                id: id,
                spindleSpeed: spindleSpeed,
                feedPerTooth: feedPerTooth,
                teeth: teeth,
                toolDiameter: toolDiameter,
                featureDiameter: featureDiameter,
                resultVf: resultVf,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required double spindleSpeed,
                required double feedPerTooth,
                required int teeth,
                Value<double?> toolDiameter = const Value.absent(),
                Value<double?> featureDiameter = const Value.absent(),
                required double resultVf,
                Value<DateTime> createdAt = const Value.absent(),
              }) => FeedCalculationsCompanion.insert(
                id: id,
                spindleSpeed: spindleSpeed,
                feedPerTooth: feedPerTooth,
                teeth: teeth,
                toolDiameter: toolDiameter,
                featureDiameter: featureDiameter,
                resultVf: resultVf,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FeedCalculationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FeedCalculationsTable,
      FeedCalculation,
      $$FeedCalculationsTableFilterComposer,
      $$FeedCalculationsTableOrderingComposer,
      $$FeedCalculationsTableAnnotationComposer,
      $$FeedCalculationsTableCreateCompanionBuilder,
      $$FeedCalculationsTableUpdateCompanionBuilder,
      (
        FeedCalculation,
        BaseReferences<_$AppDatabase, $FeedCalculationsTable, FeedCalculation>,
      ),
      FeedCalculation,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SearchResultsTableTableManager get searchResults =>
      $$SearchResultsTableTableManager(_db, _db.searchResults);
  $$FeedCalculationsTableTableManager get feedCalculations =>
      $$FeedCalculationsTableTableManager(_db, _db.feedCalculations);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for the [AppDatabase] instance.
///
/// Uses [keepAlive] to ensure the database connection remains open
/// throughout the application lifecycle.

@ProviderFor(database)
final databaseProvider = DatabaseProvider._();

/// Provider for the [AppDatabase] instance.
///
/// Uses [keepAlive] to ensure the database connection remains open
/// throughout the application lifecycle.

final class DatabaseProvider
    extends $FunctionalProvider<AppDatabase, AppDatabase, AppDatabase>
    with $Provider<AppDatabase> {
  /// Provider for the [AppDatabase] instance.
  ///
  /// Uses [keepAlive] to ensure the database connection remains open
  /// throughout the application lifecycle.
  DatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'databaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$databaseHash();

  @$internal
  @override
  $ProviderElement<AppDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppDatabase create(Ref ref) {
    return database(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDatabase>(value),
    );
  }
}

String _$databaseHash() => r'fd8e187bc7bddf0460b17f2a5f254600b81fcc54';
