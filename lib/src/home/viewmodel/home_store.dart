import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:todo_app/src/shared/models/task_model.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final ObservableList<TaskModel> _taskList = ObservableList();

  @computed
  List<TaskModel> get completedTaskList =>
      _taskList.where((task) => task.completed == true).toList();

  @computed
  List<TaskModel> get pendingTaskList =>
      _taskList.where((task) => task.completed == false).toList();

  /* #######################  BLOCO PARA CARREGAMENTO ####################### */

  @observable
  bool isLoading = false;

  @action
  void setLoading() => isLoading = !isLoading;

  /* #######################  BLOCO PARA ADIÇÃO E REMOÇÃO ####################### */

  @action
  Future<void> addTaskInList(TaskModel task) async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 2));
    _taskList.add(task);
    isLoading = false;
  }

  @action
  Future<void> removeTaskList(TaskModel task) async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 2));
    int index = _taskList.indexWhere((element) =>
        element.title.toLowerCase() == task.title.toLowerCase() &&
        element.description.toLowerCase() == task.description.toLowerCase());
    _taskList.removeAt(index);
    isLoading = false;
  }

  /* ############  BLOCO PARA RECEBER E ATUALIZAR INFORMAÇÕES ############### */
  @observable
  String? title;

  @action
  void setTitle(String value) => title = value;

  @observable
  String? description;

  @action
  void setDescription(String value) => description = value;

  @observable
  DateTime? date;

  @action
  void setDateTime(String value) => date = DateTime.parse(value);

  @observable
  bool isCompleted = false;

  @action
  void setCompleted(TaskModel task, bool value) {
    int index = _taskList.indexWhere((element) =>
        element.title.toLowerCase() == task.title.toLowerCase() &&
        element.description.toLowerCase() == task.description.toLowerCase());
    log('$index');
    _taskList[index] = _taskList[index].copyWith(completed: value);
  }

  @action
  void resetParameters() {
    title = null;
    description = null;
    date = null;
    isCompleted = false;
  }
}
