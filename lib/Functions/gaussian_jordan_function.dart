class GaussianJordanSolve {
  static List<double>? gaussianJordan(List<List<double>> matrix) {
    int n = matrix.length;
    if (n == 0) return [];

    int m = matrix[0].length;
    if (m != n + 1) {
      throw Exception("Invalid matrix dimensions: The matrix should have n rows and n+1 columns.");
    }

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
      if (maxRow != i) {
        print("\nPivot for column $i: Swap row $i with row $maxRow");
        List<double> temp = matrix[maxRow];
        matrix[maxRow] = matrix[i];
        matrix[i] = temp;
        printMatrix(matrix);
      }

      // Check for singular matrix
      if (matrix[i][i] == 0) {
        print("\nMatrix is singular or nearly singular at pivot $i.");
        return null; // No unique solution
      }

      // Normalize the pivot row
      double pivot = matrix[i][i];
      for (int j = 0; j < m; j++) {
        matrix[i][j] /= pivot;
      }

      print("\nNormalize row $i:");
      printMatrix(matrix);

      // Eliminate all other entries in the current column
      for (int k = 0; k < n; k++) {
        if (k != i) {
          double factor = matrix[k][i];
          for (int j = 0; j < m; j++) {
            matrix[k][j] -= factor * matrix[i][j];
          }
        }
      }

      print("\nAfter eliminating column $i:");
      printMatrix(matrix);
    }

    print("\nFinal Reduced Row Echelon Form (RREF):");
    printMatrix(matrix);

    // Check for inconsistent system (e.g., 0 = c where c != 0)
    for (int i = 0; i < n; i++) {
      bool allZeros = true;
      for (int j = 0; j < m - 1; j++) {
        if (matrix[i][j] != 0) {
          allZeros = false;
          break;
        }
      }
      if (allZeros && matrix[i][m - 1] != 0) {
        print("\nNo solution: inconsistent system.");
        return null; // No solution
      }
    }

    // Extract the solution from the last column
    List<double> solution = List.filled(n, 0.0);
    for (int i = 0; i < n; i++) {
      solution[i] = matrix[i][m - 1];
    }

    print("\nSolution:");
    print(solution.map((e) => e.toStringAsFixed(2)).toList());
    return solution;
  }

  static void printMatrix(List<List<double>> matrix) {
    for (var row in matrix) {
      print(row.map((e) => e.toStringAsFixed(2)).toList());
    }
  }
}
