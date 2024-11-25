import 'package:flutter/material.dart';

import '../Functions/gaussian_function.dart';
import '../Functions/gaussian_jordan_function.dart';
import '../Functions/inverse_function.dart';
import '../core/general_functions.dart';
import '../core/general_widgets.dart';
import '../core/toast.dart';

class OperationsScreen extends StatefulWidget {
  final String appBarTitle;
  const OperationsScreen({Key? key, required this.appBarTitle})
      : super(key: key);

  @override
  State<OperationsScreen> createState() => _OperationsScreenState();
}

class _OperationsScreenState extends State<OperationsScreen> {
  List<List<double>> inputMatrix = [
[1,2,1,6],
    [2,3,3,14],
    [0,1,2,8]
  ];

  List<String> steps = [];
  List<List<double>> ?outputMatrix = [];
  List<double>? solution = [];
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
                    Text(GeneralFunctions.matrixToString(inputMatrix),
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
                    List<String> numbers = controller.text.split(" ");
                    print(numbers);
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
                  // List<List<double>> matrix = inputMatrix;
                  outputMatrix =
                      inputMatrix.map((row) => List<double>.from(row)).toList();
                  List<List<double>> detailsMatrix =
                      inputMatrix.map((row) => List<double>.from(row)).toList();

                  // print("first");
                  // print(inputMatrix);
                  // outputMatrix =
                  if (widget.appBarTitle == "Gaussian") {
                    solution = GaussianEliminationSolve.gaussianElimination(
                        outputMatrix!);
                    // GaussianEliminationSolve.gaussianElimination(outputMatrix);
                    // GaussianEliminationSolve.gaussianElimination(outputMatrix);
                    performGaussianElimination(detailsMatrix);
                  } else if (widget.appBarTitle == "Gauss Jordan") {
                    solution = GaussianJordanSolve.gaussianJordan(outputMatrix!);
                    performGaussianJordanElimination(detailsMatrix);
                  } else if (widget.appBarTitle == "Inverse") {

                    outputMatrix=  GaussianJordanInverseSolve.inverseMatrix(outputMatrix!);
                    performGaussianJordanForInverse(detailsMatrix);
                  }

                  // print("second");
                  // print(inputMatrix);
                  setState(() {});
                }),
            const SizedBox(height: 24),
            if (solution?.isNotEmpty==true||(outputMatrix?.isNotEmpty==true&&widget.appBarTitle == "Inverse"))
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
                    const Text("Last Solution",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 8),
                    Text(outputMatrix?.isNotEmpty==true&&widget.appBarTitle == "Inverse"? GeneralFunctions.matrixToString(outputMatrix!):solution.toString(),

                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            const SizedBox(height: 24),
            if (outputMatrix?.isNotEmpty==true)
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

  /// Inverse
  void performGaussianJordanForInverse(List<List<double>> matrix) {
    int n = matrix.length;
    int m = matrix[0].length;

    // Check if the matrix is square
    if (n != m) {
      addStep("\nMatrix is not square, cannot find inverse.");
      return;
    }

    // Create an augmented matrix with the identity matrix on the right
    List<List<double>> augmented = [];
    for (int i = 0; i < n; i++) {
      augmented
          .add([...matrix[i], ...List.generate(n, (j) => i == j ? 1.0 : 0.0)]);
    }

    addStep("Initial Augmented Matrix:");
    addMatrix(augmented);

    // Perform Gaussian-Jordan elimination
    for (int i = 0; i < n; i++) {
      // Normalize the pivot row
      double pivot = augmented[i][i];
      if (pivot == 0) {
        addStep(
            "\nCannot divide by zero pivot at row ${i + 1}. Matrix is singular.");
        return;
      }
      addStep("\nNormalize row ${i + 1} by dividing by pivot $pivot:");
      for (int j = 0; j < augmented[i].length; j++) {
        augmented[i][j] /= pivot;
      }
      addMatrix(augmented);

      // Eliminate all other entries in the current column
      for (int k = 0; k < n; k++) {
        if (k != i) {
          double factor = augmented[k][i];
          addStep(
              "\nEliminate column ${i + 1} in row ${k + 1} using row ${i + 1}:");
          for (int j = 0; j < augmented[k].length; j++) {
            augmented[k][j] -= factor * augmented[i][j];
          }
          addMatrix(augmented);
        }
      }
    }

    // Extract the inverse matrix (the right side of the augmented matrix)
    List<List<double>> inverse = [];
    for (int i = 0; i < n; i++) {
      inverse.add(augmented[i]
          .sublist(n)); // Extract the right part of the augmented matrix
    }

    addStep("\nInverse Matrix:");
    addMatrix(inverse);
  }

  /// GaussianJordanElimination
  void performGaussianJordanElimination(List<List<double>> matrix) {
    int n = matrix.length;
    int m = matrix[0].length;

    addStep("Initial Matrix:");
    addMatrix(matrix);

    for (int i = 0; i < n; i++) {
      // Normalize the pivot row
      double pivot = matrix[i][i];
      if (pivot == 0) {
        // Attempt to find a row with a non-zero element in the pivot column
        bool swapped = false;
        for (int k = i + 1; k < n; k++) {
          if (matrix[k][i] != 0) {
            // Swap rows
            List<double> temp = matrix[i];
            matrix[i] = matrix[k];
            matrix[k] = temp;
            swapped = true;
            addStep(
                "\nPivot is zero at row ${i + 1}. Swapping with row ${k + 1}.");
            break;
          }
        }
        if (!swapped) {
          addStep(
              "\nCannot find a non-zero pivot in column ${i + 1}. The matrix might be singular.");
          return;
        }
        pivot = matrix[i][i];
      }

      addStep("\nNormalize row ${i + 1} by dividing by pivot $pivot:");
      for (int j = 0; j < m; j++) {
        matrix[i][j] /= pivot;
      }
      addMatrix(matrix);

      // Eliminate all other entries in the current column
      for (int k = 0; k < n; k++) {
        if (k != i) {
          double factor = matrix[k][i];
          addStep(
              "\nEliminate column ${i + 1} in row ${k + 1} using row ${i + 1}:");
          for (int j = 0; j < m; j++) {
            matrix[k][j] -= factor * matrix[i][j];
          }
          addMatrix(matrix);
        }
      }
    }

    addStep("\nFinal Reduced Row Echelon Form (RREF):");
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

  /// GaussianElimination
  void performGaussianElimination(List<List<double>> matrix) {
    int n = matrix.length;
    int m = matrix[0].length;

    addStep("Initial Matrix:");
    addMatrix(matrix);

    // Forward Elimination
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
          "Pivot for column ${i + 1}: Swap row ${i + 1} with row ${maxRow + 1}");
      List<double> temp = matrix[maxRow];
      matrix[maxRow] = matrix[i];
      matrix[i] = temp;
      addMatrix(matrix); // After row swap, update the matrix view

      // Check for singular matrix
      if (matrix[i][i] == 0) {
        addStep(
            "Matrix is singular or nearly singular. No unique solution exists.");
        return;
      }

      // Make all rows below this one 0 in the current column
      for (int k = i + 1; k < n; k++) {
        double c = -matrix[k][i] / matrix[i][i];
        addStep(
            "Eliminating column ${i + 1} in row ${k + 1} using row ${i + 1}:");
        for (int j = i; j < m; j++) {
          if (i == j) {
            matrix[k][j] = 0;
          } else {
            matrix[k][j] += c * matrix[i][j];
          }
        }
        addMatrix(matrix); // After elimination, update the matrix view
      }
    }

    addStep("Final Upper Triangular Matrix:");
    addMatrix(matrix);

    // Back Substitution
    List<double> solution = List.filled(n, 0.0);
    for (int i = n - 1; i >= 0; i--) {
      solution[i] = matrix[i][m - 1] / matrix[i][i];
      for (int k = i - 1; k >= 0; k--) {
        matrix[k][m - 1] -= matrix[k][i] * solution[i];
      }
    }

    addStep("Solution:");
    addStep(solution.map((e) => e.toStringAsFixed(2)).toList().toString());
  }
}
