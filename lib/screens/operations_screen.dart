import 'package:flutter/material.dart';

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
    //gasusss and gassuaian
    // [1,2,1,6],
    // [2,3,3,14],
    // [0,1,2,8]
    //
    // [1,1,4],
    // [1,-1,2]
    //
    //
    // [3, -4, -1, 2, 1],
    // [4, -1, -1, 3, 2],
    // [5, 2, -1, -1, 3],
    // [2, -1, 3, 2, -1]
    //
    // inverse
    // [2, 1, 1],
    // [1, 3, 2],
    // [1, 0, 0]
    //
    // [4,7],
    // [2,6]
    //
    // inverso not found
    //   [1, 2],
    //   [2, 4]
  ];

  List<String> steps = [];
  List<List<double>>? outputMatrix = [];
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
                    steps = [];
                    setState(() {});
                  }),
              const SizedBox(height: 12),
              AppButton(
                  title: "Delete List",
                  onPressed: () {
                    steps = [];
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
                    // solution = GaussianEliminationSolve.gaussianElimination(
                    //     outputMatrix!, context);
                    // GaussianEliminationSolve.gaussianElimination(outputMatrix);
                    // GaussianEliminationSolve.gaussianElimination(outputMatrix);
                    performGaussianElimination(detailsMatrix);
                  } else if (widget.appBarTitle == "Gauss Jordan") {
                    // solution = GaussianJordanSolve.gaussianJordan(
                    //     outputMatrix!, context);
                    performGaussianJordanElimination(detailsMatrix);
                  } else if (widget.appBarTitle == "Inverse") {
                    // outputMatrix = GaussianJordanInverseSolve.inverseMatrix(
                    //     outputMatrix!, context);
                    performGaussianJordanForInverse(detailsMatrix);
                  }

                  // print("second");
                  // print(inputMatrix);
                  setState(() {});
                }),
            // const SizedBox(height: 24),
            // if (solution?.isNotEmpty == true ||
            //     (outputMatrix?.isNotEmpty == true &&
            //         widget.appBarTitle == "Inverse"))
            //   Container(
            //       alignment: Alignment.center,
            //       padding: const EdgeInsets.all(12),
            //       width: MediaQuery.of(context).size.width / 2,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(24),
            //         color: Colors.white,
            //       ),
            //       child: Column(children: [
            //         const Text("Last Solution",
            //             style: TextStyle(
            //                 fontSize: 20, fontWeight: FontWeight.w800)),
            //         const SizedBox(height: 8),
            //         Text(
            //             outputMatrix?.isNotEmpty == true &&
            //                     widget.appBarTitle == "Inverse"
            //                 ? GeneralFunctions.matrixToString(outputMatrix!)
            //                 : solution.toString(),
            //             style: const TextStyle(
            //                 fontSize: 18, fontWeight: FontWeight.w600)),
            //       ])),
            const SizedBox(height: 24),
            if (outputMatrix?.isNotEmpty == true || steps.isNotEmpty)
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




  // void performGaussianJordanForInverse(List<List<double>> matrix) {
  //   int n = matrix.length;
  //
  //   // Check if the matrix is square
  //   if (matrix.any((row) => row.length != n)) {
  //     addStep("\nMatrix is not square, cannot find inverse.");
  //     return;
  //   }
  //
  //   // Create an augmented matrix with the identity matrix on the right
  //   List<List<double>> augmented = List.generate(
  //     n,
  //         (i) => [
  //       ...matrix[i].map((e) => e.toDouble()), // Ensure all values are double
  //       ...List.generate(n, (j) => i == j ? 1.0 : 0.0)
  //     ],
  //   );
  //
  //   addStep("Initial Augmented Matrix:");
  //   addMatrix(augmented);
  //
  //   // Perform Gaussian-Jordan elimination with partial pivoting
  //   for (int i = 0; i < n; i++) {
  //     // Find pivot element using partial pivoting
  //     double pivot = augmented[i][i];
  //     int pivotRow = i;
  //     if (pivot.abs() < 1e-9) {
  //       // Pivot selection: Find the largest pivot in the column
  //       for (int k = i + 1; k < n; k++) {
  //         if (augmented[k][i].abs() > pivot.abs()) {
  //           pivot = augmented[k][i];
  //           pivotRow = k;
  //         }
  //       }
  //
  //       // Swap rows if necessary
  //       if (pivotRow != i) {
  //         List<double> temp = augmented[i];
  //         augmented[i] = augmented[pivotRow];
  //         augmented[pivotRow] = temp;
  //         addStep("\nSwapped rows ${i + 1} and ${pivotRow + 1} for pivot.");
  //       }
  //     }
  //
  //     // Check if the pivot is zero (singular matrix)
  //     if (pivot.abs() < 1e-9) {
  //       addStep("\nPivot is too small at row ${i + 1}, cannot continue.");
  //       return;
  //     }
  //
  //     // Normalize the pivot row
  //     addStep("\nNormalizing row ${i + 1} by dividing by $pivot:");
  //     for (int j = 0; j < 2 * n; j++) {
  //       augmented[i][j] /= pivot;
  //     }
  //     addMatrix(augmented);
  //
  //     // Eliminate all other rows in the current column
  //     for (int k = 0; k < n; k++) {
  //       if (k != i) {
  //         double factor = augmented[k][i];
  //         addStep("\nEliminating column ${i + 1} in row ${k + 1} using row ${i + 1}:");
  //         for (int j = 0; j < 2 * n; j++) {
  //           augmented[k][j] -= factor * augmented[i][j];
  //         }
  //         addMatrix(augmented);
  //       }
  //     }
  //   }
  //
  //   // Extract the inverse matrix from the augmented matrix
  //   List<List<double>> inverse = List.generate(
  //     n,
  //         (i) => augmented[i]
  //         .sublist(n) // Take the second half of the augmented matrix (identity part)
  //         .map((e) => e.abs() < 1e-9 ? 0.0 : e) // Handle small values as zeros
  //         .toList(),
  //   );
  //
  //   addStep("\nFinal Inverse Matrix:");
  //   addMatrix(inverse);
  // }
  void performGaussianJordanForInverse(List<List<double>> matrix) {
    int n = matrix.length;

    // Check if the matrix is square
    if (matrix.any((row) => row.length != n)) {
      addStep("\nMatrix is not square, cannot find inverse.");
      return;
    }

    // Create an augmented matrix with the identity matrix on the right
    List<List<double>> augmented = List.generate(
      n,
          (i) => [
        ...matrix[i].map((e) => e.toDouble()), // Ensure all values are double
        ...List.generate(n, (j) => i == j ? 1.0 : 0.0)
      ],
    );

    addStep("Initial Augmented Matrix:");
    addMatrix(augmented);

    // Perform Gaussian-Jordan elimination with partial pivoting
    for (int i = 0; i < n; i++) {
      // Partial pivoting to handle numerical instability
      int pivotRow = i;
      for (int k = i + 1; k < n; k++) {
        if (augmented[k][i].abs() > augmented[pivotRow][i].abs()) {
          pivotRow = k;
        }
      }

      // Swap rows if necessary
      if (pivotRow != i) {
        List<double> temp = augmented[i];
        augmented[i] = augmented[pivotRow];
        augmented[pivotRow] = temp;
        addStep("\nSwapped rows ${i + 1} and ${pivotRow + 1}:");
        addMatrix(augmented);
      }

      // Find the pivot element
      double pivot = augmented[i][i];
      if (pivot.abs() < 1e-9) {
        addStep("\nPivot is too small or zero at row ${i + 1}, cannot continue.");
        return;
      }

      // Normalize the pivot row
      addStep("\nNormalizing row ${i + 1} by dividing by $pivot:");
      for (int j = 0; j < 2 * n; j++) {
        augmented[i][j] /= pivot;
      }
      addMatrix(augmented);

      // Eliminate all other rows in the current column
      for (int k = 0; k < n; k++) {
        if (k != i) {
          double factor = augmented[k][i];
          addStep(
              "\nEliminating column ${i + 1} in row ${k + 1} using row ${i + 1}:");
          for (int j = 0; j < 2 * n; j++) {
            augmented[k][j] -= factor * augmented[i][j];
          }
          addMatrix(augmented);
        }
      }
    }

    // Extract the inverse matrix from the augmented matrix
    List<List<double>> inverse = List.generate(
      n,
          (i) => augmented[i]
          .sublist(n) // Take the second half of the augmented matrix (identity part)
          .map((e) => e.abs() < 1e-9 ? 0.0 : e) // Handle small values as zeros
          .toList(),
    );

    addStep("\nFinal Inverse Matrix:");
    addMatrix(inverse);
  }



