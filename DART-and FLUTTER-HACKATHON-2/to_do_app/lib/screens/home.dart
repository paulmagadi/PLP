import 'package:flutter/material.dart';
import '../model/todo.dart';
import '../constants/colors.dart';
import '../widgets/todo_item.dart';

enum TaskCategory {
  all,
  completed,
  pending,
}

TaskCategory currentCategory = TaskCategory.all;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBGColor,
      appBar: _buildAppBar(), // AppBar widget
      body: Stack(
        // Use a stack layout to enable the add task form stack over the tasks
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 70),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                searchBox(), // Search widget
                Expanded(
                  child: _foundToDo.isEmpty
                      ? Center(
                          child: Text(
                            'YOU CURRENTLY HAVE NO TASK',
                            style: const TextStyle(
                              fontSize: 18,
                              color: colorGrey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      : ListView(
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 15, bottom: 15),
                              child: Center(
                                child: Text(
                                  getCategoryTitle(),
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            for (ToDo todo in _foundToDo.reversed)
                              ToDoItem(
                                todo: todo,
                                onToDoChanged: _handleToDoChange,
                                onDeleteItem: _deleteToDoItem,
                              ),
                          ],
                        ),
                ),
              ],
            ),
          ),
          // Text Field for adding new tasks
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 10,
                      right: 20,
                      left: 20,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 5.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: const InputDecoration(
                        hintText: 'Add a new todo task',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                // Elevated Button for adding tasks
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      _addToDoItem(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorAppBar,
                      shadowColor: Colors.grey,
                      minimumSize: const Size(40, 75),
                      elevation: 10,
                    ),
                    child: const Text(
                      '+',
                      style: TextStyle(
                        fontSize: 40,
                        color: colorBGColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // Drawer
      drawer: Drawer(
        elevation: 0,
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: colorAppBar,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/paul.jpg'),
              ),
              accountName: Text('Paul SQ Magadi'),
              accountEmail: Text('paul.learner@plp.com'),
            ),
            // List Tile inside the Drawer
            ListTile(
              title: const Text('All Tasks'),
              leading: const Icon(
                Icons.task,
                color: colorAppBar,
              ),
              onTap: () => setSelectedCategory(TaskCategory.all, context),
            ),
            ListTile(
              title: const Text('Completed Tasks'),
              leading: const Icon(
                Icons.task_alt,
                color: colorAppBar,
              ),
              onTap: () => setSelectedCategory(TaskCategory.completed, context),
            ),
            ListTile(
              title: const Text('Pending Tasks'),
              leading: const Icon(
                Icons.pending_actions,
                color: colorAppBar,
              ),
              onTap: () => setSelectedCategory(TaskCategory.pending, context),
            ),
            ListTile(
              title: const Text('About'),
              leading: const Icon(
                Icons.info,
                color: colorAppBar,
              ),
              onTap: () {
                // Navigate to the About page
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              title: const Text('Help'),
              leading: const Icon(
                Icons.help_center,
                color: colorAppBar,
              ),
              onTap: () {
                // Navigate to the Help page
                Navigator.pushNamed(context, '/help');
              },
            ),
            ListTile(
              title: const Text('Calendar'),
              leading: const Icon(
                Icons.calendar_today,
                color: colorAppBar,
              ),
              onTap: () {
                // Navigate to the Calendar page
                Navigator.pushNamed(context, '/calendar');
              },
            ),
            ListTile(
              title: const Text('Logout'),
              leading: const Icon(
                Icons.logout,
                color: colorAppBar,
              ),
              onTap: () {
                // Handle logout action
                // Add your logout logic here, e.g., sign out the user, navigate to the login screen
                // Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }

  // Handle tasks state
  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  // Delete task
  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
      // After deletion, check if the task list is empty
      if (todosList.isEmpty) {
        // If empty, display message or handle as needed
        // Here, you may want to display a message elsewhere in your app
      }
    });
  }

  // Add new task with unique id
  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(
        ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo,
        ),
      );
    });
    _todoController.clear();
  }

  // Search functionality
  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundToDo = results;
    });
  }

  // Search box
  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: colorBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 25,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search Task',
          hintStyle: TextStyle(color: colorGrey),
        ),
      ),
    );
  }

  // AppBar
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: colorAppBar,
      foregroundColor: Colors.white, // Set text and icon colors to white
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Task Master",
            style: TextStyle(fontSize: 28),
          ),
          Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    // Here I use SizeBox instead of Container
                    height: 30,
                    width: 30,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset('assets/images/paul.jpg'),
                    ),
                  ),
                  const Center(
                    child: Text(
                      "Magadi",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  // Add a PopupMenuButton to the column for the dropdown
                  PopupMenuButton<String>(
                    onSelected: (value) {
                      // Handle menu item selection
                      if (value == 'logout') {
                        // Perform logout action
                      }
                    },
                    itemBuilder: (BuildContext context) => [
                      const PopupMenuItem<String>(
                        value: 'logout',
                        child: Row(
                          children: [
                            Icon(Icons.logout, color: Colors.black),
                            SizedBox(width: 10),
                            Text('Logout'),
                          ],
                        ),
                      ),
                      // more menu items
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Function to get the title based on the current task category
  String getCategoryTitle() {
    switch (currentCategory) {
      case TaskCategory.all:
        return 'All Tasks';
      case TaskCategory.completed:
        return 'Completed Tasks';
      case TaskCategory.pending:
        return 'Pending Tasks';
      default:
        return 'Tasks';
    }
  }

  // Set the selected category
  void setSelectedCategory(TaskCategory category, BuildContext context) {
    // Close the drawer after selection
    Navigator.pop(context);
    // Update the current category and filter the tasks
    setState(() {
      currentCategory = category;
      if (category == TaskCategory.all) {
        _foundToDo = todosList;
      } else if (category == TaskCategory.completed) {
        _foundToDo = todosList.where((todo) => todo.isDone).toList();
      } else if (category == TaskCategory.pending) {
        _foundToDo = todosList.where((todo) => !todo.isDone).toList();
      }
    });
  }
}
