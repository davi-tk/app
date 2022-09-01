// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetPostCollection on Isar {
  IsarCollection<Post> get posts => getCollection();
}

const PostSchema = CollectionSchema(
  name: 'Post',
  schema:
      '{"name":"Post","idName":"id","properties":[{"name":"categoria","type":"String"},{"name":"content","type":"String"},{"name":"date","type":"Long"},{"name":"hasListeners","type":"Bool"},{"name":"title","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {
    'categoria': 0,
    'content': 1,
    'date': 2,
    'hasListeners': 3,
    'title': 4
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _postGetId,
  setId: _postSetId,
  getLinks: _postGetLinks,
  attachLinks: _postAttachLinks,
  serializeNative: _postSerializeNative,
  deserializeNative: _postDeserializeNative,
  deserializePropNative: _postDeserializePropNative,
  serializeWeb: _postSerializeWeb,
  deserializeWeb: _postDeserializeWeb,
  deserializePropWeb: _postDeserializePropWeb,
  version: 3,
);

int? _postGetId(Post object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _postSetId(Post object, int id) {
  object.id = id;
}

List<IsarLinkBase> _postGetLinks(Post object) {
  return [];
}

void _postSerializeNative(IsarCollection<Post> collection, IsarRawObject rawObj,
    Post object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.categoria;
  final _categoria = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_categoria.length) as int;
  final value1 = object.content;
  final _content = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_content.length) as int;
  final value2 = object.date;
  final _date = value2;
  final value3 = object.hasListeners;
  final _hasListeners = value3;
  final value4 = object.title;
  final _title = IsarBinaryWriter.utf8Encoder.convert(value4);
  dynamicSize += (_title.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _categoria);
  writer.writeBytes(offsets[1], _content);
  writer.writeDateTime(offsets[2], _date);
  writer.writeBool(offsets[3], _hasListeners);
  writer.writeBytes(offsets[4], _title);
}

Post _postDeserializeNative(IsarCollection<Post> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Post();
  object.categoria = reader.readString(offsets[0]);
  object.id = id;
  return object;
}

P _postDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _postSerializeWeb(IsarCollection<Post> collection, Post object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'categoria', object.categoria);
  IsarNative.jsObjectSet(jsObj, 'content', object.content);
  IsarNative.jsObjectSet(
      jsObj, 'date', object.date.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'hasListeners', object.hasListeners);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'title', object.title);
  return jsObj;
}

Post _postDeserializeWeb(IsarCollection<Post> collection, dynamic jsObj) {
  final object = Post();
  object.categoria = IsarNative.jsObjectGet(jsObj, 'categoria') ?? '';
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  return object;
}

P _postDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'categoria':
      return (IsarNative.jsObjectGet(jsObj, 'categoria') ?? '') as P;
    case 'content':
      return (IsarNative.jsObjectGet(jsObj, 'content') ?? '') as P;
    case 'date':
      return (IsarNative.jsObjectGet(jsObj, 'date') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'date'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    case 'hasListeners':
      return (IsarNative.jsObjectGet(jsObj, 'hasListeners') ?? false) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'title':
      return (IsarNative.jsObjectGet(jsObj, 'title') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _postAttachLinks(IsarCollection col, int id, Post object) {}

extension PostQueryWhereSort on QueryBuilder<Post, Post, QWhere> {
  QueryBuilder<Post, Post, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension PostQueryWhere on QueryBuilder<Post, Post, QWhereClause> {
  QueryBuilder<Post, Post, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Post, Post, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<Post, Post, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Post, Post, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Post, Post, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension PostQueryFilter on QueryBuilder<Post, Post, QFilterCondition> {
  QueryBuilder<Post, Post, QAfterFilterCondition> categoriaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'categoria',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Post, Post, QAfterFilterCondition> categoriaGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'categoria',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Post, Post, QAfterFilterCondition> categoriaLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'categoria',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Post, Post, QAfterFilterCondition> categoriaBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'categoria',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Post, Post, QAfterFilterCondition> categoriaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'categoria',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Post, Post, QAfterFilterCondition> categoriaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'categoria',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Post, Post, QAfterFilterCondition> categoriaContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'categoria',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Post, Post, QAfterFilterCondition> categoriaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'categoria',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Post, Post, QAfterFilterCondition> contentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'content',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Post, Post, QAfterFilterCondition> contentGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'content',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Post, Post, QAfterFilterCondition> contentLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'content',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Post, Post, QAfterFilterCondition> contentBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'content',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Post, Post, QAfterFilterCondition> contentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'content',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Post, Post, QAfterFilterCondition> contentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'content',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Post, Post, QAfterFilterCondition> contentContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'content',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Post, Post, QAfterFilterCondition> contentMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'content',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Post, Post, QAfterFilterCondition> dateEqualTo(DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'date',
      value: value,
    ));
  }

  QueryBuilder<Post, Post, QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'date',
      value: value,
    ));
  }

  QueryBuilder<Post, Post, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'date',
      value: value,
    ));
  }

  QueryBuilder<Post, Post, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'date',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Post, Post, QAfterFilterCondition> hasListenersEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hasListeners',
      value: value,
    ));
  }

  QueryBuilder<Post, Post, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Post, Post, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Post, Post, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Post, Post, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Post, Post, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Post, Post, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Post, Post, QAfterFilterCondition> titleLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Post, Post, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'title',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Post, Post, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Post, Post, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Post, Post, QAfterFilterCondition> titleContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Post, Post, QAfterFilterCondition> titleMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'title',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension PostQueryLinks on QueryBuilder<Post, Post, QFilterCondition> {}

