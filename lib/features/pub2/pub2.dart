import 'package:projeto_ajudar/features/tela_inicial/tela_inicial.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Pub2 extends StatelessWidget {
  const Pub2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WillPopScope(
        onWillPop: () async {
          // Substitui o comportamento padrão do botão voltar
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => TelaInicial()),
          );
          return false; // Indica que o app não deve usar o comportamento padrão
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => TelaInicial()),
                );
              },
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Sociedade São Vicente de Paulo",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[700], // Título em vermelho
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text(
                        "Comunidade Bom Pastor",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[900], // Título em vermelho vinho
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8),
                      // Botão para compartilhar o site da entidade nas redes sociais
                      ElevatedButton(
                        onPressed: () {
                          Share.share('Confira o site do Se Toque: https://www.setoqueipatinga.com.br/');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[700],
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.share), // Ícone de compartilhar
                            SizedBox(width: 10), // Espaço entre o ícone e o texto
                            Text("COMPARTILHAR", style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey), // Borda cinza
                          borderRadius: BorderRadius.circular(8), // Cantos arredondados
                        ),
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Text(
                              'História',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Foi criada em 23 de abril de 1833, em Paris, na França, por um grupo de 6 jovens universitários católicos e um'
                                  ' senhor mais velho, com o objetivo de aliviar o sofrimento das pessoas vulneráveis e fortalecer a fé de'
                                  ' seus membros.',
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Uma grande rede de Caridade, formada pelos voluntários, que se reúnem em Conferências. Elas são grupos que se'
                                  ' reúnem em paróquias, escolas, residências e têm como objetivo organizar o serviço prestado por seus membros '
                                  'às famílias favorecidas.',
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(height: 16),
                            Image.asset(
                              "assets/images/vicentinos.jpg",
                              width: 400,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'O trabalho de Caridade desenvolvido pela Sociedade de São Vicente de Paulo ao longo de mais de um século no Brasil teve como consequências uma expansão de atividades e a obtenção de uma grande credibilidade por parte da população.',
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Assim, pouco a pouco, foi sendo formada uma grande rede de Caridade, formada pelos voluntários, que se reúnem em Conferências. Elas são grupos que se reúnem em paróquias, escolas, residências e têm como objetivo organizar o serviço prestado por seus membros às famílias favorecidas.',
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(height: 16),
                            Image.asset(
                              "assets/images/vicentinos_2.jpeg",
                              width: 200,
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Existem cerca de 20 mil Conferências no Brasil, que reúnem aproximadamente 153 mil voluntários.',
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Além de atuar em situações emergenciais provendo alimentos, roupas e remédios para pessoas em apuros, a Sociedade de São Vicente de Paulo procura encontrar formas de promoção das pessoas que ajuda.',
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.justify,
                            ),
                            Text(
                              'Fonte: https://ssvpbrasil.org.br/',
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(height: 16),
                            Container(
                              width: 300,
                              height: 200,
                              decoration: BoxDecoration(
                                color: Colors.grey[200], // Cor de fundo cinza claro
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey), // Borda cinza
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Banco Bradesco",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text("Agência: 1791-4"),
                                  Text("Conta Corrente: 031550-8"),
                                  Text("CNPJ: 34.127.563/0001-67"),
                                  Text("Conselho Nacional SSVP"),
                                ],
                              ),
                            ),
                            SizedBox(height: 32),
                            //Criar o botão "AJUDAR" que abre o link do site da entidade no navegador quando clicado
                            ElevatedButton(
                              onPressed: () {
                                // Abre o navegador com a URL especificada.
                                const url = 'https://ssvpbrasil.org.br'; // URL da entidade.
                                launch(url); // Lança a URL no navegador.
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red[500], // Fundo vermelho
                                foregroundColor: Colors.white, // Letras brancas
                                padding: EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                "AJUDAR",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}