// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:todo_app/src/home/viewmodel/home_store.dart';
// import 'package:todo_app/src/shared/models/task_model.dart';
// import 'package:todo_app/src/shared/res/enums/input_border_type.dart';
// import 'package:todo_app/src/shared/widgets/custom_textformfield.dart';

// class DisplayTaskDetails extends StatefulWidget {
//   final TaskModel task;

//   const DisplayTaskDetails({
//     super.key,
//     required this.task,
//   });

//   @override
//   State<DisplayTaskDetails> createState() => _DisplayTaskDetailsState();
// }

// class _DisplayTaskDetailsState extends State<DisplayTaskDetails> {
//   final titleController = TextEditingController();
//   final dateController = TextEditingController();
//   final descriptionController = TextEditingController();
//   final formKey = GlobalKey<FormState>();
//   HomeStore? controller;

//   @override
//   void initState() {
//     controller = Provider.of<HomeStore>(context, listen: false);
//     titleController.text = widget.task.title;
//     descriptionController.text = widget.task.description!;

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final TextTheme textTheme = Theme.of(context).textTheme;
//     return Scaffold(
//       appBar: AppBar(
//         title: Align(
//           alignment: Alignment.center,
//           child: Text(
//             'Todo details',
//             style: textTheme.titleMedium,
//           ),
//         ),
//       ),
//       body: Container(
//         padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//         child: Column(
//           children: [
//             Column(
//               children: [
//                 CustomTextFormField(
//                   borderType: InputBorderType.underline,
//                   enabled: false,
//                   controller: titleController,
//                 ),
//                 const SizedBox(
//                   height: 8,
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 24,
//             ),
//             Expanded(
//               child: CustomTextFormField(
//                 borderType: InputBorderType.underline,
//                 enabled: false,
//                 controller: descriptionController,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
