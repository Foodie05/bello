// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAccountsCollection on Isar {
  IsarCollection<Accounts> get accounts => this.collection();
}

const AccountsSchema = CollectionSchema(
  name: r'Accounts',
  id: -5600902485513468246,
  properties: {
    r'accountLevel': PropertySchema(
      id: 0,
      name: r'accountLevel',
      type: IsarType.long,
    ),
    r'accountPermission': PropertySchema(
      id: 1,
      name: r'accountPermission',
      type: IsarType.long,
    ),
    r'accountsID': PropertySchema(
      id: 2,
      name: r'accountsID',
      type: IsarType.string,
    ),
    r'email': PropertySchema(
      id: 3,
      name: r'email',
      type: IsarType.string,
    ),
    r'gender': PropertySchema(
      id: 4,
      name: r'gender',
      type: IsarType.string,
    ),
    r'isInit': PropertySchema(
      id: 5,
      name: r'isInit',
      type: IsarType.bool,
    ),
    r'nickName': PropertySchema(
      id: 6,
      name: r'nickName',
      type: IsarType.string,
    ),
    r'passwdMd5': PropertySchema(
      id: 7,
      name: r'passwdMd5',
      type: IsarType.string,
    ),
    r'passwdSha256': PropertySchema(
      id: 8,
      name: r'passwdSha256',
      type: IsarType.string,
    ),
    r'phoneNumber': PropertySchema(
      id: 9,
      name: r'phoneNumber',
      type: IsarType.string,
    ),
    r'registerTime': PropertySchema(
      id: 10,
      name: r'registerTime',
      type: IsarType.dateTime,
    ),
    r'signature': PropertySchema(
      id: 11,
      name: r'signature',
      type: IsarType.string,
    )
  },
  estimateSize: _accountsEstimateSize,
  serialize: _accountsSerialize,
  deserialize: _accountsDeserialize,
  deserializeProp: _accountsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _accountsGetId,
  getLinks: _accountsGetLinks,
  attach: _accountsAttach,
  version: '3.1.0+1',
);

