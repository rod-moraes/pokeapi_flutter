import '../../domain/entities/pokemon.dart';

class PokemonModel extends Pokemon {
  const PokemonModel({
    required int id,
    required String name,
    required List<String> types,
    required String description,
    required String spriteDreamUrl,
    required String spriteHomeUrl,
    required List<dynamic> stats,
    bool? isFavorite,
  }) : super(
          id: id,
          name: name,
          types: types,
          description: description,
          spriteDreamUrl: spriteDreamUrl,
          spriteHomeUrl: spriteHomeUrl,
          stats: stats,
          isFavorite: isFavorite ?? false,
        );

  PokemonModel copyWith({
    int? id,
    String? name,
    List<String>? types,
    String? description,
    String? spriteDreamUrl,
    String? spriteHomeUrl,
    List<dynamic>? stats,
    bool? isFavorite,
  }) {
    return PokemonModel(
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

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      types: _getTypesFromJson(json),
      description: _getDescriptionFromJson(json),
      spriteHomeUrl: _getSpriteHomeUrlFromJson(json),
      spriteDreamUrl: _getSpriteDreamUrlFromJson(json),
      stats: json['stats'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "flavor_text_entries": [
        {'flavor_text': description}
      ],
      "stats": stats,
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

String _getDescriptionFromJson(Map<String, dynamic> json) {
  return json['flavor_text_entries'][0]['flavor_text']
          ?.toString()
          .replaceAll('\n', ' ') ??
      '';
}

String _getSpriteHomeUrlFromJson(Map<String, dynamic> json) {
  return json['sprites']['other']['dream_world']['front_default'] ??
      json['sprites']['other']['official-artwork']['front_default'] ??
      json['sprites']['other']['home']['front_default'] ??
      '';
}

String _getSpriteDreamUrlFromJson(Map<String, dynamic> json) {
  return json['sprites']['other']['official-artwork']['front_default'] ??
      json['sprites']['other']['dream_world']['front_default'] ??
      json['sprites']['other']['home']['front_default'] ??
      '';
}
