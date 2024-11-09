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
  final void Function()? onPressed;
  const AppButton({Key? key,   this.title, this.onPressed,   this.icon,   this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(MediaQuery.of(context).size.width, 60)),
        onPressed: onPressed,
        child:child??(title==null?Icon(icon!,size: 28,color: Colors.white): Text(
          title!,
          style: const TextStyle(
            color: Colors.white,
          ),
        )));
  }
}

class AppTextFormField  extends StatelessWidget {
  const AppTextFormField ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   TextFormField (

    );
  }
}
