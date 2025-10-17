import 'package:flutter/material.dart';
import '../models/task.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  TaskCard({required this.task});

  Color priorityColor(String p) {
    if (p == 'High') return Colors.red;
    if (p == 'Medium') return Colors.amber;
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<TaskProvider>(context, listen: false);
    final isCompleted = task.status == 'completed';
    return GestureDetector(
      onTap: () => prov.openForm(context, task),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              offset: Offset(0, 2),
              color: Colors.black12,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 8,
              height: 48,
              decoration: BoxDecoration(
                color: priorityColor(task.priority),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isCompleted ? '${task.title} ✅' : task.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF333333),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    task.desc,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Color(0xFF333333)),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFE8F5E9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(task.category),
                      ),
                      Spacer(),
                      Text(task.dueDate),
                    ],
                  ),
                  if (task.status == 'inprogress') SizedBox(height: 8),
                  if (task.status == 'inprogress')
                    LinearProgressIndicator(value: task.progress / 100),
                ],
              ),
            ),
            SizedBox(width: 12),
            Column(
              children: [
                IconButton(
                  onPressed: () => prov.openForm(context, task),
                  icon: Icon(Icons.edit, color: Color(0xFF2196F3)),
                ),
                IconButton(
                  onPressed: () => prov.deleteTask(task.id!),
                  icon: Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
