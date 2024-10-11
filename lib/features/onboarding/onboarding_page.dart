import 'package:projeto_ajudar/common/constants/app_colors.dart';
import 'package:projeto_ajudar/common/constants/app_text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:ajudar_app/features/cadastro/pagina_cadastro.dart';
//import 'package:ajudar_app/features/tela_login/tela_login.dart';
import 'package:projeto_ajudar/features/tela_inicial/tela_inicial.dart';


class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Cria a estrutura básica da página
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50.0),
            Expanded(
              flex: 0,
              child: Container(
                //logo
                color: AppColors.white,
                child: Image.asset(
                  'assets/images/Ajude fundo.png',
                  height: 200, // Defina a altura máxima desejada
                ),
              ),
            ),
            SizedBox(height: 32),
            //slogan
            Text(
              '“Juntos, transformamos solidariedade em esperança.”',
              style: AppTextStyles.mediumText.copyWith(
                color: AppColors.dourado,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50.0),
            //botão para retornar a tela inicial
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.dourado,
                minimumSize: Size(140, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ).copyWith(
                overlayColor: MaterialStateProperty.all(AppColors.white.withOpacity(0.5)),
              ),
              //direciona para a tela inicial quando o botão é pressionado
              onPressed: () {
                Navigator.of(context).pushReplacement( // Alterado para pushReplacement
                  MaterialPageRoute(
                    builder: (context) => TelaInicial(),
                    //Caso tenha login, botão que direciona para a tela de login
                    //builder: (context) => TelaLogin(),
                  ),
                );
              },
              child: Text(
                'Entrar',
                style: AppTextStyles.mediumText.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            //Caso foi implementado tela de cadastro
            //Texto clicável que direciona para a tela de cadastro
            // Center(
            //   child: RichText(
            //     text: TextSpan(
            //       text: 'Já possui conta? ',
            //       style: AppTextStyles.smallTextBlack.copyWith(),
            //       children: [
            //         TextSpan(
            //           text: 'Cadastre-se',
            //           style: AppTextStyles.smallText.copyWith(color: AppColors.dourado),
            //           recognizer: TapGestureRecognizer() // reconhece o toque no texto
            //             ..onTap = () {
            //               Navigator.of(context).push(
            //                 MaterialPageRoute(
            //                   builder: (context) => PaginaCadastro(),
            //                 ),
            //               );
            //             },
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

          ],
        ),
      ),
    );
  }
}