extension PostQueryWhereSortBy on QueryBuilder<Post, Post, QSortBy> {
  QueryBuilder<Post, Post, QAfterSortBy> sortByCategoria() {
    return addSortByInternal('categoria', Sort.asc);
  }

  QueryBuilder<Post, Post, QAfterSortBy> sortByCategoriaDesc() {
    return addSortByInternal('categoria', Sort.desc);
  }

  QueryBuilder<Post, Post, QAfterSortBy> sortByContent() {
    return addSortByInternal('content', Sort.asc);
  }

  QueryBuilder<Post, Post, QAfterSortBy> sortByContentDesc() {
    return addSortByInternal('content', Sort.desc);
  }

  QueryBuilder<Post, Post, QAfterSortBy> sortByDate() {
    return addSortByInternal('date', Sort.asc);
  }

  QueryBuilder<Post, Post, QAfterSortBy> sortByDateDesc() {
    return addSortByInternal('date', Sort.desc);
  }

  QueryBuilder<Post, Post, QAfterSortBy> sortByHasListeners() {
    return addSortByInternal('hasListeners', Sort.asc);
  }

  QueryBuilder<Post, Post, QAfterSortBy> sortByHasListenersDesc() {
    return addSortByInternal('hasListeners', Sort.desc);
  }

  QueryBuilder<Post, Post, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Post, Post, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Post, Post, QAfterSortBy> sortByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<Post, Post, QAfterSortBy> sortByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension PostQueryWhereSortThenBy on QueryBuilder<Post, Post, QSortThenBy> {
  QueryBuilder<Post, Post, QAfterSortBy> thenByCategoria() {
    return addSortByInternal('categoria', Sort.asc);
  }

  QueryBuilder<Post, Post, QAfterSortBy> thenByCategoriaDesc() {
    return addSortByInternal('categoria', Sort.desc);
  }

  QueryBuilder<Post, Post, QAfterSortBy> thenByContent() {
    return addSortByInternal('content', Sort.asc);
  }

  QueryBuilder<Post, Post, QAfterSortBy> thenByContentDesc() {
    return addSortByInternal('content', Sort.desc);
  }

  QueryBuilder<Post, Post, QAfterSortBy> thenByDate() {
    return addSortByInternal('date', Sort.asc);
  }

  QueryBuilder<Post, Post, QAfterSortBy> thenByDateDesc() {
    return addSortByInternal('date', Sort.desc);
  }

  QueryBuilder<Post, Post, QAfterSortBy> thenByHasListeners() {
    return addSortByInternal('hasListeners', Sort.asc);
  }

  QueryBuilder<Post, Post, QAfterSortBy> thenByHasListenersDesc() {
    return addSortByInternal('hasListeners', Sort.desc);
  }

  QueryBuilder<Post, Post, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Post, Post, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Post, Post, QAfterSortBy> thenByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<Post, Post, QAfterSortBy> thenByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension PostQueryWhereDistinct on QueryBuilder<Post, Post, QDistinct> {
  QueryBuilder<Post, Post, QDistinct> distinctByCategoria(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('categoria', caseSensitive: caseSensitive);
  }

  QueryBuilder<Post, Post, QDistinct> distinctByContent(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('content', caseSensitive: caseSensitive);
  }

  QueryBuilder<Post, Post, QDistinct> distinctByDate() {
    return addDistinctByInternal('date');
  }

  QueryBuilder<Post, Post, QDistinct> distinctByHasListeners() {
    return addDistinctByInternal('hasListeners');
  }

  QueryBuilder<Post, Post, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Post, Post, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('title', caseSensitive: caseSensitive);
  }
}

extension PostQueryProperty on QueryBuilder<Post, Post, QQueryProperty> {
  QueryBuilder<Post, String, QQueryOperations> categoriaProperty() {
    return addPropertyNameInternal('categoria');
  }

  QueryBuilder<Post, String, QQueryOperations> contentProperty() {
    return addPropertyNameInternal('content');
  }

  QueryBuilder<Post, DateTime, QQueryOperations> dateProperty() {
    return addPropertyNameInternal('date');
  }

  QueryBuilder<Post, bool, QQueryOperations> hasListenersProperty() {
    return addPropertyNameInternal('hasListeners');
  }

  QueryBuilder<Post, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Post, String, QQueryOperations> titleProperty() {
    return addPropertyNameInternal('title');
  }
}
