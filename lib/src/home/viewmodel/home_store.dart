import 'package:mobx/mobx.dart';
import 'package:todo_app/src/shared/models/task_model.dart';
import 'package:todo_app/src/shared/res/enums/location_task.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final ObservableList<TaskModel> _pendingTaskList = ObservableList();
  final ObservableList<TaskModel> _completedTaskList = ObservableList();

  @computed
  List<TaskModel> get completedTaskList => _completedTaskList;

  @computed
  List<TaskModel> get pendingTaskList => _pendingTaskList;

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
    _pendingTaskList.add(task);
    isLoading = false;
  }

  @action
  Future<void> removeTaskList(TaskModel task) async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 1));
    int index = _pendingTaskList.indexWhere((element) =>
        element.title.toLowerCase() == task.title.toLowerCase() &&
        element.description == task.description);
    _pendingTaskList.removeAt(index);
    isLoading = false;
  }

  @action
  Future<void> removeCompletedTaskList(TaskModel task) async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 1));
    int index = _completedTaskList.indexWhere((element) =>
        element.title.toLowerCase() == task.title.toLowerCase() &&
        element.description == task.description);
    _completedTaskList.removeAt(index);
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
  int toggleList(ObservableList<TaskModel> taskList, TaskModel task) {
    int index = taskList.indexWhere((element) =>
        element.title.toLowerCase() == task.title.toLowerCase() &&
        element.description == task.description);

    return index;
  }

  @action
  void setCompleted(TaskModel task, LocationTask location) {
    int index = -1;
    switch (location) {
      case LocationTask.pending:
        index = toggleList(_pendingTaskList, task);
        _pendingTaskList[index] =
            _pendingTaskList[index].copyWith(completed: !task.completed);
        _completedTaskList.add(_pendingTaskList[index]);
        _pendingTaskList.remove(_pendingTaskList[index]);

        break;
      case LocationTask.completed:
        index = toggleList(_completedTaskList, task);

        _completedTaskList[index] =
            _completedTaskList[index].copyWith(completed: !task.completed);
        _pendingTaskList.add(_completedTaskList[index]);
        _completedTaskList.remove(_completedTaskList[index]);

        break;
    }
  }

  @action
  void resetParameters() {
    title = null;
    description = null;
    date = null;
    isCompleted = false;
  }

  /* ############### BLOCO RELACIONADO AO CONTROLE E EDIÇÃO ################# */

  @observable
  bool isEditable = false;

  @action
  void setEditable() => isEditable = !isEditable;

  @action
  void editTask(TaskModel task, TaskModel editTask) {
    int index = _pendingTaskList.indexWhere((element) =>
        element.title.toLowerCase() == task.title.toLowerCase() &&
        element.description == task.description);
    if (index != -1) {
      _pendingTaskList[index] = editTask;
    } else {
      index = _completedTaskList.indexWhere((element) =>
          element.title.toLowerCase() == task.title.toLowerCase() &&
          element.description == task.description);
      _completedTaskList[index] = editTask;
    }
  }

  /* ############### BLOCO RELACIONADO AO CONTROLE DO TEMA ################# */
  @observable
  bool mode = false;

  @action
  void toggleMode() => mode = !mode;
}
