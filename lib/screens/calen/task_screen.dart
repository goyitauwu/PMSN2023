import 'package:flutter/material.dart';
import 'package:pmsn20232/assets/global_values.dart';
import 'package:pmsn20232/database/calen/agendadb.dart';
import 'package:pmsn20232/models/calen/task_model.dart';
import 'package:pmsn20232/widgets/calen/CardTaskWidget.dart';

class TareaScreen extends StatefulWidget {
  const TareaScreen({super.key});

  @override
  State<TareaScreen> createState() => _TareaScreenState();
}

class _TareaScreenState extends State<TareaScreen> {
  AgendaDB? agendaDB;
  String searchTerm = '';
  int? selectedTaskStatus;

  @override
  void initState() {
    super.initState();
    agendaDB = AgendaDB();
    verificarRecordatorios();
  }

  void verificarRecordatorios() async {
    final now = DateTime.now().toLocal();
    final formattedDate =
        "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
    print(formattedDate);
    final tareasHoy = await agendaDB!.getTareasRecordatorio(formattedDate);

    if (tareasHoy.isNotEmpty) {
      mostrarAlerta(tareasHoy);
    }
  }

  void mostrarAlerta(List<TaskModel> tareas) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Recordatorio de Tareas'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: tareas.map((tarea) {
              return Text('Tarea: ${tarea.nomTask}');
            }).toList(),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro Tareas'),
        actions: [
          IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/calendar').then((value) {
                    setState(() {});
                  }),
              icon: const Icon(Icons.calendar_today)),
          IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/addTask').then((value) {
                    setState(() {});
                  }),
              icon: const Icon(Icons.add)),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(150.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    setState(() {
                      searchTerm = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Buscar tarea...',
                  ),
                ),
                SizedBox(height: 5.0),
                DropdownButtonFormField<int>(
                  value: selectedTaskStatus,
                  items: [
                    DropdownMenuItem<int>(
                      value: null,
                      child: Text('Todos'),
                    ),
                    DropdownMenuItem<int>(
                      value: 0,
                      child: Text('Pendiente'),
                    ),
                    DropdownMenuItem<int>(
                      value: 1,
                      child: Text('En proceso'),
                    ),
                    DropdownMenuItem<int>(
                      value: 2,
                      child: Text('Completada'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedTaskStatus = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Filtrar por estado',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: GlobalValues.flagTask2,
        builder: (context, value, _) {
          return FutureBuilder(
              future: agendaDB!.searchTasks(searchTerm, selectedTaskStatus),
              builder: (BuildContext context,
                  AsyncSnapshot<List<TaskModel>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CardTaskWidget(
                        taskModel: snapshot.data![index],
                        agendaDB: agendaDB,
                      );
                    },
                  );
                } else {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Error!'),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                }
              });
        },
      ),
    );
  }
}
