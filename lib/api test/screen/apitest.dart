import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texastodo/api%20test/controller/todo_controller.dart';

class Apitest extends StatefulWidget {
  const Apitest({super.key});

  @override
  State<Apitest> createState() => _ApitestState();
}

class _ApitestState extends State<Apitest> {
  final TodoController todoController = Get.put(TodoController());

  @override
  void initState() {
    super.initState();
    todoController.fetchTodos();
  }

  void _showAddTodoDialog() {
    final TextEditingController titleController = TextEditingController();

    Get.defaultDialog(
      title: 'Add Todo',
      content: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              final title = titleController.text.trim();
              if (title.isNotEmpty) {
                await todoController.createTodo(title);
                Get.back(); // close dialog
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("API Testing")),

      body: Obx(() {
        if (todoController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (todoController.error.isNotEmpty) {
          return Center(child: Text('Error: ${todoController.error}'));
        }

        if (todoController.todos.isEmpty) {
          return const Center(child: Text('No todos found.'));
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: todoController.todos.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final todo = todoController.todos[index];
            return ListTile(
              title: Text(todo.title ?? 'No Title'),
              subtitle: Text('ID: ${todo.id}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  Get.defaultDialog(
                    title: 'Confirm Delete',
                    middleText: 'Are you sure you want to delete this todo?',
                    textConfirm: 'Yes',
                    textCancel: 'No',
                    confirmTextColor: Colors.white,
                    onConfirm: () async {
                      await todoController.deleteTodo(todo.id!);
                      Get.back();
                    },
                  );
                },
              ),
            );
          },
        );
      }),

      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTodoDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:texastodo/api%20test/controller/todo_controller.dart';

// class Apitest extends StatefulWidget {
//   const Apitest({super.key});

//   @override
//   State<Apitest> createState() => _ApitestState();
// }

// class _ApitestState extends State<Apitest> {
//   var todoController = Get.put(TodoController());
//   @override
//   void initState() {
//     super.initState();
//     todoController.fetchTodos();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Api Testing")),
//       body: Obx(() {
//         if (todoController.isLoading.value == true) {
//           return Center(child: CircularProgressIndicator());
//         }
//         if (todoController.error.value != "") {
//           return Text(todoController.error.value);
//         }
//         if (todoController.todos.isEmpty) {
//           return Text("no data found");
//         }
//         return ListView.separated(
//           itemCount: todoController.todos.length,
//           separatorBuilder: (context, index) => SizedBox(height: 10),
//           itemBuilder: (context, index) {
//             var data = todoController.todos[index];
//             return Text("${data.title}");
//           },
//         );
//       }),
//     );
//   }
// }
