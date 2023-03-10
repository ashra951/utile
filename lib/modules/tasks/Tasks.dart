import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/todo/cubic/cubit.dart';
import '../../layout/todo/cubic/states.dart';

class Tasks extends StatelessWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<todo_cubic, todo_states>(
      listener: (context, todo_states) {},
      builder: (context, state) {
        var ob = todo_cubic.get(context);
        var Tasks_data = ob.Tasks_data;
        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              child: Text(ob.Tasks_data[index]['name']),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(ob.Tasks_data[index]["date"]),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(ob.Tasks_data[index]["time"]),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                  itemCount: ob.Tasks_data.length),
            ),
          ],
        );
      },
    );
  }
}
