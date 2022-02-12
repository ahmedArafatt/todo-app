import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/shared/components.dart';
import 'package:todo_app/shared/constants.dart';
import 'package:todo_app/shared/data_base.dart';

class NewTasks extends StatefulWidget {
  NewTasks({Key? key}) : super(key: key);

  @override
  State<NewTasks> createState() => _NewTasksState();
}

class _NewTasksState extends State<NewTasks> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  var taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      body: ConditionalBuilder(
        condition:tasks!=null,
        builder:(context)=>ListView.separated(
          itemBuilder: (context,index) =>BuiltItem(task: tasks![index],),
          separatorBuilder: (context,index)=>Divider(),
          itemCount: tasks!.length,
        ),
        fallback: (context)=>Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          addTask(
            controller: taskController,
            context: context,
            scaffoldKey: _scaffoldKey,
          );
        }
    ,
        child: const Icon(Icons.add),
      ),
    );
  }
}
bool showBottomsheet =true;
void addTask({
  required BuildContext context,
  required GlobalKey<ScaffoldState> scaffoldKey,
  required TextEditingController controller,

}){
  if(showBottomsheet){
    showBottomsheet=false;
    scaffoldKey.currentState!.showBottomSheet((context) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            defaultTextField(
              hint: 'enter a task...',
              controller: controller,
            ),
          ],
        ),
      );
    }).closed.then((_) {
      if(controller.text.isNotEmpty){
        MyDatabase.insertToDatabase(controller.text);
        print('the task is added : ${controller.text}');
      }
      showBottomsheet = true;
    });
  }
  else{
    if(controller.text.isNotEmpty){
      MyDatabase.insertToDatabase(controller.text);
      controller.clear();
      showBottomsheet = true;
      print('the task is added : ${controller.text}');
    }
    showBottomsheet = true;
    Navigator.pop(context);
  }

}

class BuiltItem extends StatelessWidget {
  const BuiltItem({Key? key,required this.task}) : super(key: key);
  final Map task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            child: Text('2:00 AM'),
          ),
          SizedBox(width: 10,),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(task['title'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Text('2 April, 2021',style: TextStyle(fontSize: 16),)
            ],
          )
        ],
      ),
    );
  }
}
