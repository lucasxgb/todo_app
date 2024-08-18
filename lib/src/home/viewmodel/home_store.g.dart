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

  late final _$titleAtom = Atom(name: '_HomeStoreBase.title', context: context);

  @override
  String? get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String? value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_HomeStoreBase.description', context: context);

  @override
  String? get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String? value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$dateAtom = Atom(name: '_HomeStoreBase.date', context: context);

  @override
  DateTime? get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(DateTime? value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  late final _$isCompletedAtom =
      Atom(name: '_HomeStoreBase.isCompleted', context: context);

  @override
  bool get isCompleted {
    _$isCompletedAtom.reportRead();
    return super.isCompleted;
  }

  @override
  set isCompleted(bool value) {
    _$isCompletedAtom.reportWrite(value, super.isCompleted, () {
      super.isCompleted = value;
    });
  }

  late final _$isEditableAtom =
      Atom(name: '_HomeStoreBase.isEditable', context: context);

  @override
  bool get isEditable {
    _$isEditableAtom.reportRead();
    return super.isEditable;
  }

  @override
  set isEditable(bool value) {
    _$isEditableAtom.reportWrite(value, super.isEditable, () {
      super.isEditable = value;
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
  void setTitle(String value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDateTime(String value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setDateTime');
    try {
      return super.setDateTime(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCompleted(TaskModel task) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setCompleted');
    try {
      return super.setCompleted(task);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetParameters() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.resetParameters');
    try {
      return super.resetParameters();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEditable() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setEditable');
    try {
      return super.setEditable();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editTask(TaskModel task, TaskModel editTask) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.editTask');
    try {
      return super.editTask(task, editTask);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
title: ${title},
description: ${description},
date: ${date},
isCompleted: ${isCompleted},
isEditable: ${isEditable},
completedTaskList: ${completedTaskList},
pendingTaskList: ${pendingTaskList}
    ''';
  }
}
