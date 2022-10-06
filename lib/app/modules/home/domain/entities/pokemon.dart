import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'pokemon.g.dart';

@HiveType(typeId: 1)
class Pokemon extends Equatable {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final List<String> types;

  @HiveField(3)
  final String description;

  @HiveField(4)
  final String spriteDreamUrl;

  @HiveField(5)
  final String spriteHomeUrl;

  @HiveField(6)
  final List<dynamic> stats;

  @HiveField(7)
  final bool isFavorite;

  const Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.description,
    required this.spriteDreamUrl,
    required this.spriteHomeUrl,
    required this.stats,
    required this.isFavorite,
  });

  @override
  List<Object> get props =>
      [id, name, types, description, spriteDreamUrl, spriteHomeUrl, stats];

  Pokemon copyWith({
    int? id,
    String? name,
    List<String>? types,
    String? description,
    String? spriteDreamUrl,
    String? spriteHomeUrl,
    List<dynamic>? stats,
    bool? isFavorite,
  }) {
    return Pokemon(
      id: id ?? this.id,
      name: name ?? this.name,
      types: types ?? this.types,
      description: description ?? this.description,
      spriteDreamUrl: spriteDreamUrl ?? this.spriteDreamUrl,
      spriteHomeUrl: spriteHomeUrl ?? this.spriteHomeUrl,
      stats: stats ?? this.stats,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
