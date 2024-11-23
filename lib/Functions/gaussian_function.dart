
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
