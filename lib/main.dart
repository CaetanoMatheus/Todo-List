import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_list/todo_list.dart';
import 'package:todo_list/injection_container.dart' as ic;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ic.initDepencies();

  runApp(MultiProvider(providers: ic.providers, child: TodoList()));
}
