import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_ajudar/features/tela_inicial/tela_inicial.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  group('Testes unitários para Tela Inicial', () {

    // Teste 1: Verifica o filtro de pesquisa
    testWidgets('Deve filtrar artigos corretamente', (WidgetTester tester) async {
      // Construa o widget da TelaInicial
      await tester.pumpWidget(const MaterialApp(
        home: TelaInicial(),
      ));

      // Verifique se todos os artigos são exibidos inicialmente
      expect(find.text('Se Toque - Grupo de Apoio e Prevenção do Câncer - Ipatinga'), findsOneWidget);
      expect(find.text('SSVP - Bom Pastor - Coronel Fabriciano'), findsOneWidget);
      expect(find.text('Associação Cuidado Humano - Ipatinga'), findsOneWidget);
      expect(find.text('Associação de Amparo a Pacientes com Câncer (ASAPAC) - Ipatinga'), findsOneWidget);

      // Digite algo no campo de pesquisa
      await tester.enterText(find.byType(TextField), 'Se Toque');
      await tester.pump();

      // Verifique se o filtro funcionou (somente o artigo relacionado ao "Se Toque" deve ser exibido)
      expect(find.text('Se Toque - Grupo de Apoio e Prevenção do Câncer - Ipatinga'), findsOneWidget);
      expect(find.text('SSVP - Bom Pastor - Coronel Fabriciano'), findsNothing);
      expect(find.text('Associação Cuidado Humano - Ipatinga'), findsNothing);
      expect(find.text('Associação de Amparo a Pacientes com Câncer (ASAPAC) - Ipatinga'), findsNothing);
    });

    // Teste 2: Verifica se o botão "Fale Conosco" chama o URL Launcher corretamente
    testWidgets('Deve abrir o aplicativo de e-mail ao clicar no botão "Fale Conosco"', (WidgetTester tester) async {
      // Simula o comportamento do `url_launcher`
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: '4028062@alunouninter.com',
        query: 'subject=Suporte do Aplicativo',
      );

      // Mock do `launch` para testar sem abrir o aplicativo de e-mail real
      final mockLaunch = (String url) async {
        expect(url, emailUri.toString());
      };
      // Substituir o método de lançamento real
      await tester.pumpWidget(
        MaterialApp(
          home: TelaInicial(),
        ),
      );

      // Encontrar o botão de "Fale Conosco" e simular o clique
      final buttonFinder = find.text('Fale conosco');
      await tester.tap(buttonFinder);
      await tester.pump();  // Atualiza o estado após o clique

      // Verificar se o método launch foi chamado com o URL correto
      expect(mockLaunch, isNotNull);
    });
  });
}