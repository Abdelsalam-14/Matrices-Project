// class GaussianJordanInverseSolve {
//   static List<List<double>> inverseMatrix(List<List<double>> matrix) {
//     int n = matrix.length;
//     if (n == 0) return [];
//
//     int m = matrix[0].length;
//
//     // Create an identity matrix of the same size as the input matrix
//     List<List<double>> inverse = List.generate(n, (i) => List.filled(n, 0.0));
//     for (int i = 0; i < n; i++) {
//       inverse[i][i] = 1.0;  // Initializing the identity matrix
//     }
//
//     print("Initial Matrix:");
//     printMatrix(matrix);
//     print("\nInitial Identity Matrix:");
//     printMatrix(inverse);
//
//     // Step 1: Forward Elimination using Gaussian Jordan Method
//     for (int i = 0; i < n; i++) {
//       // Find the maximum element in the current column (pivot element)
//       double pivot = matrix[i][i];
//       if (pivot == 0) {
//         throw Exception("Pivot element at row $i is zero. The matrix is singular and cannot be inverted.");
//       }
//
//       // Normalize the pivot row
//       for (int j = 0; j < n; j++) {
//         matrix[i][j] /= pivot;
//         inverse[i][j] /= pivot;
//       }
//
//       // Make all other elements in the column zero
//       for (int k = 0; k < n; k++) {
//         if (k != i) {
//           double factor = matrix[k][i];
//           for (int j = 0; j < n; j++) {
//             matrix[k][j] -= factor * matrix[i][j];
//             inverse[k][j] -= factor * inverse[i][j];
//           }
//         }
//       }
//
//       print("\nAfter normalizing row $i and eliminating column $i:");
//       printMatrix(matrix);
//       printMatrix(inverse);
//     }
//
//     print("\nFinal Inverse Matrix:");
//     printMatrix(inverse);
//     return inverse;
//   }
//
//   // Utility function to print a matrix
//   static void printMatrix(List<List<double>> matrix) {
//     for (var row in matrix) {
//       print(row.map((e) => e.toStringAsFixed(2)).toList());
//     }
//   }
// }
class GaussianJordanInverseSolve {
  static List<List<double>> inverseMatrix(List<List<double>> matrix) {
    int n = matrix.length;
    if (n == 0) return [];

    int m = matrix[0].length;

    // Create an identity matrix of the same size as the input matrix
    List<List<double>> inverse = List.generate(n, (i) => List.filled(n, 0.0));
    for (int i = 0; i < n; i++) {
      inverse[i][i] = 1.0;  // Initializing the identity matrix
    }

    print("Initial Matrix:");
    printMatrix(matrix);
    print("\nInitial Identity Matrix:");
    printMatrix(inverse);

    // Step 1: Forward Elimination using Gaussian Jordan Method
    for (int i = 0; i < n; i++) {
      // Find the maximum element in the current column (pivot element)
      double pivot = matrix[i][i];
      int pivotRow = i;

      if (pivot == 0) {
        // Find a row to swap with
        for (int k = i + 1; k < n; k++) {
          if (matrix[k][i] != 0) {
            pivotRow = k;
            break;
          }
        }

        if (matrix[pivotRow][i] == 0) {
          throw Exception("Matrix is singular and cannot be inverted. Pivot is zero at row $i.");
        }

        // Swap rows i and pivotRow in both matrix and inverse
        List<double> temp = matrix[pivotRow];
        matrix[pivotRow] = matrix[i];
        matrix[i] = temp;

        temp = inverse[pivotRow];
        inverse[pivotRow] = inverse[i];
        inverse[i] = temp;

        print("\nSwapped row $i with row $pivotRow:");
        printMatrix(matrix);
        printMatrix(inverse);
      }

      // Normalize the pivot row
      pivot = matrix[i][i];
      for (int j = 0; j < n; j++) {
        matrix[i][j] /= pivot;
        inverse[i][j] /= pivot;
      }

      print("\nAfter normalizing row $i:");
      printMatrix(matrix);
      printMatrix(inverse);

      // Make all other elements in the column zero
      for (int k = 0; k < n; k++) {
        if (k != i) {
          double factor = matrix[k][i];
          for (int j = 0; j < n; j++) {
            matrix[k][j] -= factor * matrix[i][j];
            inverse[k][j] -= factor * inverse[i][j];
          }
        }
      }

      print("\nAfter eliminating column $i:");
      printMatrix(matrix);
      printMatrix(inverse);
    }

    print("\nFinal Inverse Matrix:");
    printMatrix(inverse);
    return inverse;
  }

  // Utility function to print a matrix
  static void printMatrix(List<List<double>> matrix) {
    for (var row in matrix) {
      print(row.map((e) => e.toStringAsFixed(2)).toList());
    }
  }
}