// Helper function to format and print matrices
  void addMatrix(List<List<double>> matrix) {
    String formattedMatrix = matrix
        .map((row) => row.map((e) => e == -0.0 ? 0.0 : e).toList().toString())
        .join("\n");
    addStep(formattedMatrix);
  }

// Helper function to add steps and print debug messages
  void addStep(String text) {

    setState(() {
      print(text);
      steps.add(text); // Store the steps for displaying in UI
    });
  }



// Helper function to format and print matrices
//   void addMatrix(List<List<double>> matrix) {
//     String formattedMatrix = matrix
//         .map((row) => row.map((e) => e == -0.0 ? 0.0 : e).toList().toString())
//         .join("\n");
//     addStep(formattedMatrix);
//   }
//
//   void addStep(String text) {
//     setState(() {
//       print (text);
//       steps.add(text);
//
//     });
//
//   }

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
              "\nCannot find a non-zero in column ${i + 1}. The matrix might be singular.");
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
              "\nwork on element in column ${i + 1} in row ${k + 1} using row ${i + 1}:");
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

/*
* static void printMatrix(List<List<double>> matrix) {
    for (var row in matrix) {
       print(row.map((e) =>e==-0.0||e==-0?"0.0": e.toStringAsFixed(6)).toList());
    }
  }*/

  /// GaussianElimination

  void performGaussianElimination(List<List<double>> matrix) {
    int n = matrix.length; // Number of rows
    int m = matrix[0].length; // Number of columns (including augmented part)

    addStep("Initial Matrix:");
    addMatrix(matrix);

    // Forward Elimination
    for (int i = 0; i < n; i++) {
      // Find the maximum element in the current column for pivoting
      double maxEl = matrix[i][i].abs();
      int maxRow = i;

      for (int k = i + 1; k < n; k++) {
        if (matrix[k][i].abs() > maxEl) {
          maxEl = matrix[k][i].abs();
          maxRow = k;
        }
      }

      // Swap the maximum row with the current row
      if (maxRow != i) {
        addStep(
            "Leading for column ${i + 1}: Swap row ${i + 1} with row ${maxRow + 1}");
        List<double> temp = matrix[maxRow];
        matrix[maxRow] = matrix[i];
        matrix[i] = temp;
        addMatrix(matrix); // Show updated matrix
      }

      // Check if the pivot element is zero
      if (matrix[i][i] == 0) {
        addStep(
            "Matrix is singular or nearly singular. No unique solution exists.");
        return;
      }

      // Eliminate rows below the pivot
      for (int k = i + 1; k < n; k++) {
        double factor = matrix[k][i] / matrix[i][i];
        addStep(
            "Eliminating column ${i + 1} in row ${k + 1} using row ${i + 1}:");
        for (int j = i; j < m; j++) {
          matrix[k][j] -= factor * matrix[i][j];
        }
        addMatrix(matrix); // Show the matrix after each elimination step
      }
    }

    addStep("Matrix after Forward Elimination:");
    addMatrix(matrix);

    // Back Substitution
    List<double> solution = List.filled(n, 0.0);
    for (int i = n - 1; i >= 0; i--) {
      solution[i] = matrix[i][m - 1]; // Start with the constant term
      for (int j = i + 1; j < n; j++) {
        solution[i] -= matrix[i][j] * solution[j];
      }
      solution[i] /= matrix[i][i]; // Divide by the pivot element
    }

    addStep("Solution:");
    addStep(solution.map((e) => e).toList().toString());
  }
}
