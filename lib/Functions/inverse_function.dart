import 'package:course_flutter/core/toast.dart';

class GaussianJordanInverseSolve {
  static List<List<double>>? inverseMatrix(List<List<double>> matrix, context) {
    int n = matrix.length;

    // التحقق من أن المصفوفة مربعة
    if (matrix.isEmpty || matrix.any((row) => row.length != n)) {
      Toast.show("Input must be a square matrix", context,
          messageType: MessageType.error);
      throw Exception("Input must be a square matrix.");
    }

    // تحويل القيم إلى أعداد عشرية
    matrix =
        matrix.map((row) => row.map((e) => e.toDouble()).toList()).toList();

    // إنشاء مصفوفة الهوية
    List<List<double>> inverse =
        List.generate(n, (i) => List.generate(n, (j) => i == j ? 1.0 : 0.0));

    print("Initial Matrix:");
    printMatrix(matrix);
    print("\nInitial Identity Matrix:");
    printMatrix(inverse);

    // تطبيق طريقة جاوس-جوردان
    for (int i = 0; i < n; i++) {
      // البحث عن المحور
      double pivot = matrix[i][i];
      int pivotRow = i;

      for (int k = i + 1; k < n; k++) {
        if (matrix[k][i].abs() > pivot.abs()) {
          pivot = matrix[k][i];
          pivotRow = k;
        }
      }

      // إذا كان المحور صفرًا أو قريبًا جدًا
      if (pivot.abs() < 1e-9) {
        Toast.show("Matrix is singular and cannot be inverted.", context,
            messageType: MessageType.error);
        print("Matrix is singular and cannot be inverted.");
        return null;
      }

      // تبديل الصفوف إذا لزم الأمر
      if (pivotRow != i) {
        print("\nSwapping row $i with row $pivotRow");
        List<double> temp = matrix[i];
        matrix[i] = matrix[pivotRow];
        matrix[pivotRow] = temp;

        temp = inverse[i];
        inverse[i] = inverse[pivotRow];
        inverse[pivotRow] = temp;
      }

      // تطبيع الصف المحوري
      pivot = matrix[i][i];
      for (int j = 0; j < n; j++) {
        matrix[i][j] /= pivot;
        inverse[i][j] /= pivot;
      }

      print("\nAfter normalizing row $i:");
      printMatrix(matrix);
      printMatrix(inverse);

      // تصفير الأعمدة الأخرى
      for (int k = 0; k < n; k++) {
        if (k != i) {
          double factor = matrix[k][i];
          print("\nFactor for row $k: $factor");
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

  // دالة لطباعة المصفوفات
  static void printMatrix(List<List<double>> matrix) {
    for (var row in matrix) {
      print(row.map((e) => e.toStringAsFixed(6)).toList());
    }
  }
}
