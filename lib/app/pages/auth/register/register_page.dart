import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/pages/auth/register/presenter/register_presenter.dart';
import 'package:fwc_album_app/app/pages/auth/register/view/register_view_impl.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  final RegisterPresenter presenter;
  const RegisterPage({
    super.key,
    required this.presenter,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends RegisterViewImpl {
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final confirmPasswordEC = TextEditingController();

  @override
  void dispose() {
    nameEC.dispose();
    emailEC.dispose();
    passwordEC.dispose();
    confirmPasswordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
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
              controller: nameEC,
              decoration: const InputDecoration(
                label: Text('Nome *'),
              ),
              validator: Validatorless.required('Obrigatório'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: emailEC,
              decoration: const InputDecoration(
                label: Text('E-mail *'),
              ),
              validator: Validatorless.multiple([
                Validatorless.required('Obrigatório'),
                Validatorless.email('E-mail inválido')
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
                controller: passwordEC,
                decoration: const InputDecoration(
                  label: Text('Senha *'),
                ),
                obscureText: true,
                validator: Validatorless.multiple([
                  Validatorless.required('Obrigatório'),
                  Validatorless.min(
                      6, 'Senha deve conter no mínimo 6 caracteres.')
                ])),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: confirmPasswordEC,
              decoration: const InputDecoration(
                label: Text('Confirma Senha *'),
              ),
              obscureText: true,
              validator: Validatorless.multiple([
                Validatorless.required('Obrigatório'),
                Validatorless.min(
                    6, 'Senha deve conter no mínimo 6 caracteres.'),
                Validatorless.compare(
                    passwordEC, 'Senha e confirmação não confere')
              ]),
            ),
            const SizedBox(
              height: 10,
            ),
            Button(
              width: MediaQuery.of(context).size.height * .9,
              onPressed: () {
                final formValid = formKey.currentState?.validate() ?? false;

                if (formValid) {
                  showloader();
                  widget.presenter.register(
                    name: nameEC.text,
                    email: emailEC.text,
                    password: passwordEC.text,
                    confirmPassword: confirmPasswordEC.text,
                  );
                }
              },
              style: ButtonStyles.i.primaryButton,
              labelStyle: TextStyles.i.textPrimaryFontBold,
              label: 'Cadastrar.',
            )
          ]),
        ),
      ),
    );
  }
}
