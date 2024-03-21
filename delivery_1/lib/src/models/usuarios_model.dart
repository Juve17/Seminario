
class UserModel {
    int id;
    String nombre;
    String apellidos;

    UserModel({
        required this.id,
        required this.nombre,
        required this.apellidos,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        nombre: json["nombre"],
        apellidos: json["apellidos"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellidos": apellidos,
    };
}
