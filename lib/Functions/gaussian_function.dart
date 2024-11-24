class GaussianEliminationSolve {
  static List<double> gaussianElimination(List<List<double>> matrix) {
    int n = matrix.length;
    if (n == 0) return [];

    int m = matrix[0].length;

    print("Initial Matrix:");
    printMatrix(matrix);

    // Forward elimination
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
        throw Exception("Matrix is singular or nearly singular at pivot $i");
      }

      // Make all rows below this one 0 in the current column
      for (int k = i + 1; k < n; k++) {
        double c = -matrix[k][i] / matrix[i][i];
        for (int j = i; j < m; j++) {
          if (i == j) {
            matrix[k][j] = 0;
          } else {
            matrix[k][j] += c * matrix[i][j];
          }
        }
      }

      print("\nAfter eliminating column $i:");
      printMatrix(matrix);
    }

    print("\nFinal Upper Triangular Matrix:");
    printMatrix(matrix);

    // Back substitution
    List<double> solution = List.filled(n, 0.0);
    for (int i = n - 1; i >= 0; i--) {
      solution[i] = matrix[i][m - 1] / matrix[i][i];
      for (int k = i - 1; k >= 0; k--) {
        matrix[k][m - 1] -= matrix[k][i] * solution[i];
      }
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
