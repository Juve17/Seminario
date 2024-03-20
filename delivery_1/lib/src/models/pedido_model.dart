
class PedidoModel {
    int id;
    DateTime fecha;
    String cliente;

    PedidoModel({
        required this.id,
        required this.fecha,
        required this.cliente,
    });

    factory PedidoModel.fromJson(Map<String, dynamic> json) => PedidoModel(
        id: json["id"],
        fecha: DateTime.parse(json["fecha"]),
        cliente: json["cliente"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fecha": "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}",
        "cliente": cliente,
    };
}
