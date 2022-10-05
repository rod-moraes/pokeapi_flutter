import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final int id;
  final String name;
  final List<String> types;
  final String spriteDreamUrl;
  final String spriteHomeUrl;

  const Pokemon(
      {required this.id,
      required this.name,
      required this.types,
      required this.spriteDreamUrl,
      required this.spriteHomeUrl});

  @override
  List<Object> get props => [id, name, types, spriteDreamUrl, spriteHomeUrl];
}
