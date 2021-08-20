import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_list_app/data/task_list.dart';
import 'package:todo_list_app/models/task.dart';

class Today extends StatefulWidget {
  const Today({Key? key}) : super(key: key);

  @override
  _TodayState createState() => _TodayState();
}

class _TodayState extends State<Today> {
  List<Task> items = List.of(taskList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 24,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'TODAY,AUG 4/2018',
                      style: TextStyle(
                        color: Color(0xFF9A9A9A),
                        fontFamily: 'AvenirNextRoundedPro',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = items[index];
                      return Slidable(
                        child: buildListTile(item),
                        actionPane: const SlidableDrawerActionPane(),
                        actionExtentRatio: 0.2,
                        secondaryActions: [
                          IconSlideAction(
                            iconWidget: const Icon(
                              Icons.edit,
                              color: Color(0xFFF96060),
                            ),
                            onTap: () {},
                          ),
                          IconSlideAction(
                            iconWidget: const Icon(
                              Icons.delete,
                              color: Color(0xFFF96060),
                            ),
                            onTap: () {},
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListTile(Task item) => ListTile(
        leading: item.isDone == true
            ? Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 25,
                width: 25,
                child: const Icon(
                  Icons.check_circle,
                  color: Color(0xFFF96060),
                ),
              )
            : Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF6074F9), width: 3),
                ),
              ),
        title: Text(
          item.nameTask,
          style: TextStyle(
            decoration: item.isDone == true
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            color: item.isDone == true ? Color(0xFF9E9E9E) : Color(0xFF313131),
            fontFamily: 'AvenirNextRoundedPro',
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          item.time,
          style: TextStyle(
            decoration: item.isDone == true
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            color: const Color(0xFF9E9E9E),
            fontFamily: 'AvenirNextRoundedPro',
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
            fontSize: 16,
          ),
        ),
        trailing: Container(
          height: 21,
          width: 4,
          color: item.isDone == true
              ? const Color(0xFFF96060)
              : const Color(0xFF6074F9),
        ),
        onTap: () {},
      );
}
