import 'package:api_training/features/users/ui/user_form_sheet.dart';
import 'package:flutter/material.dart';

import '../data/user_controller.dart';

class UsersScreen extends StatefulWidget {
  UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  late List<dynamic> _users;
  final UserController _controller = UserController();
  bool load = false;
  void _loadUsers() async {
    setState(() {
      load = true;
    });
    final users = await _controller.fetchUsers();
    setState(() {
      load = false;
      _users = users;
    });
  }

  void _openForm([Map<String, dynamic>? user]) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => AnimatedPadding(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: UserFormSheet(user: user, onSaved: _loadUsers),
      ),
    );
  }

  @override
  void initState() {
    _loadUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f6ff),
      appBar: AppBar(
        title: Text(
          "Users Data",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
        elevation: 2,
        shadowColor: Colors.black,
      ),
      body: load
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final user = _users[index];
          return Card(
            borderOnForeground: true,
            elevation: 6,
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(user['imageUrl']),
                backgroundColor: Colors.teal,
              ),

              title: Text(user['name']),
              subtitle: Text(
                "${user['jobTitle']}\n${user['email']}\nage: ${user['age']}",
              ),
              titleTextStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              subtitleTextStyle: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      _openForm(user);
                    },
                    icon: Icon(Icons.edit),
                    color: Colors.grey,
                  ),
                  IconButton(
                    onPressed: () async {
                      await _controller.removeUser(user['id']);
                      _loadUsers();
                    },
                    icon: Icon(Icons.delete),
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: _users.length,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.teal,
        onPressed: () => _openForm(),
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text("Add User", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}