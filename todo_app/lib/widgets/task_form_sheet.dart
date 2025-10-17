import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';

class TaskFormSheet extends StatefulWidget {
  final Task? task;
  TaskFormSheet({this.task});
  @override
  _TaskFormSheetState createState() => _TaskFormSheetState();
}

class _TaskFormSheetState extends State<TaskFormSheet> {
  final _form = GlobalKey<FormState>();
  late TextEditingController titleC;
  late TextEditingController descC;
  late TextEditingController categoryC;
  late TextEditingController dueC;
  String priority = 'Low';
  String status = 'waiting';
  int progress = 0;

  @override
  void initState() {
    super.initState();
    titleC = TextEditingController(text: widget.task?.title ?? '');
    descC = TextEditingController(text: widget.task?.desc ?? '');
    categoryC = TextEditingController(text: widget.task?.category ?? 'General');
    dueC = TextEditingController(text: widget.task?.dueDate ?? '');
    priority = widget.task?.priority ?? 'Low';
    status = widget.task?.status ?? 'waiting';
    progress = widget.task?.progress ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<TaskProvider>(context, listen: false);

    return Padding(
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Form(
          key: _form,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.task == null ? 'New Task' : 'Edit Task',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF333333),
                ),
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: titleC,
                decoration: InputDecoration(
                  hintText: 'Title',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: descC,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Description',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: categoryC,
                      decoration: InputDecoration(
                        hintText: 'Category',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: dueC,
                      decoration: InputDecoration(
                        hintText: 'Due date',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text('Priority', style: TextStyle(color: Color(0xFF333333))),
                  SizedBox(width: 12),
                  DropdownButton<String>(
                    value: priority,
                    items: ['Low', 'Medium', 'High']
                        .map((e) => DropdownMenuItem(child: Text(e), value: e))
                        .toList(),
                    onChanged: (v) => setState(() => priority = v!),
                  ),
                  Spacer(),
                  Text('Status', style: TextStyle(color: Color(0xFF333333))),
                  SizedBox(width: 12),
                  DropdownButton<String>(
                    value: status,
                    items: ['waiting', 'inprogress', 'completed']
                        .map((e) => DropdownMenuItem(child: Text(e), value: e))
                        .toList(),
                    onChanged: (v) => setState(() => status = v!),
                  ),
                ],
              ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () async {
                  final t = Task(
                    id: widget.task?.id,
                    title: titleC.text,
                    desc: descC.text,
                    category: categoryC.text,
                    dueDate: dueC.text,
                    priority: priority,
                    status: status,
                    progress: progress,
                  );
                  if (widget.task == null) {
                    await prov.addTask(t);
                  } else {
                    await prov.updateTask(t);
                  }
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text('Save', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
