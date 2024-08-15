// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  Computed<List<TaskModel>>? _$completedTaskListComputed;

  @override
  List<TaskModel> get completedTaskList => (_$completedTaskListComputed ??=
          Computed<List<TaskModel>>(() => super.completedTaskList,
              name: '_HomeStoreBase.completedTaskList'))
      .value;
  Computed<List<TaskModel>>? _$pendingTaskListComputed;

  @override
  List<TaskModel> get pendingTaskList => (_$pendingTaskListComputed ??=
          Computed<List<TaskModel>>(() => super.pendingTaskList,
              name: '_HomeStoreBase.pendingTaskList'))
      .value;

  late final _$isLoadingAtom =
      Atom(name: '_HomeStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$addTaskInListAsyncAction =
      AsyncAction('_HomeStoreBase.addTaskInList', context: context);

  @override
  Future<void> addTaskInList(TaskModel task) {
    return _$addTaskInListAsyncAction.run(() => super.addTaskInList(task));
  }

  late final _$removeTaskListAsyncAction =
      AsyncAction('_HomeStoreBase.removeTaskList', context: context);

  @override
  Future<void> removeTaskList(TaskModel task) {
    return _$removeTaskListAsyncAction.run(() => super.removeTaskList(task));
  }

  late final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase', context: context);

  @override
  void setLoading() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setLoading');
    try {
      return super.setLoading();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
completedTaskList: ${completedTaskList},
pendingTaskList: ${pendingTaskList}
    ''';
  }
}
