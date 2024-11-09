import 'package:course_flutter/widgets/general_widgets.dart';
import 'package:flutter/material.dart';

import '../widgets/general_methods.dart';

class OperationsScreen extends StatefulWidget {
  final String appBarTitle;
  const OperationsScreen({Key? key, required this.appBarTitle})
      : super(key: key);

  @override
  State<OperationsScreen> createState() => _OperationsScreenState();
}

class _OperationsScreenState extends State<OperationsScreen> {
  List<List<double>> matrix = [
    // [1, 2, 3],
    // [4, 5, 6],
    // [7, 8, 9]
  ];
  TextEditingController controller = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.appBarTitle, isPop: true),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (matrix.isNotEmpty)
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(12),
                width: MediaQuery.of(context).size.width / 2,
                child: Text(matrixToString(matrix),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600)),
              ),
            const SizedBox(height: 16),
            AppButton(
                title: "Add Row",
                onPressed: () {
                  setState(() {});
                }),
          ],
        ),
      ),
    );
  }
}
