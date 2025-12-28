// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

class Rig extends DataClass implements Insertable<Rig> {
  final int id;
  final String? name;
  final String mode;
  final String? lureType;
  final double? sizeCm;
  final double? weightG;
  final String? leaderType;
  final String? rigType;
  final String? hookSize;
  final double? leaderLengthCm;
  final double? leadWeightG;
  final String? baitType;
  final DateTime createdAt;
  const Rig({
    required this.id,
    this.name,
    required this.mode,
    this.lureType,
    this.sizeCm,
    this.weightG,
    this.leaderType,
    this.rigType,
    this.hookSize,
    this.leaderLengthCm,
    this.leadWeightG,
    this.baitType,
    required this.createdAt,
  });

  factory Rig.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Rig(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}name']),
      mode: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}mode'])!,
      lureType: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}lure_type']),
      sizeCm: const RealType().mapFromDatabaseResponse(data['${effectivePrefix}size_cm']),
      weightG: const RealType().mapFromDatabaseResponse(data['${effectivePrefix}weight_g']),
      leaderType: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}leader_type']),
      rigType: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}rig_type']),
      hookSize: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}hook_size']),
      leaderLengthCm:
          const RealType().mapFromDatabaseResponse(data['${effectivePrefix}leader_length_cm']),
      leadWeightG:
          const RealType().mapFromDatabaseResponse(data['${effectivePrefix}lead_weight_g']),
      baitType: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}bait_type']),
      createdAt: const DateTimeType().mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String?>(name);
    }
    map['mode'] = Variable<String>(mode);
    if (!nullToAbsent || lureType != null) {
      map['lure_type'] = Variable<String?>(lureType);
    }
    if (!nullToAbsent || sizeCm != null) {
      map['size_cm'] = Variable<double?>(sizeCm);
    }
    if (!nullToAbsent || weightG != null) {
      map['weight_g'] = Variable<double?>(weightG);
    }
    if (!nullToAbsent || leaderType != null) {
      map['leader_type'] = Variable<String?>(leaderType);
    }
    if (!nullToAbsent || rigType != null) {
      map['rig_type'] = Variable<String?>(rigType);
    }
    if (!nullToAbsent || hookSize != null) {
      map['hook_size'] = Variable<String?>(hookSize);
    }
    if (!nullToAbsent || leaderLengthCm != null) {
      map['leader_length_cm'] = Variable<double?>(leaderLengthCm);
    }
    if (!nullToAbsent || leadWeightG != null) {
      map['lead_weight_g'] = Variable<double?>(leadWeightG);
    }
    if (!nullToAbsent || baitType != null) {
      map['bait_type'] = Variable<String?>(baitType);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  RigsCompanion toCompanion(bool nullToAbsent) {
    return RigsCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      mode: Value(mode),
      lureType: lureType == null && nullToAbsent ? const Value.absent() : Value(lureType),
      sizeCm: sizeCm == null && nullToAbsent ? const Value.absent() : Value(sizeCm),
      weightG: weightG == null && nullToAbsent ? const Value.absent() : Value(weightG),
      leaderType: leaderType == null && nullToAbsent ? const Value.absent() : Value(leaderType),
      rigType: rigType == null && nullToAbsent ? const Value.absent() : Value(rigType),
      hookSize: hookSize == null && nullToAbsent ? const Value.absent() : Value(hookSize),
      leaderLengthCm: leaderLengthCm == null && nullToAbsent
          ? const Value.absent()
          : Value(leaderLengthCm),
      leadWeightG:
          leadWeightG == null && nullToAbsent ? const Value.absent() : Value(leadWeightG),
      baitType: baitType == null && nullToAbsent ? const Value.absent() : Value(baitType),
      createdAt: Value(createdAt),
    );
  }

  Rig copyWith({
    int? id,
    String? name,
    String? mode,
    String? lureType,
    double? sizeCm,
    double? weightG,
    String? leaderType,
    String? rigType,
    String? hookSize,
    double? leaderLengthCm,
    double? leadWeightG,
    String? baitType,
    DateTime? createdAt,
  }) {
    return Rig(
      id: id ?? this.id,
      name: name ?? this.name,
      mode: mode ?? this.mode,
      lureType: lureType ?? this.lureType,
      sizeCm: sizeCm ?? this.sizeCm,
      weightG: weightG ?? this.weightG,
      leaderType: leaderType ?? this.leaderType,
      rigType: rigType ?? this.rigType,
      hookSize: hookSize ?? this.hookSize,
      leaderLengthCm: leaderLengthCm ?? this.leaderLengthCm,
      leadWeightG: leadWeightG ?? this.leadWeightG,
      baitType: baitType ?? this.baitType,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Rig(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('mode: $mode, ')
          ..write('lureType: $lureType, ')
          ..write('sizeCm: $sizeCm, ')
          ..write('weightG: $weightG, ')
          ..write('leaderType: $leaderType, ')
          ..write('rigType: $rigType, ')
          ..write('hookSize: $hookSize, ')
          ..write('leaderLengthCm: $leaderLengthCm, ')
          ..write('leadWeightG: $leadWeightG, ')
          ..write('baitType: $baitType, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
        id,
        name,
        mode,
        lureType,
        sizeCm,
        weightG,
        leaderType,
        rigType,
        hookSize,
        leaderLengthCm,
        leadWeightG,
        baitType,
        createdAt,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Rig &&
          other.id == id &&
          other.name == name &&
          other.mode == mode &&
          other.lureType == lureType &&
          other.sizeCm == sizeCm &&
          other.weightG == weightG &&
          other.leaderType == leaderType &&
          other.rigType == rigType &&
          other.hookSize == hookSize &&
          other.leaderLengthCm == leaderLengthCm &&
          other.leadWeightG == leadWeightG &&
          other.baitType == baitType &&
          other.createdAt == createdAt);
}

class RigsCompanion extends UpdateCompanion<Rig> {
  final Value<int> id;
  final Value<String?> name;
  final Value<String> mode;
  final Value<String?> lureType;
  final Value<double?> sizeCm;
  final Value<double?> weightG;
  final Value<String?> leaderType;
  final Value<String?> rigType;
  final Value<String?> hookSize;
  final Value<double?> leaderLengthCm;
  final Value<double?> leadWeightG;
  final Value<String?> baitType;
  final Value<DateTime> createdAt;

  const RigsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.mode = const Value.absent(),
    this.lureType = const Value.absent(),
    this.sizeCm = const Value.absent(),
    this.weightG = const Value.absent(),
    this.leaderType = const Value.absent(),
    this.rigType = const Value.absent(),
    this.hookSize = const Value.absent(),
    this.leaderLengthCm = const Value.absent(),
    this.leadWeightG = const Value.absent(),
    this.baitType = const Value.absent(),
    this.createdAt = const Value.absent(),
  });

  RigsCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    required String mode,
    this.lureType = const Value.absent(),
    this.sizeCm = const Value.absent(),
    this.weightG = const Value.absent(),
    this.leaderType = const Value.absent(),
    this.rigType = const Value.absent(),
    this.hookSize = const Value.absent(),
    this.leaderLengthCm = const Value.absent(),
    this.leadWeightG = const Value.absent(),
    this.baitType = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : mode = Value(mode);

  static Insertable<Rig> custom({
    Expression<int>? id,
    Expression<String?>? name,
    Expression<String>? mode,
    Expression<String?>? lureType,
    Expression<double?>? sizeCm,
    Expression<double?>? weightG,
    Expression<String?>? leaderType,
    Expression<String?>? rigType,
    Expression<String?>? hookSize,
    Expression<double?>? leaderLengthCm,
    Expression<double?>? leadWeightG,
    Expression<String?>? baitType,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (mode != null) 'mode': mode,
      if (lureType != null) 'lure_type': lureType,
      if (sizeCm != null) 'size_cm': sizeCm,
      if (weightG != null) 'weight_g': weightG,
      if (leaderType != null) 'leader_type': leaderType,
      if (rigType != null) 'rig_type': rigType,
      if (hookSize != null) 'hook_size': hookSize,
      if (leaderLengthCm != null) 'leader_length_cm': leaderLengthCm,
      if (leadWeightG != null) 'lead_weight_g': leadWeightG,
      if (baitType != null) 'bait_type': baitType,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  RigsCompanion copyWith({
    Value<int>? id,
    Value<String?>? name,
    Value<String>? mode,
    Value<String?>? lureType,
    Value<double?>? sizeCm,
    Value<double?>? weightG,
    Value<String?>? leaderType,
    Value<String?>? rigType,
    Value<String?>? hookSize,
    Value<double?>? leaderLengthCm,
    Value<double?>? leadWeightG,
    Value<String?>? baitType,
    Value<DateTime>? createdAt,
  }) {
    return RigsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      mode: mode ?? this.mode,
      lureType: lureType ?? this.lureType,
      sizeCm: sizeCm ?? this.sizeCm,
      weightG: weightG ?? this.weightG,
      leaderType: leaderType ?? this.leaderType,
      rigType: rigType ?? this.rigType,
      hookSize: hookSize ?? this.hookSize,
      leaderLengthCm: leaderLengthCm ?? this.leaderLengthCm,
      leadWeightG: leadWeightG ?? this.leadWeightG,
      baitType: baitType ?? this.baitType,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String?>(name.value);
    }
    if (mode.present) {
      map['mode'] = Variable<String>(mode.value);
    }
    if (lureType.present) {
      map['lure_type'] = Variable<String?>(lureType.value);
    }
    if (sizeCm.present) {
      map['size_cm'] = Variable<double?>(sizeCm.value);
    }
    if (weightG.present) {
      map['weight_g'] = Variable<double?>(weightG.value);
    }
    if (leaderType.present) {
      map['leader_type'] = Variable<String?>(leaderType.value);
    }
    if (rigType.present) {
      map['rig_type'] = Variable<String?>(rigType.value);
    }
    if (hookSize.present) {
      map['hook_size'] = Variable<String?>(hookSize.value);
    }
    if (leaderLengthCm.present) {
      map['leader_length_cm'] = Variable<double?>(leaderLengthCm.value);
    }
    if (leadWeightG.present) {
      map['lead_weight_g'] = Variable<double?>(leadWeightG.value);
    }
    if (baitType.present) {
      map['bait_type'] = Variable<String?>(baitType.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RigsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('mode: $mode, ')
          ..write('lureType: $lureType, ')
          ..write('sizeCm: $sizeCm, ')
          ..write('weightG: $weightG, ')
          ..write('leaderType: $leaderType, ')
          ..write('rigType: $rigType, ')
          ..write('hookSize: $hookSize, ')
          ..write('leaderLengthCm: $leaderLengthCm, ')
          ..write('leadWeightG: $leadWeightG, ')
          ..write('baitType: $baitType, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $RigsTable extends Rigs with TableInfo<$RigsTable, Rig> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RigsTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _idMeta = VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    hasAutoIncrement: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'),
  );

  static const VerificationMeta _nameMeta = VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );

  static const VerificationMeta _modeMeta = VerificationMeta('mode');
  @override
  late final GeneratedColumn<String> mode = GeneratedColumn<String>(
    'mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );

  static const VerificationMeta _lureTypeMeta = VerificationMeta('lureType');
  @override
  late final GeneratedColumn<String> lureType = GeneratedColumn<String>(
    'lure_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );

  static const VerificationMeta _sizeCmMeta = VerificationMeta('sizeCm');
  @override
  late final GeneratedColumn<double> sizeCm = GeneratedColumn<double>(
    'size_cm',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );

  static const VerificationMeta _weightGMeta = VerificationMeta('weightG');
  @override
  late final GeneratedColumn<double> weightG = GeneratedColumn<double>(
    'weight_g',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );

  static const VerificationMeta _leaderTypeMeta = VerificationMeta('leaderType');
  @override
  late final GeneratedColumn<String> leaderType = GeneratedColumn<String>(
    'leader_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );

  static const VerificationMeta _rigTypeMeta = VerificationMeta('rigType');
  @override
  late final GeneratedColumn<String> rigType = GeneratedColumn<String>(
    'rig_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );

  static const VerificationMeta _hookSizeMeta = VerificationMeta('hookSize');
  @override
  late final GeneratedColumn<String> hookSize = GeneratedColumn<String>(
    'hook_size',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );

  static const VerificationMeta _leaderLengthCmMeta = VerificationMeta('leaderLengthCm');
  @override
  late final GeneratedColumn<double> leaderLengthCm = GeneratedColumn<double>(
    'leader_length_cm',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );

  static const VerificationMeta _leadWeightGMeta = VerificationMeta('leadWeightG');
  @override
  late final GeneratedColumn<double> leadWeightG = GeneratedColumn<double>(
    'lead_weight_g',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );

  static const VerificationMeta _baitTypeMeta = VerificationMeta('baitType');
  @override
  late final GeneratedColumn<String> baitType = GeneratedColumn<String>(
    'bait_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );

  static const VerificationMeta _createdAtMeta = VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('CURRENT_TIMESTAMP'),
  );

  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        mode,
        lureType,
        sizeCm,
        weightG,
        leaderType,
        rigType,
        hookSize,
        leaderLengthCm,
        leadWeightG,
        baitType,
        createdAt,
      ];

  @override
  String get aliasedName => _alias ?? 'rigs';

  @override
  String get actualTableName => 'rigs';

  @override
  VerificationContext validateIntegrity(Insertable<Rig> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(_nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('mode')) {
      context.handle(_modeMeta, mode.isAcceptableOrUnknown(data['mode']!, _modeMeta));
    } else if (isInserting) {
      context.missing(_modeMeta);
    }
    if (data.containsKey('lure_type')) {
      context.handle(_lureTypeMeta,
          lureType.isAcceptableOrUnknown(data['lure_type']!, _lureTypeMeta));
    }
    if (data.containsKey('size_cm')) {
      context.handle(_sizeCmMeta, sizeCm.isAcceptableOrUnknown(data['size_cm']!, _sizeCmMeta));
    }
    if (data.containsKey('weight_g')) {
      context.handle(_weightGMeta, weightG.isAcceptableOrUnknown(data['weight_g']!, _weightGMeta));
    }
    if (data.containsKey('leader_type')) {
      context.handle(_leaderTypeMeta,
          leaderType.isAcceptableOrUnknown(data['leader_type']!, _leaderTypeMeta));
    }
    if (data.containsKey('rig_type')) {
      context.handle(
          _rigTypeMeta, rigType.isAcceptableOrUnknown(data['rig_type']!, _rigTypeMeta));
    }
    if (data.containsKey('hook_size')) {
      context.handle(
          _hookSizeMeta, hookSize.isAcceptableOrUnknown(data['hook_size']!, _hookSizeMeta));
    }
    if (data.containsKey('leader_length_cm')) {
      context.handle(_leaderLengthCmMeta,
          leaderLengthCm.isAcceptableOrUnknown(data['leader_length_cm']!, _leaderLengthCmMeta));
    }
    if (data.containsKey('lead_weight_g')) {
      context.handle(_leadWeightGMeta,
          leadWeightG.isAcceptableOrUnknown(data['lead_weight_g']!, _leadWeightGMeta));
    }
    if (data.containsKey('bait_type')) {
      context.handle(
          _baitTypeMeta, baitType.isAcceptableOrUnknown(data['bait_type']!, _baitTypeMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _createdAtMeta, createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  Rig map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Rig.fromData(data, prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $RigsTable createAlias(String alias) => $RigsTable(attachedDatabase, alias);
}

class Session extends DataClass implements Insertable<Session> {
  final int id;
  final String mode;
  final String target;
  final String waterType;
  final DateTime startTime;
  final DateTime? endTime;
  final bool? hadCatch;
  final String? rating;
  final int? activeRigId;
  const Session({
    required this.id,
    required this.mode,
    required this.target,
    required this.waterType,
    required this.startTime,
    this.endTime,
    this.hadCatch,
    this.rating,
    this.activeRigId,
  });

  factory Session.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Session(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      mode: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}mode'])!,
      target: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}target'])!,
      waterType: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}water_type'])!,
      startTime: const DateTimeType().mapFromDatabaseResponse(data['${effectivePrefix}start_time'])!,
      endTime: const DateTimeType().mapFromDatabaseResponse(data['${effectivePrefix}end_time']),
      hadCatch: const BoolType().mapFromDatabaseResponse(data['${effectivePrefix}had_catch']),
      rating: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}rating']),
      activeRigId: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}active_rig_id']),
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['mode'] = Variable<String>(mode);
    map['target'] = Variable<String>(target);
    map['water_type'] = Variable<String>(waterType);
    map['start_time'] = Variable<DateTime>(startTime);
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<DateTime?>(endTime);
    }
    if (!nullToAbsent || hadCatch != null) {
      map['had_catch'] = Variable<bool?>(hadCatch);
    }
    if (!nullToAbsent || rating != null) {
      map['rating'] = Variable<String?>(rating);
    }
    if (!nullToAbsent || activeRigId != null) {
      map['active_rig_id'] = Variable<int?>(activeRigId);
    }
    return map;
  }

  SessionsCompanion toCompanion(bool nullToAbsent) {
    return SessionsCompanion(
      id: Value(id),
      mode: Value(mode),
      target: Value(target),
      waterType: Value(waterType),
      startTime: Value(startTime),
      endTime: endTime == null && nullToAbsent ? const Value.absent() : Value(endTime),
      hadCatch: hadCatch == null && nullToAbsent ? const Value.absent() : Value(hadCatch),
      rating: rating == null && nullToAbsent ? const Value.absent() : Value(rating),
      activeRigId: activeRigId == null && nullToAbsent ? const Value.absent() : Value(activeRigId),
    );
  }

  Session copyWith({
    int? id,
    String? mode,
    String? target,
    String? waterType,
    DateTime? startTime,
    DateTime? endTime,
    bool? hadCatch,
    String? rating,
    int? activeRigId,
  }) {
    return Session(
      id: id ?? this.id,
      mode: mode ?? this.mode,
      target: target ?? this.target,
      waterType: waterType ?? this.waterType,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      hadCatch: hadCatch ?? this.hadCatch,
      rating: rating ?? this.rating,
      activeRigId: activeRigId ?? this.activeRigId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Session(')
          ..write('id: $id, ')
          ..write('mode: $mode, ')
          ..write('target: $target, ')
          ..write('waterType: $waterType, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('hadCatch: $hadCatch, ')
          ..write('rating: $rating, ')
          ..write('activeRigId: $activeRigId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, mode, target, waterType, startTime, endTime, hadCatch,
      rating, activeRigId);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Session &&
          other.id == id &&
          other.mode == mode &&
          other.target == target &&
          other.waterType == waterType &&
          other.startTime == startTime &&
          other.endTime == endTime &&
          other.hadCatch == hadCatch &&
          other.rating == rating &&
          other.activeRigId == activeRigId);
}

class SessionsCompanion extends UpdateCompanion<Session> {
  final Value<int> id;
  final Value<String> mode;
  final Value<String> target;
  final Value<String> waterType;
  final Value<DateTime> startTime;
  final Value<DateTime?> endTime;
  final Value<bool?> hadCatch;
  final Value<String?> rating;
  final Value<int?> activeRigId;

  const SessionsCompanion({
    this.id = const Value.absent(),
    this.mode = const Value.absent(),
    this.target = const Value.absent(),
    this.waterType = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.hadCatch = const Value.absent(),
    this.rating = const Value.absent(),
    this.activeRigId = const Value.absent(),
  });

  SessionsCompanion.insert({
    this.id = const Value.absent(),
    required String mode,
    required String target,
    required String waterType,
    required DateTime startTime,
    this.endTime = const Value.absent(),
    this.hadCatch = const Value.absent(),
    this.rating = const Value.absent(),
    this.activeRigId = const Value.absent(),
  })  : mode = Value(mode),
        target = Value(target),
        waterType = Value(waterType),
        startTime = Value(startTime);

  static Insertable<Session> custom({
    Expression<int>? id,
    Expression<String>? mode,
    Expression<String>? target,
    Expression<String>? waterType,
    Expression<DateTime>? startTime,
    Expression<DateTime?>? endTime,
    Expression<bool?>? hadCatch,
    Expression<String?>? rating,
    Expression<int?>? activeRigId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mode != null) 'mode': mode,
      if (target != null) 'target': target,
      if (waterType != null) 'water_type': waterType,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (hadCatch != null) 'had_catch': hadCatch,
      if (rating != null) 'rating': rating,
      if (activeRigId != null) 'active_rig_id': activeRigId,
    });
  }

  SessionsCompanion copyWith({
    Value<int>? id,
    Value<String>? mode,
    Value<String>? target,
    Value<String>? waterType,
    Value<DateTime>? startTime,
    Value<DateTime?>? endTime,
    Value<bool?>? hadCatch,
    Value<String?>? rating,
    Value<int?>? activeRigId,
  }) {
    return SessionsCompanion(
      id: id ?? this.id,
      mode: mode ?? this.mode,
      target: target ?? this.target,
      waterType: waterType ?? this.waterType,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      hadCatch: hadCatch ?? this.hadCatch,
      rating: rating ?? this.rating,
      activeRigId: activeRigId ?? this.activeRigId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (mode.present) {
      map['mode'] = Variable<String>(mode.value);
    }
    if (target.present) {
      map['target'] = Variable<String>(target.value);
    }
    if (waterType.present) {
      map['water_type'] = Variable<String>(waterType.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime?>(endTime.value);
    }
    if (hadCatch.present) {
      map['had_catch'] = Variable<bool?>(hadCatch.value);
    }
    if (rating.present) {
      map['rating'] = Variable<String?>(rating.value);
    }
    if (activeRigId.present) {
      map['active_rig_id'] = Variable<int?>(activeRigId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionsCompanion(')
          ..write('id: $id, ')
          ..write('mode: $mode, ')
          ..write('target: $target, ')
          ..write('waterType: $waterType, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('hadCatch: $hadCatch, ')
          ..write('rating: $rating, ')
          ..write('activeRigId: $activeRigId')
          ..write(')'))
        .toString();
  }
}

class $SessionsTable extends Sessions with TableInfo<$SessionsTable, Session> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionsTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _idMeta = VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    hasAutoIncrement: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'),
  );

  static const VerificationMeta _modeMeta = VerificationMeta('mode');
  @override
  late final GeneratedColumn<String> mode = GeneratedColumn<String>(
    'mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );

  static const VerificationMeta _targetMeta = VerificationMeta('target');
  @override
  late final GeneratedColumn<String> target = GeneratedColumn<String>(
    'target',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );

  static const VerificationMeta _waterTypeMeta = VerificationMeta('waterType');
  @override
  late final GeneratedColumn<String> waterType = GeneratedColumn<String>(
    'water_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );

  static const VerificationMeta _startTimeMeta = VerificationMeta('startTime');
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
    'start_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );

  static const VerificationMeta _endTimeMeta = VerificationMeta('endTime');
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
    'end_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );

  static const VerificationMeta _hadCatchMeta = VerificationMeta('hadCatch');
  @override
  late final GeneratedColumn<bool> hadCatch = GeneratedColumn<bool>(
    'had_catch',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
  );

  static const VerificationMeta _ratingMeta = VerificationMeta('rating');
  @override
  late final GeneratedColumn<String> rating = GeneratedColumn<String>(
    'rating',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );

  static const VerificationMeta _activeRigIdMeta = VerificationMeta('activeRigId');
  @override
  late final GeneratedColumn<int> activeRigId = GeneratedColumn<int>(
    'active_rig_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );

  @override
  List<GeneratedColumn> get $columns => [
        id,
        mode,
        target,
        waterType,
        startTime,
        endTime,
        hadCatch,
        rating,
        activeRigId,
      ];

  @override
  String get aliasedName => _alias ?? 'sessions';

  @override
  String get actualTableName => 'sessions';

  @override
  VerificationContext validateIntegrity(Insertable<Session> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('mode')) {
      context.handle(_modeMeta, mode.isAcceptableOrUnknown(data['mode']!, _modeMeta));
    } else if (isInserting) {
      context.missing(_modeMeta);
    }
    if (data.containsKey('target')) {
      context.handle(_targetMeta, target.isAcceptableOrUnknown(data['target']!, _targetMeta));
    } else if (isInserting) {
      context.missing(_targetMeta);
    }
    if (data.containsKey('water_type')) {
      context.handle(
          _waterTypeMeta, waterType.isAcceptableOrUnknown(data['water_type']!, _waterTypeMeta));
    } else if (isInserting) {
      context.missing(_waterTypeMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(
          _startTimeMeta, startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(
          _endTimeMeta, endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    }
    if (data.containsKey('had_catch')) {
      context.handle(
          _hadCatchMeta, hadCatch.isAcceptableOrUnknown(data['had_catch']!, _hadCatchMeta));
    }
    if (data.containsKey('rating')) {
      context.handle(
          _ratingMeta, rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    }
    if (data.containsKey('active_rig_id')) {
      context.handle(_activeRigIdMeta,
          activeRigId.isAcceptableOrUnknown(data['active_rig_id']!, _activeRigIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  Session map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Session.fromData(data, prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $SessionsTable createAlias(String alias) => $SessionsTable(attachedDatabase, alias);
}

class SessionEvent extends DataClass implements Insertable<SessionEvent> {
  final int id;
  final int sessionId;
  final DateTime timestamp;
  final String type;
  final int? rigId;
  final String? note;
  const SessionEvent({
    required this.id,
    required this.sessionId,
    required this.timestamp,
    required this.type,
    this.rigId,
    this.note,
  });

  factory SessionEvent.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return SessionEvent(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      sessionId: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}session_id'])!,
      timestamp: const DateTimeType().mapFromDatabaseResponse(data['${effectivePrefix}timestamp'])!,
      type: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}type'])!,
      rigId: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}rig_id']),
      note: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}note']),
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['session_id'] = Variable<int>(sessionId);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || rigId != null) {
      map['rig_id'] = Variable<int?>(rigId);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String?>(note);
    }
    return map;
  }

  SessionEventsCompanion toCompanion(bool nullToAbsent) {
    return SessionEventsCompanion(
      id: Value(id),
      sessionId: Value(sessionId),
      timestamp: Value(timestamp),
      type: Value(type),
      rigId: rigId == null && nullToAbsent ? const Value.absent() : Value(rigId),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  @override
  String toString() {
    return (StringBuffer('SessionEvent(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('timestamp: $timestamp, ')
          ..write('type: $type, ')
          ..write('rigId: $rigId, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sessionId, timestamp, type, rigId, note);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SessionEvent &&
          other.id == id &&
          other.sessionId == sessionId &&
          other.timestamp == timestamp &&
          other.type == type &&
          other.rigId == rigId &&
          other.note == note);
}

class SessionEventsCompanion extends UpdateCompanion<SessionEvent> {
  final Value<int> id;
  final Value<int> sessionId;
  final Value<DateTime> timestamp;
  final Value<String> type;
  final Value<int?> rigId;
  final Value<String?> note;

  const SessionEventsCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.type = const Value.absent(),
    this.rigId = const Value.absent(),
    this.note = const Value.absent(),
  });

  SessionEventsCompanion.insert({
    this.id = const Value.absent(),
    required int sessionId,
    required DateTime timestamp,
    required String type,
    this.rigId = const Value.absent(),
    this.note = const Value.absent(),
  })  : sessionId = Value(sessionId),
        timestamp = Value(timestamp),
        type = Value(type);

  static Insertable<SessionEvent> custom({
    Expression<int>? id,
    Expression<int>? sessionId,
    Expression<DateTime>? timestamp,
    Expression<String>? type,
    Expression<int?>? rigId,
    Expression<String?>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (timestamp != null) 'timestamp': timestamp,
      if (type != null) 'type': type,
      if (rigId != null) 'rig_id': rigId,
      if (note != null) 'note': note,
    });
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<int>(sessionId.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (rigId.present) {
      map['rig_id'] = Variable<int?>(rigId.value);
    }
    if (note.present) {
      map['note'] = Variable<String?>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionEventsCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('timestamp: $timestamp, ')
          ..write('type: $type, ')
          ..write('rigId: $rigId, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $SessionEventsTable extends SessionEvents
    with TableInfo<$SessionEventsTable, SessionEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionEventsTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _idMeta = VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    hasAutoIncrement: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'),
  );

  static const VerificationMeta _sessionIdMeta = VerificationMeta('sessionId');
  @override
  late final GeneratedColumn<int> sessionId = GeneratedColumn<int>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );

  static const VerificationMeta _timestampMeta = VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );

  static const VerificationMeta _typeMeta = VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );

  static const VerificationMeta _rigIdMeta = VerificationMeta('rigId');
  @override
  late final GeneratedColumn<int> rigId = GeneratedColumn<int>(
    'rig_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );

  static const VerificationMeta _noteMeta = VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );

  @override
  List<GeneratedColumn> get $columns => [id, sessionId, timestamp, type, rigId, note];

  @override
  String get aliasedName => _alias ?? 'session_events';

  @override
  String get actualTableName => 'session_events';

  @override
  VerificationContext validateIntegrity(Insertable<SessionEvent> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('session_id')) {
      context.handle(
          _sessionIdMeta, sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
          _timestampMeta, timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('type')) {
      context.handle(_typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('rig_id')) {
      context.handle(_rigIdMeta, rigId.isAcceptableOrUnknown(data['rig_id']!, _rigIdMeta));
    }
    if (data.containsKey('note')) {
      context.handle(_noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  SessionEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    return SessionEvent.fromData(data, prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $SessionEventsTable createAlias(String alias) => $SessionEventsTable(attachedDatabase, alias);
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $RigsTable rigs = $RigsTable(this);
  late final $SessionsTable sessions = $SessionsTable(this);
  late final $SessionEventsTable sessionEvents = $SessionEventsTable(this);

  @override
  Iterable<TableInfo<Table, dynamic>> get allTables => [rigs, sessions, sessionEvents];
}
