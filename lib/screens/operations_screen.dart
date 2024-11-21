import 'package:course_flutter/widgets/toast.dart';
import 'package:flutter/material.dart';

import '../widgets/general_functions.dart';
import '../widgets/general_widgets.dart';

class OperationsScreen extends StatefulWidget {
  final String appBarTitle;
  const OperationsScreen({Key? key, required this.appBarTitle})
      : super(key: key);

  @override
  State<OperationsScreen> createState() => _OperationsScreenState();
}

class _OperationsScreenState extends State<OperationsScreen> {
  List<List<double>> matrix = [
    // [1, 2, 3],
    // [4, 5, 6],
    // [7, 8, 9]
  ];
  TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.appBarTitle, isPop: true),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (matrix.isNotEmpty)
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(12),
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  children: [
                    const Text("Input Matrix",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 8),
                    Text(matrixToString(matrix),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            const SizedBox(height: 16),
            AppTextFormField(controller: controller, hintText: "Enter Row"),
            const SizedBox(height: 24),
            AppButton(
                title: "Add Row",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String numbers = controller.text;
                    List<double> list = [];
                    for (int i = 0; i < numbers.length; i++) {
                      list.add(double.parse(numbers[i]));
                    }
                    if (matrix.isNotEmpty) {
                      if (matrix[0].length == list.length) {
                        matrix.add(list);
                        controller.clear();
                      } else {
                        Toast.show("you made a mistake", context,
                            messageType: MessageType.error);
                      }
                    } else {
                      matrix.add(list);
                      controller.clear();
                    }

                    setState(() {});
                  }
                }),
            if (matrix.isNotEmpty) ...[
              const SizedBox(height: 12),
              AppButton(
                  title: "Delete Last Row",
                  onPressed: () {
                    matrix.removeLast();
                    setState(() {});
                  }),
              const SizedBox(height: 12),
              AppButton(
                  title: "Delete List",
                  onPressed: () {
                    matrix = [];
                    setState(() {});
                  }),
            ]
          ],
        ),
      ),
    );
  }
}
