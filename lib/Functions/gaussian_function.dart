// class GaussianElminationSolve{
//   static void printMatrix(List<List<double>> matrix) {
//     for (var row in matrix) {
//       print(row.map((e) => e.toStringAsFixed(2)).toList());
//     }
//     print('');
//   }
//
//   static void gaussianElimination(List<List<double>> matrix) {
//     int n = matrix.length;
//
//     print("Initial Matrix:");
//     printMatrix(matrix);
//
//     // Forward elimination
//     for (int i = 0; i < n; i++) {
//       // Find the row with the largest value in column i to use as the pivot
//       int maxRow = i;
//       for (int k = i + 1; k < n; k++) {
//         if ((matrix[k][i]).abs() > (matrix[maxRow][i]).abs()) {
//           maxRow = k;
//         }
//       }
//
//       // Swap the row with the largest value with the current row if needed
//       if (maxRow != i) {
//         List<double> temp = matrix[i];
//         matrix[i] = matrix[maxRow];
//         matrix[maxRow] = temp;
//         print("Swapping row $i with row $maxRow:");
//         printMatrix(matrix);
//       }
//
//       // Make sure the pivot is not zero (to astatic void division by zero)
//       if (matrix[i][i].abs() < 1e-9) {
//         print("Matrix is singular or has no unique solution.");
//         return;
//       }
//
//       // Normalize the pivot row (make the pivot 1)
//       double pivot = matrix[i][i];
//       for (int j = i; j <= n; j++) {
//         matrix[i][j] /= pivot;
//       }
//       print("Normalizing row $i to make pivot 1:");
//       printMatrix(matrix);
//
//       // Make all rows below this one 0 in the current column
//       for (int k = i + 1; k < n; k++) {
//         double factor = matrix[k][i];
//         for (int j = i; j <= n; j++) {
//           matrix[k][j] -= factor * matrix[i][j];
//         }
//         print("Row $k - (${factor.toStringAsFixed(2)}) * Row $i:");
//         printMatrix(matrix);
//       }
//     }
//
//     // Back substitution to solve for the values
//     List<double> solution = List<double>.filled(n, 0.0);
//     for (int i = n - 1; i >= 0; i--) {
//       solution[i] = matrix[i][n];
//       for (int k = i - 1; k >= 0; k--) {
//         matrix[k][n] -= matrix[k][i] * solution[i];
//         print("Back substitution on row $k:");
//         printMatrix(matrix);
//       }
//     }
//
//     // Print the final solution
//     print("Solution:");
//     for (int i = 0; i < n; i++) {
//       print("x${i + 1} = ${solution[i].toStringAsFixed(2)}");
//     }
//   }
//
// }
// class GaussianElminationSolve {
//   static void gaussianElimination(List<List<double>> matrix) {
//     int n = matrix.length;
//     if (n == 0) return;
//     int m = matrix[0].length;
//
//     for (int i = 0; i < n; i++) {
//       // Find the maximum element in the current column
//       double maxEl = matrix[i][i];
//       int maxRow = i;
//       for (int k = i + 1; k < n; k++) {
//         if (matrix[k][i] > maxEl) {
//           maxEl = matrix[k][i];
//           maxRow = k;
//         }
//       }
//
//       // Swap the maximum row with the current row
//       List<double> temp = matrix[maxRow];
//       matrix[maxRow] = matrix[i];
//       matrix[i] = temp;
//
//       // Make all rows below this one 0 in the current column
//       for (int k = i + 1; k < n; k++) {
//         double c = -matrix[k][i] / matrix[i][i];
//         for (int j = i; j < m; j++) {
//           if (i == j) {
//             matrix[k][j] = 0;
//           } else {
//             matrix[k][j] += c * matrix[i][j];
//           }
//         }
//       }
//     }
//
//     // Print the matrix for debugging
//     for (int i = 0; i < n; i++) {
//       print(matrix[i].map((e) => e.toStringAsFixed(2)).toList());
//     }
//   }
// }
// class GaussianEliminationSolve {
//   static void gaussianElimination(List<List<double>> matrix) {
//     int n = matrix.length;
//     if (n == 0) return;
//     int m = matrix[0].length;
//
//     print("Initial Matrix:");
//     printMatrix(matrix);
//
//     for (int i = 0; i < n; i++) {
//       // Find the maximum element in the current column
//       double maxEl = matrix[i][i];
//       int maxRow = i;
//       for (int k = i + 1; k < n; k++) {
//         if (matrix[k][i].abs() > maxEl.abs()) {
//           maxEl = matrix[k][i];
//           maxRow = k;
//         }
//       }
//
//       // Swap the maximum row with the current row
//       print("\nPivot for column $i: Swap row $i with row $maxRow");
//       List<double> temp = matrix[maxRow];
//       matrix[maxRow] = matrix[i];
//       matrix[i] = temp;
//       printMatrix(matrix);
//
//       // Make all rows below this one 0 in the current column
//       for (int k = i + 1; k < n; k++) {
//         double c = -matrix[k][i] / matrix[i][i];
//         print("\nEliminating column $i in row $k using row $i:");
//         for (int j = i; j < m; j++) {
//           if (i == j) {
//             matrix[k][j] = 0;
//           } else {
//             matrix[k][j] += c * matrix[i][j];
//           }
//         }
//         printMatrix(matrix);
//       }
//     }
//
//     print("\nFinal Upper Triangular Matrix:");
//     printMatrix(matrix);
//   }
//
//   static void printMatrix(List<List<double>> matrix) {
//     for (var row in matrix) {
//       print(row.map((e) => e.toStringAsFixed(2)).toList());
//     }
//   }
// }

class GaussianEliminationSolve {
  static List<List<double>> gaussianElimination(List<List<double>> matrix) {
    int n = matrix.length;
    if (n == 0) return [];

    int m = matrix[0].length;

    print("Initial Matrix:");
    printMatrix(matrix);

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
      print("\nPivot for column $i: Swap row $i with row $maxRow");
      List<double> temp = matrix[maxRow];
      matrix[maxRow] = matrix[i];
      matrix[i] = temp;
      printMatrix(matrix);

      // Make all rows below this one 0 in the current column
      for (int k = i + 1; k < n; k++) {
        double c = -matrix[k][i] / matrix[i][i];
        print("\nEliminating column $i in row $k using row $i:");
        for (int j = i; j < m; j++) {
          if (i == j) {
            matrix[k][j] = 0;
          } else {
            matrix[k][j] += c * matrix[i][j];
          }
        }
        printMatrix(matrix);
      }
    }

    print("\nFinal Upper Triangular Matrix:");
    printMatrix(matrix);
    return matrix;
  }

  static void printMatrix(List<List<double>> matrix) {
    for (var row in matrix) {
      print(row.map((e) => e.toStringAsFixed(2)).toList());
    }
  }
}
