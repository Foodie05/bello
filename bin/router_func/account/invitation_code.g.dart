// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation_code.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetInvitationCodeCollection on Isar {
  IsarCollection<InvitationCode> get invitationCodes => this.collection();
}

const InvitationCodeSchema = CollectionSchema(
  name: r'InvitationCode',
  id: 581449251692271739,
  properties: {
    r'accountPermission': PropertySchema(
      id: 0,
      name: r'accountPermission',
      type: IsarType.long,
    ),
    r'code': PropertySchema(
      id: 1,
      name: r'code',
      type: IsarType.string,
    ),
    r'isUsed': PropertySchema(
      id: 2,
      name: r'isUsed',
      type: IsarType.bool,
    )
  },
  estimateSize: _invitationCodeEstimateSize,
  serialize: _invitationCodeSerialize,
  deserialize: _invitationCodeDeserialize,
  deserializeProp: _invitationCodeDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _invitationCodeGetId,
  getLinks: _invitationCodeGetLinks,
  attach: _invitationCodeAttach,
  version: '3.1.0+1',
);

int _invitationCodeEstimateSize(
  InvitationCode object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.code.length * 3;
  return bytesCount;
}

void _invitationCodeSerialize(
  InvitationCode object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.accountPermission);
  writer.writeString(offsets[1], object.code);
  writer.writeBool(offsets[2], object.isUsed);
}

InvitationCode _invitationCodeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = InvitationCode(
    accountPermission: reader.readLong(offsets[0]),
    code: reader.readString(offsets[1]),
    isUsed: reader.readBool(offsets[2]),
  );
  object.id = id;
  return object;
}

P _invitationCodeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _invitationCodeGetId(InvitationCode object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _invitationCodeGetLinks(InvitationCode object) {
  return [];
}

void _invitationCodeAttach(
    IsarCollection<dynamic> col, Id id, InvitationCode object) {
  object.id = id;
}

extension InvitationCodeQueryWhereSort
    on QueryBuilder<InvitationCode, InvitationCode, QWhere> {
  QueryBuilder<InvitationCode, InvitationCode, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension InvitationCodeQueryWhere
    on QueryBuilder<InvitationCode, InvitationCode, QWhereClause> {
  QueryBuilder<InvitationCode, InvitationCode, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<InvitationCode, InvitationCode, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<InvitationCode, InvitationCode, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<InvitationCode, InvitationCode, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<InvitationCode, InvitationCode, QAfterWhereClause> idBetween(
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

extension InvitationCodeQueryFilter
    on QueryBuilder<InvitationCode, InvitationCode, QFilterCondition> {
  QueryBuilder<InvitationCode, InvitationCode, QAfterFilterCondition>
      accountPermissionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountPermission',
        value: value,
      ));
    });
  }

  QueryBuilder<InvitationCode, InvitationCode, QAfterFilterCondition>
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

  QueryBuilder<InvitationCode, InvitationCode, QAfterFilterCondition>
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

  QueryBuilder<InvitationCode, InvitationCode, QAfterFilterCondition>
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

  QueryBuilder<InvitationCode, InvitationCode, QAfterFilterCondition>
      codeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvitationCode, InvitationCode, QAfterFilterCondition>
      codeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvitationCode, InvitationCode, QAfterFilterCondition>
      codeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvitationCode, InvitationCode, QAfterFilterCondition>
      codeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvitationCode, InvitationCode, QAfterFilterCondition>
      codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvitationCode, InvitationCode, QAfterFilterCondition>
      codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvitationCode, InvitationCode, QAfterFilterCondition>
      codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvitationCode, InvitationCode, QAfterFilterCondition>
      codeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvitationCode, InvitationCode, QAfterFilterCondition>
      codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<InvitationCode, InvitationCode, QAfterFilterCondition>
      codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<InvitationCode, InvitationCode, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<InvitationCode, InvitationCode, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<InvitationCode, InvitationCode, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<InvitationCode, InvitationCode, QAfterFilterCondition> idBetween(
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

  QueryBuilder<InvitationCode, InvitationCode, QAfterFilterCondition>
      isUsedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isUsed',
        value: value,
      ));
    });
  }
}

extension InvitationCodeQueryObject
    on QueryBuilder<InvitationCode, InvitationCode, QFilterCondition> {}

extension InvitationCodeQueryLinks
    on QueryBuilder<InvitationCode, InvitationCode, QFilterCondition> {}

extension InvitationCodeQuerySortBy
    on QueryBuilder<InvitationCode, InvitationCode, QSortBy> {
  QueryBuilder<InvitationCode, InvitationCode, QAfterSortBy>
      sortByAccountPermission() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountPermission', Sort.asc);
    });
  }

  QueryBuilder<InvitationCode, InvitationCode, QAfterSortBy>
      sortByAccountPermissionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountPermission', Sort.desc);
    });
  }

  QueryBuilder<InvitationCode, InvitationCode, QAfterSortBy> sortByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<InvitationCode, InvitationCode, QAfterSortBy> sortByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<InvitationCode, InvitationCode, QAfterSortBy> sortByIsUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUsed', Sort.asc);
    });
  }

  QueryBuilder<InvitationCode, InvitationCode, QAfterSortBy>
      sortByIsUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUsed', Sort.desc);
    });
  }
}

extension InvitationCodeQuerySortThenBy
    on QueryBuilder<InvitationCode, InvitationCode, QSortThenBy> {
  QueryBuilder<InvitationCode, InvitationCode, QAfterSortBy>
      thenByAccountPermission() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountPermission', Sort.asc);
    });
  }

  QueryBuilder<InvitationCode, InvitationCode, QAfterSortBy>
      thenByAccountPermissionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountPermission', Sort.desc);
    });
  }

  QueryBuilder<InvitationCode, InvitationCode, QAfterSortBy> thenByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<InvitationCode, InvitationCode, QAfterSortBy> thenByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<InvitationCode, InvitationCode, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<InvitationCode, InvitationCode, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<InvitationCode, InvitationCode, QAfterSortBy> thenByIsUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUsed', Sort.asc);
    });
  }

  QueryBuilder<InvitationCode, InvitationCode, QAfterSortBy>
      thenByIsUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUsed', Sort.desc);
    });
  }
}

extension InvitationCodeQueryWhereDistinct
    on QueryBuilder<InvitationCode, InvitationCode, QDistinct> {
  QueryBuilder<InvitationCode, InvitationCode, QDistinct>
      distinctByAccountPermission() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountPermission');
    });
  }

  QueryBuilder<InvitationCode, InvitationCode, QDistinct> distinctByCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'code', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvitationCode, InvitationCode, QDistinct> distinctByIsUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isUsed');
    });
  }
}

extension InvitationCodeQueryProperty
    on QueryBuilder<InvitationCode, InvitationCode, QQueryProperty> {
  QueryBuilder<InvitationCode, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<InvitationCode, int, QQueryOperations>
      accountPermissionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountPermission');
    });
  }

  QueryBuilder<InvitationCode, String, QQueryOperations> codeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'code');
    });
  }

  QueryBuilder<InvitationCode, bool, QQueryOperations> isUsedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isUsed');
    });
  }
}
