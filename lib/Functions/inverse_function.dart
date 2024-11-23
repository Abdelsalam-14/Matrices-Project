import '../core/toast.dart';

class GaussianJordanInverseSolve {
  static List<List<double>> findInverse(List<List<double>> matrix, context) {
    int n = matrix.length;
    if (n == 0 || matrix.any((row) => row.length != n)) {
      // throw ArgumentError("Matrix must be square and non-empty.");
      Toast.show("Matrix must be square and non-empty", context,messageType: MessageType.error);
    }

    // Create an augmented matrix with the identity matrix
    List<List<double>> augmented = [];
    for (int i = 0; i < n; i++) {
      augmented
          .add([...matrix[i], ...List.generate(n, (j) => i == j ? 1.0 : 0.0)]);
    }

    print("Initial Augmented Matrix:");
    printMatrix(augmented);

    // Perform Gaussian-Jordan elimination
    for (int i = 0; i < n; i++) {
      // Normalize the pivot row
      double pivot = augmented[i][i];
      if (pivot == 0) {
        Toast.show("Matrix is singular and cannot be inverted", context,messageType: MessageType.error);
        // print("\nMatrix is singular and cannot be inverted.");
        // throw ArgumentError("Matrix is singular and cannot be inverted.");
      }

      print("\nNormalize row $i by dividing by pivot $pivot:");
      for (int j = 0; j < augmented[i].length; j++) {
        augmented[i][j] /= pivot;
      }
      printMatrix(augmented);

      // Eliminate all other entries in the current column
      for (int k = 0; k < n; k++) {
        if (k != i) {
          double factor = augmented[k][i];
          print("\nEliminate column $i in row $k using row $i:");
          for (int j = 0; j < augmented[k].length; j++) {
            augmented[k][j] -= factor * augmented[i][j];
          }
          printMatrix(augmented);
        }
      }
    }

    // Extract the inverse matrix
    List<List<double>> inverse = [];
    for (int i = 0; i < n; i++) {
      inverse.add(augmented[i].sublist(n));
    }

    print("\nInverse Matrix:");
    printMatrix(inverse);
    return inverse;
  }

  static void printMatrix(List<List<double>> matrix) {
    for (var row in matrix) {
      print(row.map((e) => e.toStringAsFixed(2)).toList());
    }
  }
}
