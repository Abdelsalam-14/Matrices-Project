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
    [2, -1, -2, -3],
    [-3, -1, 2, 5],
    [-2, 1, 2, 6]
  ];
  List<String> steps = [];
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
                  performGaussianElimination(inputMatrix);
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
                    const Text("Solution Details",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 8),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: steps.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            steps[index],
                            style: const TextStyle(fontSize: 16),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  void performGaussianElimination(List<List<double>> matrix) {
    int n = matrix.length;
    int m = matrix[0].length;

    addStep("Initial Matrix:");
    addMatrix(matrix);

    for (int i = 0; i < n; i++) {
      // Find the maximum element in the current column
      double maxEl = matrix[i][i];
      int maxRow = i;
      for (int k = i + 1; k < n; k++) {
        if (matrix[k][i].abs() > maxEl.abs()) {
          maxEl = matrix[k][i];
          maxRow = k;
        }
      }

      // Swap the maximum row with the current row
      addStep(
          "\nPivot for column ${i + 1}: Swap row ${i + 1} with row ${maxRow+1}");
      List<double> temp = matrix[maxRow];
      matrix[maxRow] = matrix[i];
      matrix[i] = temp;
      addMatrix(matrix);

      // Make all rows below this one 0 in the current column
      for (int k = i + 1; k < n; k++) {
        double c = -matrix[k][i] / matrix[i][i];
        addStep(
            "\nEliminating column ${i + 1} in row ${k + 1} using row ${i + 1}:");
        for (int j = i; j < m; j++) {
          if (i == j) {
            matrix[k][j] = 0;
          } else {
            matrix[k][j] += c * matrix[i][j];
          }
        }
        addMatrix(matrix);
      }
    }

    addStep("\nFinal Upper Triangular Matrix:");
    addMatrix(matrix);
  }

  void addStep(String text) {
    setState(() {
      steps.add(text);
    });
  }

  void addMatrix(List<List<double>> matrix) {
    String formattedMatrix = matrix
        .map((row) => row.map((e) => e.toStringAsFixed(2)).toList().toString())
        .join("\n");
    addStep(formattedMatrix);
  }
}
