class GaussianJordanSolve {
  static List<List<double>> gaussianJordan(List<List<double>> matrix) {
    int n = matrix.length;
    if (n == 0) return [];

    int m = matrix[0].length;

    print("Initial Matrix:");
    printMatrix(matrix);

    for (int i = 0; i < n; i++) {
      // Normalize the pivot row
      double pivot = matrix[i][i];
      if (pivot == 0) {
        print("\nCannot divide by zero pivot at row $i. Check the matrix.");
        return [];
      }

      print("\nNormalize row $i by dividing by pivot $pivot:");
      for (int j = 0; j < m; j++) {
        matrix[i][j] /= pivot;
      }
      printMatrix(matrix);

      // Eliminate all other entries in the current column
      for (int k = 0; k < n; k++) {
        if (k != i) {
          double factor = matrix[k][i];
          print("\nEliminate column $i in row $k using row $i:");
          for (int j = 0; j < m; j++) {
            matrix[k][j] -= factor * matrix[i][j];
          }
          printMatrix(matrix);
        }
      }
    }

    print("\nFinal Reduced Row Echelon Form (RREF):");
    printMatrix(matrix);
    return matrix;
  }

  static void printMatrix(List<List<double>> matrix) {
    for (var row in matrix) {
      print(row.map((e) => e.toStringAsFixed(2)).toList());
    }
  }
}
