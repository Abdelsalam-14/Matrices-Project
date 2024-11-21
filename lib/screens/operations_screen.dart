import 'package:course_flutter/widgets/toast.dart';
import 'package:flutter/material.dart';

import '../Functions/gaussian_function.dart';
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
  List<List<double>> inputMatrix = [
    // [1, 2, 3],
    // [4, 5, 6],
    // [7, 8, 9]
  ];
  List<List<double>> outputMatrix = [];

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
            if (inputMatrix.isNotEmpty)
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(12),
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const Text("Input Matrix",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 8),
                    Text(matrixToString(inputMatrix),
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
                    if (inputMatrix.isNotEmpty) {
                      if (inputMatrix[0].length == list.length) {
                        inputMatrix.add(list);
                        controller.clear();
                      } else {
                        Toast.show("you made a mistake", context,
                            messageType: MessageType.error);
                      }
                    } else {
                      inputMatrix.add(list);
                      controller.clear();
                    }

                    setState(() {});
                  }
                }),
            if (inputMatrix.isNotEmpty) ...[
              const SizedBox(height: 12),
              AppButton(
                  title: "Delete Last Row",
                  onPressed: () {
                    inputMatrix.removeLast();
                    setState(() {});
                  }),
              const SizedBox(height: 12),
              AppButton(
                  title: "Delete List",
                  onPressed: () {
                    inputMatrix = [];
                    outputMatrix = [];
                    setState(() {});
                  }),
            ],
            const SizedBox(height: 12),
            AppButton(
                title: "Solve",
                onPressed: () {
                  outputMatrix =
                      GaussianEliminationSolve.gaussianElimination(inputMatrix);
                  setState(() {});
                }),
            const SizedBox(height: 24),
            if (outputMatrix.isNotEmpty)
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(12),
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const Text("Output Matrix",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 8),
                    Text(matrixToString(inputMatrix),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
