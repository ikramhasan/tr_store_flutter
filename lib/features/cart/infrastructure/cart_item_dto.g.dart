// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_dto.dart';

// ignore_for_file: type=lint
class $CartItemsDtoTable extends CartItemsDto
    with TableInfo<$CartItemsDtoTable, CartItemsDtoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CartItemsDtoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => _uuid.v4());
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, image, price];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cart_items_dto';
  @override
  VerificationContext validateIntegrity(Insertable<CartItemsDtoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CartItemsDtoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CartItemsDtoData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
    );
  }

  @override
  $CartItemsDtoTable createAlias(String alias) {
    return $CartItemsDtoTable(attachedDatabase, alias);
  }
}

class CartItemsDtoData extends DataClass
    implements Insertable<CartItemsDtoData> {
  final String id;
  final String title;
  final String image;
  final double price;
  const CartItemsDtoData(
      {required this.id,
      required this.title,
      required this.image,
      required this.price});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['image'] = Variable<String>(image);
    map['price'] = Variable<double>(price);
    return map;
  }

  CartItemsDtoCompanion toCompanion(bool nullToAbsent) {
    return CartItemsDtoCompanion(
      id: Value(id),
      title: Value(title),
      image: Value(image),
      price: Value(price),
    );
  }

  factory CartItemsDtoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CartItemsDtoData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      image: serializer.fromJson<String>(json['image']),
      price: serializer.fromJson<double>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'image': serializer.toJson<String>(image),
      'price': serializer.toJson<double>(price),
    };
  }

  CartItemsDtoData copyWith(
          {String? id, String? title, String? image, double? price}) =>
      CartItemsDtoData(
        id: id ?? this.id,
        title: title ?? this.title,
        image: image ?? this.image,
        price: price ?? this.price,
      );
  @override
  String toString() {
    return (StringBuffer('CartItemsDtoData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('image: $image, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, image, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CartItemsDtoData &&
          other.id == this.id &&
          other.title == this.title &&
          other.image == this.image &&
          other.price == this.price);
}

class CartItemsDtoCompanion extends UpdateCompanion<CartItemsDtoData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> image;
  final Value<double> price;
  final Value<int> rowid;
  const CartItemsDtoCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.image = const Value.absent(),
    this.price = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CartItemsDtoCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String image,
    required double price,
    this.rowid = const Value.absent(),
  })  : title = Value(title),
        image = Value(image),
        price = Value(price);
  static Insertable<CartItemsDtoData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? image,
    Expression<double>? price,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (image != null) 'image': image,
      if (price != null) 'price': price,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CartItemsDtoCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? image,
      Value<double>? price,
      Value<int>? rowid}) {
    return CartItemsDtoCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      price: price ?? this.price,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CartItemsDtoCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('image: $image, ')
          ..write('price: $price, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $CartItemsDtoTable cartItemsDto = $CartItemsDtoTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cartItemsDto];
}
