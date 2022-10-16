import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/pages/auth/login/presenter/login_presenter.dart';
import 'package:fwc_album_app/app/pages/auth/login/view/login_view_impl.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  final LoginPresenter presenter;
  const LoginPage({
    super.key,
    required this.presenter,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends LoginViewImpl {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_login.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate.fixed([
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      (MediaQuery.of(context).size.width > 450 ? 30 : .25),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Center(
                      child:
                          Text('Login', style: context.textStyles.titleWhite)),
                ),
                TextFormField(
                    controller: emailEC,
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      label: Text('email'),
                    ),
                    validator: Validatorless.multiple([
                      Validatorless.required('Informe o e-mail.'),
                      Validatorless.email('E-mail inválido.')
                    ])),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordEC,
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    label: Text('senha'),
                  ),
                  obscureText: true,
                  validator: Validatorless.multiple([
                    Validatorless.required('Senha obrigatoria'),
                    Validatorless.min(6, 'Senha fora do padrão'),
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
                      widget.presenter.login(
                        emailEC.text,
                        passwordEC.text,
                      );
                    }
                  },
                  style: ButtonStyles.i.yellowButton,
                  labelStyle: TextStyles.i.textPrimaryFontBold,
                  label: 'Logar',
                )
              ])),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    const Spacer(),
                    Text.rich(
                      style: context.textStyles.textSecondaryFontMedium
                          .copyWith(color: Colors.white),
                      TextSpan(text: 'Não possui uma conta?  ', children: [
                        TextSpan(
                            text: 'Cadastre-se',
                            style: context.textStyles.textSecondaryFontMedium
                                .copyWith(color: Colors.yellow),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.of(context)
                                  .pushNamed('/auth/register')),
                      ]),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
