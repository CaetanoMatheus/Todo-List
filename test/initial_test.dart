import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list/app/domain/entities/category.dart';
import 'package:todo_list/app/domain/entities/todo.dart';

void main() {
  test('', () {
    var category = Category(1, 'Category 1', 'FFF');

    var todo2 = Todo(2, 'Todo 2', null);

    todo2.category = category;

    var todo1 = Todo(1, 'Todo 1', null);

    category.addTodo(todo1);

    todo2.category = category;

    print('CATEGORY');
    print(category.id);
    print(category.name);
    print(category.color);
    print(category.todos);

    print('.\n.\n.\n.');
    print('TODO 1');
    print(todo1.id);
    print(todo1.title);
    print(todo1.category);

    print('.\n.\n.\n.');
    print('TODO 2');
    print(todo2.id);
    print(todo2.title);
    print(todo2.category);
  });
}
