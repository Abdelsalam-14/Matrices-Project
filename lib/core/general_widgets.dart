import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isPop;
  const CustomAppBar({Key? key, required this.title, this.isPop = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(leading: isPop ? null : const SizedBox(), title: Text(title));
  }

  @override
  Size get preferredSize => const Size.fromHeight(65);
}

class AppButton extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Widget? child;
  final Color? color;
  final void Function()? onPressed;
  const AppButton(
      {Key? key, this.title, this.onPressed, this.icon, this.child, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            minimumSize: Size(MediaQuery.of(context).size.width, 60)),
        onPressed: onPressed,
        child: child ??
            (title == null
                ? Icon(icon!, size: 28, color: Colors.white)
                : Text(
                    title!,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  )));
  }
}

class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const AppTextFormField(
      {Key? key, required this.controller, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(

        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter row';
          }
          return null;
        },
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            hoverColor: Colors.black,
            focusColor: Colors.black,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.black)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))));
  }
}
