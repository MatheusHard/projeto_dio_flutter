import 'package:flutter/material.dart';
import 'package:projeto_dio_flutter/pages/shared/utils/app_images.dart';

class UsuarioPage extends StatefulWidget {
  const UsuarioPage({super.key});

  @override
  State<UsuarioPage> createState() => _UsuarioPageState();
}

class _UsuarioPageState extends State<UsuarioPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppImages.zangado,height: 100,),
        const SizedBox( height: 100),
        Image.asset(AppImages.woman,height: 100,)

      ],
    );
  }
}
