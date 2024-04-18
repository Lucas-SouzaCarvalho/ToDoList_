import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String nomeTarefa;
  final bool feito;
  final Function(bool?)? onChanged;
  final Function()? onDismissed; // Callback para lidar com a remoção da tarefa

  ToDoTile({
    Key? key,
    required this.nomeTarefa,
    required this.feito,
    required this.onChanged,
    required this.onDismissed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(), // Chave única para cada item
      direction: DismissDirection.endToStart, // Direção de arrasto para remover
      onDismissed: (_) =>
          onDismissed?.call(), // Chama a função de remoção quando arrastado
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        color: Colors.red,
        child: Icon(Icons.delete, color: Colors.white),
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
          child: Container(
            padding: EdgeInsets.all(24),
            child: Row(
              children: [
                Checkbox(
                  value: feito,
                  onChanged: onChanged,
                  activeColor: Color(0XFF454545),
                ),
                Text(nomeTarefa,
                    style: TextStyle(
                        decoration: feito
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        decorationColor: Color(0XFF454545),
                        decorationThickness: 4.0))
              ],
            ),
            decoration: BoxDecoration(
              color: Color(0XFF0085ff),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
