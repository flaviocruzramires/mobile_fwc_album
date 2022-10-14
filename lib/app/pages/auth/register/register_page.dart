import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 106.82,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bola.png'),
                      fit: BoxFit.fill)),
            ),
            const SizedBox(
              height: 30,
            ),
            Text('Cadastrar usuário',
                style: context.textStyles.textPrimaryFontBold.copyWith(
                  color: ColorsApp.i.primary,
                  fontSize: 20,
                )),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
                decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    label: Text('Nome'))),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
                decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    label: Text('e-mail'))),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
                decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    label: Text('senha'))),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
                decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    label: Text('Confirma Senha'))),
            const SizedBox(
              height: 10,
            ),
            Button(
              width: MediaQuery.of(context).size.height * .9,
              onPressed: () {
                //widget.presenter.checkLogin();
              },
              style: ButtonStyles.i.primaryButton,
              labelStyle: TextStyles.i.textPrimaryFontBold,
              label: 'Cadastrar',
            )
          ]),
        ),
      ),
    );
  }
}
