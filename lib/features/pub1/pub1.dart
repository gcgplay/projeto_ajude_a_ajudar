import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:projeto_ajudar/features/tela_inicial/tela_inicial.dart';
import 'package:url_launcher/url_launcher.dart';

class Pub1 extends StatelessWidget {
  const Pub1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //AppBar com Botão/ìcone com rota para voltar para a Tela Inicial
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TelaInicial(),
                ),
              );
            },
          ),
        ),
        //Insere um scroll de rolagem unico para toda a tela
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Alinha os filhos no centro horizontalmente.
            children: [
              Text(
                "Se Toque - Grupo de Apoio e Prevenção do Câncer",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[700],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              //Criar o botão "AJUDAR" que abre o link do site da entidade no navegador quando clicado
              ElevatedButton(
                onPressed: () {
                  // Abre o navegador com a URL especificada.
                  const url = 'https://www.setoqueipatinga.com.br'; // URL da entidade.
                  launch(url); // Lança a URL no navegador.

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[700],
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text("AJUDAR", style: TextStyle(fontSize: 20)),
              ),
              SizedBox(height: 16),
              //trecho que constroi um container com as informações e imagens do projeto social
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
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
                      'Desde 2002, o Grupo Se Toque é uma organização sem fins lucrativos que se dedica à prevenção do câncer.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      'Realizam campanhas de conscientização sobre o câncer em diversos segmentos da sociedade, oferecendo'
                          ' palestras, orientações sobre o autoexame das mamas e compartilhando depoimentos de pessoas que venceram'
                          ' a doença.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 16),
                    Image.asset(
                      "assets/images/Se toque - Foto 1.png",
                      width: 300,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Hoje, a principal missão é a CASA DE APOIO SE TOQUE, um lugar digno e '
                          'acolhedor que proporciona o máximo de conforto às pessoas em tratamento contra a doença.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 16),
                    Image.asset(
                      "assets/images/casa_se_toque.png",
                      width: 400,
                      height: 200,
                      fit: BoxFit.cover, // Ajusta a imagem para cobrir o espaço disponível.
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Missão',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Atuar na prevenção do câncer junto a comunidade e garantir o acolhimento humanizado ao paciente oncológico.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Visão',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Ser referência regional na execução de ações preventivas do câncer e promover o atendimento de qualidade '
                          'ao paciente oncológico e seus familiares.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Valores',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Transparência, ética, acolhimento humanizado, foco nas relações, valorização do ser humano '
                          'reconhecimento, qualidade, compromisso, confiança mútua e superação.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 16),
                    Image.asset(
                      "assets/images/valores_se_toque.png",
                      width: 400,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      'Fonte: https://www.setoqueipatinga.com.br/',
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
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
                    Text("COMPARTILHAR", style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}