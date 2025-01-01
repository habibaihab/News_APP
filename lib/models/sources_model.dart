class SourceModel{
  final String status;
  final List<Source>sources;

  SourceModel({required this.status, required this.sources});

  factory SourceModel.fromJson(Map<String,dynamic>json) => SourceModel(
      status: json["status"],
      sources: (json["sources"] as List).map((element){
        return Source.fromJson(element);
      },
      ).toList(),
  );
}
class Source{
  final String id;
  final String name;

  Source({required this.id, required this.name});

  factory Source.fromJson(Map<String,dynamic>json)=> Source(
    id: json["id"],
    name: json["name"]
    );
  }