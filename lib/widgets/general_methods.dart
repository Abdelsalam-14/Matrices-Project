String matrixToString(List<List<double>> matrix) {
  String result = '';

  for (var row in matrix) {
    result += row.map((e) => e.toStringAsFixed(2)).toList().toString() + '\n';
  }

  return result;
}


void printMatrix(List<List<double>> matrix) {

  for (var row in matrix) {
    print(row.map((e) => e.toStringAsFixed(2)).toList());
  }
  print('');

}
