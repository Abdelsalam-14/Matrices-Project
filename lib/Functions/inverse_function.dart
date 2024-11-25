class GaussianJordanInverseSolve {
  static List<List<double>>? inverseMatrix(List<List<double>> matrix) {
    int n = matrix.length;

    // التحقق من أن المصفوفة مربعة
    if (matrix.isEmpty || matrix.any((row) => row.length != n)) {
      throw Exception("Input must be a square matrix.");
    }

    // إنشاء مصفوفة الهوية
    List<List<double>> inverse = List.generate(n, (i) => List.generate(n, (j) => i == j ? 1.0 : 0.0));

    print("Initial Matrix:");
    printMatrix(matrix);
    print("\nInitial Identity Matrix:");
    printMatrix(inverse);

    // تطبيق طريقة جاوس-جوردان
    for (int i = 0; i < n; i++) {
      // البحث عن أكبر عنصر في العمود (لمنع القسمة على صفر)
      double pivot = matrix[i][i];
      int pivotRow = i;

      for (int k = i + 1; k < n; k++) {
        if (matrix[k][i].abs() > pivot.abs()) {
          pivot = matrix[k][i];
          pivotRow = k;
        }
      }

      // إذا كان المحور صفرًا، يتم الإشارة إلى مصفوفة متفردة
      if (pivot == 0) {
        print("Matrix is singular and cannot be inverted.");
        return null; // لا يوجد معكوس
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

        print("Matrix after swapping:");
        printMatrix(matrix);
        printMatrix(inverse);
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
      print(row.map((e) => e.toStringAsFixed(2)).toList());
    }
  }
}
