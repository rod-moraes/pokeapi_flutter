import '../../domain/entities/pokemon.dart';

class PokemonModel extends Pokemon {
  const PokemonModel({
    required int id,
    required String name,
    required List<String> types,
    required String spriteDreamUrl,
    required String spriteHomeUrl,
  }) : super(
          id: id,
          name: name,
          types: types,
          spriteDreamUrl: spriteDreamUrl,
          spriteHomeUrl: spriteHomeUrl,
        );

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      types: _getTypesFromJson(json),
      spriteHomeUrl: _getSpriteHomeUrlFromJson(json),
      spriteDreamUrl: _getSpriteDreamUrlFromJson(json),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "types": types
          .map((type) => {
                "type": {"name": type}
              })
          .toList(),
      "sprites": {
        "other": {
          "dream_world": {"front_default": spriteDreamUrl},
          "official-artwork": {"front_default": spriteHomeUrl},
        },
      },
    };
  }
}

List<String> _getTypesFromJson(Map<String, dynamic> json) {
  final rawTypes = json['types'] as List<dynamic>;
  return rawTypes.map((e) {
    return e['type']['name'] as String;
  }).toList();
}

String _getSpriteHomeUrlFromJson(Map<String, dynamic> json) {
  return json['sprites']['other']['dream_world']['front_default'];
}

String _getSpriteDreamUrlFromJson(Map<String, dynamic> json) {
  return json['sprites']['other']['official-artwork']['front_default'];
}
