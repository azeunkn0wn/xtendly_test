// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ItemDTO _$ItemDTOFromJson(Map<String, dynamic> json) {
  return _ItemDTO.fromJson(json);
}

/// @nodoc
mixin _$ItemDTO {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double? get discount => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _categoriesFromJson)
  List<CategoryDTO>? get categories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemDTOCopyWith<ItemDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemDTOCopyWith<$Res> {
  factory $ItemDTOCopyWith(ItemDTO value, $Res Function(ItemDTO) then) =
      _$ItemDTOCopyWithImpl<$Res, ItemDTO>;
  @useResult
  $Res call(
      {String name,
      String description,
      double price,
      double? discount,
      String image,
      @JsonKey(fromJson: _categoriesFromJson) List<CategoryDTO>? categories});
}

/// @nodoc
class _$ItemDTOCopyWithImpl<$Res, $Val extends ItemDTO>
    implements $ItemDTOCopyWith<$Res> {
  _$ItemDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? discount = freezed,
    Object? image = null,
    Object? categories = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDTO>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ItemDTOCopyWith<$Res> implements $ItemDTOCopyWith<$Res> {
  factory _$$_ItemDTOCopyWith(
          _$_ItemDTO value, $Res Function(_$_ItemDTO) then) =
      __$$_ItemDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      double price,
      double? discount,
      String image,
      @JsonKey(fromJson: _categoriesFromJson) List<CategoryDTO>? categories});
}

/// @nodoc
class __$$_ItemDTOCopyWithImpl<$Res>
    extends _$ItemDTOCopyWithImpl<$Res, _$_ItemDTO>
    implements _$$_ItemDTOCopyWith<$Res> {
  __$$_ItemDTOCopyWithImpl(_$_ItemDTO _value, $Res Function(_$_ItemDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? discount = freezed,
    Object? image = null,
    Object? categories = freezed,
  }) {
    return _then(_$_ItemDTO(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDTO>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ItemDTO extends _ItemDTO {
  const _$_ItemDTO(
      {required this.name,
      required this.description,
      required this.price,
      this.discount,
      required this.image,
      @JsonKey(fromJson: _categoriesFromJson)
          final List<CategoryDTO>? categories})
      : _categories = categories,
        super._();

  factory _$_ItemDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ItemDTOFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  final double price;
  @override
  final double? discount;
  @override
  final String image;
  final List<CategoryDTO>? _categories;
  @override
  @JsonKey(fromJson: _categoriesFromJson)
  List<CategoryDTO>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ItemDTO(name: $name, description: $description, price: $price, discount: $discount, image: $image, categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemDTO &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, price,
      discount, image, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemDTOCopyWith<_$_ItemDTO> get copyWith =>
      __$$_ItemDTOCopyWithImpl<_$_ItemDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemDTOToJson(
      this,
    );
  }
}

abstract class _ItemDTO extends ItemDTO {
  const factory _ItemDTO(
      {required final String name,
      required final String description,
      required final double price,
      final double? discount,
      required final String image,
      @JsonKey(fromJson: _categoriesFromJson)
          final List<CategoryDTO>? categories}) = _$_ItemDTO;
  const _ItemDTO._() : super._();

  factory _ItemDTO.fromJson(Map<String, dynamic> json) = _$_ItemDTO.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  double get price;
  @override
  double? get discount;
  @override
  String get image;
  @override
  @JsonKey(fromJson: _categoriesFromJson)
  List<CategoryDTO>? get categories;
  @override
  @JsonKey(ignore: true)
  _$$_ItemDTOCopyWith<_$_ItemDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
