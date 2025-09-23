import 'package:api_training/features/users/data/user_controller.dart';
import 'package:flutter/material.dart';

class UserFormSheet extends StatefulWidget {
  final Map<String, dynamic>? user;
  final VoidCallback onSaved;

  const UserFormSheet({super.key, this.user, required this.onSaved});

  @override
  State<UserFormSheet> createState() => _UserFormSheetState();
}

class _UserFormSheetState extends State<UserFormSheet> {
  final _formKey = GlobalKey<FormState>();
  final _controller = UserController();

  late TextEditingController _nameCtrl;
  late TextEditingController _ageCtrl;
  late TextEditingController _emailCtrl;
  late TextEditingController _imageCtrl;
  late TextEditingController _jobCtrl;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.user?['name'] ?? "");
    _ageCtrl = TextEditingController(
      text: widget.user?['age']?.toString() ?? "",
    );
    _emailCtrl = TextEditingController(text: widget.user?['email'] ?? "");
    _imageCtrl = TextEditingController(text: widget.user?['imageUrl'] ?? "");
    _jobCtrl = TextEditingController(text: widget.user?['jobTitle'] ?? "");
  }

  Future<void> _save() async {
    if (_formKey.currentState!.validate()) {
      if (widget.user == null) {
        await _controller.addUser(name: _nameCtrl.text, age: int.parse(_ageCtrl.text), email: _emailCtrl.text, jobTitle: _jobCtrl.text, imageUrl: _imageCtrl.text);
      } else {
        await _controller.editUser(id: widget.user!['id'], name: _nameCtrl.text, age: int.parse(_ageCtrl.text), email: _emailCtrl.text, jobTitle: _jobCtrl.text, imageUrl: _imageCtrl.text);
      }
      widget.onSaved();
      if (mounted) Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Wrap(
          runSpacing: 16,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Text(
              widget.user == null ? "➕ Add User" : " Edit User",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _nameCtrl,
              decoration: const InputDecoration(
                labelText: "Name",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
              validator: (v) => v!.isEmpty ? "Required" : null,
            ),
            TextFormField(
              controller: _ageCtrl,
              decoration: const InputDecoration(
                labelText: "Age",
                prefixIcon: Icon(Icons.cake),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: (v){
                if(v!.isEmpty) return "Required";
                int? x = int.tryParse(v);
                if(x == null) return "required number";
                return null;
              },
            ),
            TextFormField(
              controller: _emailCtrl,
              decoration: const InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
              validator: (v) => v!.isEmpty ? "Required" : null,
            ),
            TextFormField(
              controller: _imageCtrl,
              decoration: const InputDecoration(
                labelText: "image url",
                prefixIcon: Icon(Icons.image),
                border: OutlineInputBorder(),
              ),
              validator: (v) => v!.isEmpty ? "Required" : null,
            ),
            TextFormField(
              controller: _jobCtrl,
              decoration: const InputDecoration(
                labelText: "job title",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
              validator: (v) => v!.isEmpty ? "Required" : null,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: _save,
              icon: const Icon(Icons.save, color: Colors.white),
              label: const Text(
                "Save",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