int _accountsEstimateSize(
  Accounts object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.accountsID.length * 3;
  {
    final value = object.email;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.gender;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.nickName.length * 3;
  bytesCount += 3 + object.passwdMd5.length * 3;
  bytesCount += 3 + object.passwdSha256.length * 3;
  bytesCount += 3 + object.phoneNumber.length * 3;
  {
    final value = object.signature;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _accountsSerialize(
  Accounts object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.accountLevel);
  writer.writeLong(offsets[1], object.accountPermission);
  writer.writeString(offsets[2], object.accountsID);
  writer.writeString(offsets[3], object.email);
  writer.writeString(offsets[4], object.gender);
  writer.writeBool(offsets[5], object.isInit);
  writer.writeString(offsets[6], object.nickName);
  writer.writeString(offsets[7], object.passwdMd5);
  writer.writeString(offsets[8], object.passwdSha256);
  writer.writeString(offsets[9], object.phoneNumber);
  writer.writeDateTime(offsets[10], object.registerTime);
  writer.writeString(offsets[11], object.signature);
}

Accounts _accountsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Accounts(
    accountLevel: reader.readLongOrNull(offsets[0]),
    accountPermission: reader.readLong(offsets[1]),
    accountsID: reader.readString(offsets[2]),
    email: reader.readStringOrNull(offsets[3]),
    gender: reader.readStringOrNull(offsets[4]),
    isInit: reader.readBool(offsets[5]),
    nickName: reader.readString(offsets[6]),
    passwdMd5: reader.readString(offsets[7]),
    passwdSha256: reader.readString(offsets[8]),
    phoneNumber: reader.readString(offsets[9]),
    registerTime: reader.readDateTime(offsets[10]),
    signature: reader.readStringOrNull(offsets[11]),
  );
  object.id = id;
  return object;
}

P _accountsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readDateTime(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _accountsGetId(Accounts object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _accountsGetLinks(Accounts object) {
  return [];
}

void _accountsAttach(IsarCollection<dynamic> col, Id id, Accounts object) {
  object.id = id;
}

extension AccountsQueryWhereSort on QueryBuilder<Accounts, Accounts, QWhere> {
  QueryBuilder<Accounts, Accounts, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AccountsQueryWhere on QueryBuilder<Accounts, Accounts, QWhereClause> {
  QueryBuilder<Accounts, Accounts, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AccountsQueryFilter
    on QueryBuilder<Accounts, Accounts, QFilterCondition> {
  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> accountLevelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'accountLevel',
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition>
      accountLevelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'accountLevel',
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> accountLevelEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition>
      accountLevelGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accountLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> accountLevelLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accountLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> accountLevelBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accountLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition>
      accountPermissionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountPermission',
        value: value,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition>
      accountPermissionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accountPermission',
        value: value,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition>
      accountPermissionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accountPermission',
        value: value,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition>
      accountPermissionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accountPermission',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> accountsIDEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountsID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> accountsIDGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accountsID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> accountsIDLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accountsID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> accountsIDBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accountsID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> accountsIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'accountsID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> accountsIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'accountsID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> accountsIDContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accountsID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> accountsIDMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accountsID',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> accountsIDIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountsID',
        value: '',
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition>
      accountsIDIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accountsID',
        value: '',
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> emailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> emailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> emailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> emailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> emailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> emailContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> emailMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> genderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gender',
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> genderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gender',
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> genderEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> genderGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> genderLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> genderBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gender',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> genderStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> genderEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> genderContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> genderMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gender',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> genderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gender',
        value: '',
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> genderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gender',
        value: '',
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> isInitEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isInit',
        value: value,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> nickNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nickName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> nickNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nickName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> nickNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nickName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> nickNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nickName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> nickNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nickName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> nickNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nickName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> nickNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nickName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> nickNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nickName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> nickNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nickName',
        value: '',
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> nickNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nickName',
        value: '',
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> passwdMd5EqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'passwdMd5',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> passwdMd5GreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'passwdMd5',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> passwdMd5LessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'passwdMd5',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> passwdMd5Between(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'passwdMd5',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> passwdMd5StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'passwdMd5',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> passwdMd5EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'passwdMd5',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> passwdMd5Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'passwdMd5',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> passwdMd5Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'passwdMd5',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> passwdMd5IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'passwdMd5',
        value: '',
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition>
      passwdMd5IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'passwdMd5',
        value: '',
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> passwdSha256EqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'passwdSha256',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition>
      passwdSha256GreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'passwdSha256',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> passwdSha256LessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'passwdSha256',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> passwdSha256Between(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'passwdSha256',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition>
      passwdSha256StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'passwdSha256',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> passwdSha256EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'passwdSha256',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> passwdSha256Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'passwdSha256',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> passwdSha256Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'passwdSha256',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition>
      passwdSha256IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'passwdSha256',
        value: '',
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition>
      passwdSha256IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'passwdSha256',
        value: '',
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> phoneNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition>
      phoneNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> phoneNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> phoneNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phoneNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> phoneNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> phoneNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> phoneNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> phoneNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phoneNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> phoneNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition>
      phoneNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phoneNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> registerTimeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'registerTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition>
      registerTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'registerTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> registerTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'registerTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> registerTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'registerTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> signatureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'signature',
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> signatureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'signature',
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> signatureEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'signature',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> signatureGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'signature',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> signatureLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'signature',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> signatureBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'signature',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> signatureStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'signature',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> signatureEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'signature',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> signatureContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'signature',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> signatureMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'signature',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition> signatureIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'signature',
        value: '',
      ));
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterFilterCondition>
      signatureIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'signature',
        value: '',
      ));
    });
  }
}

extension AccountsQueryObject
    on QueryBuilder<Accounts, Accounts, QFilterCondition> {}

extension AccountsQueryLinks
    on QueryBuilder<Accounts, Accounts, QFilterCondition> {}

extension AccountsQuerySortBy on QueryBuilder<Accounts, Accounts, QSortBy> {
  QueryBuilder<Accounts, Accounts, QAfterSortBy> sortByAccountLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountLevel', Sort.asc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> sortByAccountLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountLevel', Sort.desc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> sortByAccountPermission() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountPermission', Sort.asc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> sortByAccountPermissionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountPermission', Sort.desc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> sortByAccountsID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountsID', Sort.asc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> sortByAccountsIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountsID', Sort.desc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> sortByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> sortByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> sortByIsInit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInit', Sort.asc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> sortByIsInitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInit', Sort.desc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> sortByNickName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nickName', Sort.asc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> sortByNickNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nickName', Sort.desc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> sortByPasswdMd5() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passwdMd5', Sort.asc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> sortByPasswdMd5Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passwdMd5', Sort.desc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> sortByPasswdSha256() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passwdSha256', Sort.asc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> sortByPasswdSha256Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passwdSha256', Sort.desc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> sortByPhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.asc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> sortByPhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.desc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> sortByRegisterTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registerTime', Sort.asc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> sortByRegisterTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registerTime', Sort.desc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> sortBySignature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'signature', Sort.asc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> sortBySignatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'signature', Sort.desc);
    });
  }
}

