import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../layout/cubit/cubit.dart';
import '../layout/cubit/states.dart';
import '../shared/components/component.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCubit.get(context).archiveTasks.isNotEmpty
        ? BlocConsumer<AppCubit, AppState>(
            listener: (context, state) {},
            builder: (context, state) {
              var tasks = AppCubit.get(context).archiveTasks;

              return ListView.separated(
                itemBuilder: (context, index) =>
                    buildTaskItem(tasks[index], context),
                separatorBuilder: (context, index) => Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[300],
                ),
                itemCount: tasks.length,
              );
            },
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.menu,
                  size: 150.0,
                  color: Colors.grey,
                ),
                Text(
                  'No tasks yet , Please add some tasks.',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          );
  }
}