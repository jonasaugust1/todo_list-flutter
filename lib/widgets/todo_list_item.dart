import 'package:flutter/material.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.grey[200],
      ),
      padding: const EdgeInsets.all(8),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              '10/10/2010',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          Text(
              'Trefa',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600
            ),
          )
        ],
      ),
    );
  }
}
