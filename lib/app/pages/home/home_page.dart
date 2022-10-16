import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/pages/home/widgets/status_tile.dart';
import 'package:fwc_album_app/app/pages/home/widgets/sticker_percent_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.i.primary,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              final sp = await SharedPreferences.getInstance();
              sp.clear();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/', (route) => false);
            },
            icon: const Icon(Icons.logout),
            color: Colors.white,
          )
        ],
        elevation: 0,
        backgroundColor: ColorsApp.i.primary,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: LayoutBuilder(
          builder: (_, constrains) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constrains.maxHeight,
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 35),
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          'assets/images/bola.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const StickerPercentWidget(percentual: 69),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Qtd de Figurinhas',
                        style: context.textStyles.textPrimaryFontBold
                            .copyWith(color: context.colors.primary),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      StatusTile(
                          icon: Image.asset('/assets/images/all_icon.png'),
                          label: 'Todos',
                          value: 45),
                      const SizedBox(
                        height: 10,
                      ),
                      StatusTile(
                          icon: Image.asset('/assets/images/all_icon.png'),
                          label: 'Novos',
                          value: 12),
                      const SizedBox(
                        height: 10,
                      ),
                      StatusTile(
                          icon: Image.asset('/assets/images/all_icon.png'),
                          label: 'Repetidos',
                          value: 17),
                      const SizedBox(
                        height: 10,
                      ),
                      Button(
                          style: context.buttonStyles.yellowOutLineButton,
                          labelStyle: context.textStyles.textPrimaryFontBold
                              .copyWith(color: context.colors.yellow),
                          label: 'Minhas Figurinhas')
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
