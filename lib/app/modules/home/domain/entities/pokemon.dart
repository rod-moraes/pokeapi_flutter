import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final int id;
  final String name;
  final List<String> types;
  final String description;
  final String spriteDreamUrl;
  final String spriteHomeUrl;
  final List<dynamic> stats;

  const Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.description,
    required this.spriteDreamUrl,
    required this.spriteHomeUrl,
    required this.stats,
  });

  @override
  List<Object> get props =>
      [id, name, types, description, spriteDreamUrl, spriteHomeUrl, stats];
}