extension AccountsQuerySortThenBy
    on QueryBuilder<Accounts, Accounts, QSortThenBy> {
  QueryBuilder<Accounts, Accounts, QAfterSortBy> thenByAccountLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountLevel', Sort.asc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> thenByAccountLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountLevel', Sort.desc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> thenByAccountPermission() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountPermission', Sort.asc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> thenByAccountPermissionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountPermission', Sort.desc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> thenByAccountsID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountsID', Sort.asc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> thenByAccountsIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountsID', Sort.desc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> thenByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> thenByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> thenByIsInit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInit', Sort.asc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> thenByIsInitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInit', Sort.desc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> thenByNickName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nickName', Sort.asc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> thenByNickNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nickName', Sort.desc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> thenByPasswdMd5() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passwdMd5', Sort.asc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> thenByPasswdMd5Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passwdMd5', Sort.desc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> thenByPasswdSha256() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passwdSha256', Sort.asc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> thenByPasswdSha256Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passwdSha256', Sort.desc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> thenByPhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.asc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> thenByPhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.desc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> thenByRegisterTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registerTime', Sort.asc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> thenByRegisterTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registerTime', Sort.desc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> thenBySignature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'signature', Sort.asc);
    });
  }

  QueryBuilder<Accounts, Accounts, QAfterSortBy> thenBySignatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'signature', Sort.desc);
    });
  }
}

extension AccountsQueryWhereDistinct
    on QueryBuilder<Accounts, Accounts, QDistinct> {
  QueryBuilder<Accounts, Accounts, QDistinct> distinctByAccountLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountLevel');
    });
  }

  QueryBuilder<Accounts, Accounts, QDistinct> distinctByAccountPermission() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountPermission');
    });
  }

  QueryBuilder<Accounts, Accounts, QDistinct> distinctByAccountsID(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountsID', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Accounts, Accounts, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Accounts, Accounts, QDistinct> distinctByGender(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gender', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Accounts, Accounts, QDistinct> distinctByIsInit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isInit');
    });
  }

  QueryBuilder<Accounts, Accounts, QDistinct> distinctByNickName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nickName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Accounts, Accounts, QDistinct> distinctByPasswdMd5(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'passwdMd5', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Accounts, Accounts, QDistinct> distinctByPasswdSha256(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'passwdSha256', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Accounts, Accounts, QDistinct> distinctByPhoneNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phoneNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Accounts, Accounts, QDistinct> distinctByRegisterTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'registerTime');
    });
  }

  QueryBuilder<Accounts, Accounts, QDistinct> distinctBySignature(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'signature', caseSensitive: caseSensitive);
    });
  }
}

extension AccountsQueryProperty
    on QueryBuilder<Accounts, Accounts, QQueryProperty> {
  QueryBuilder<Accounts, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Accounts, int?, QQueryOperations> accountLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountLevel');
    });
  }

  QueryBuilder<Accounts, int, QQueryOperations> accountPermissionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountPermission');
    });
  }

  QueryBuilder<Accounts, String, QQueryOperations> accountsIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountsID');
    });
  }

  QueryBuilder<Accounts, String?, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<Accounts, String?, QQueryOperations> genderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gender');
    });
  }

  QueryBuilder<Accounts, bool, QQueryOperations> isInitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isInit');
    });
  }

  QueryBuilder<Accounts, String, QQueryOperations> nickNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nickName');
    });
  }

  QueryBuilder<Accounts, String, QQueryOperations> passwdMd5Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'passwdMd5');
    });
  }

  QueryBuilder<Accounts, String, QQueryOperations> passwdSha256Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'passwdSha256');
    });
  }

  QueryBuilder<Accounts, String, QQueryOperations> phoneNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phoneNumber');
    });
  }

  QueryBuilder<Accounts, DateTime, QQueryOperations> registerTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'registerTime');
    });
  }

  QueryBuilder<Accounts, String?, QQueryOperations> signatureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'signature');
    });
  }
}
