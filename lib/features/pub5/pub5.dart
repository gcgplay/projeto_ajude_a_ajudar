import 'package:projeto_ajudar/features/tela_inicial/tela_inicial.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class Pub5 extends StatelessWidget {
  const Pub5({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //AppBar com Botão/ìcone com rota para voltar para a Tela Inicial
        appBar: AppBar(
          title: Text('Tela Inicial'),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "CASIB - Centro de Assistência Social e Incentivo ao Bem",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[700], // Título em verde
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              //Cria o botão "AJUDAR" que abre o link do site da entidade no navegador quando clicado
              ElevatedButton(
                onPressed: () {
                  // Abre o navegador com a URL especificada.
                  const url = 'https://www.betaniamv.com.br/casib'; // URL da entidade.
                  launch(url); // Lança a URL no navegador.
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[700], // Fundo verde
                  foregroundColor: Colors.white, // Letras brancas
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text("AJUDAR", style: TextStyle(fontSize: 20)),
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
                      'O Projeto',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Em Coronel Fabriciano, principalmente nos bairros de abrangência da entidade que compõem o território III, o crescimento e o '
                          'agravo das múltiplas expressões da questão social têm alcançado patamares que precisam de atenção especial, uma vez que diversos '
                          'fatores vêm contribuindo para que crianças, adolescentes e jovens estejam em situações de risco social e extrema vulnerabilidade.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 16),
                    Text(
                      '“Acolhemos pessoas rejeitadas pela sociedade para apresentar a elas a mensagem de esperança e a oportunidade de vida nova que Jesus '
                          'conquistou por toda a humanidade através de sua morte na cruz”, afirma Sérgio Antônio Dias, presidente do CASIB.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 16),
                    Image.asset(
                      "assets/images/casib_image.jpg",
                      width: 350,
                      height: 350,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Seu objetivo primordial é atender crianças, adolescentes, adultos e idosos portadores de qualquer tipo de neoplasia '
                          'através do oferecimento de informações, de encaminhamentos, de orientações em relação à prevenção e o tratamento '
                          'do câncer; concessão de benefícios, serviços e atendimentos que vão contribuir para minimizar o sofrimento e desgaste '
                          'dos pacientes e seus familiares evitando a fragilização dos vínculos afetivos relacionais familiares e sociais dos pacientes.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'ESPAÇO DE REABILITAÇÃO CASA VERDE',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.orange,),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'O objetivo da Casa Verde é abrigar e reabilitar homens que sejam dependentes do uso se todos os tipos de substâncias psicoativas, para que possam ingressar novamente na sociedade. '
                          'Tal reabilitação tem como base principal o evangelho de Jesus, isto é, além da libertação da dependência química, esses homens conhecem '
                          'a palavra de Deus e, a maioria, saem de lá convertidos.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Fonte: https://www.betaniamv.com.br/casib',
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32), // Espaço entre a imagem e o botão
              ElevatedButton(
                onPressed: () {
                  // Abre o navegador com a URL especificada.
                  const url = 'https://www.betaniamv.com.br/casib'; // URL da entidade.
                  launch(url); // Lança a URL no navegador.
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[700], // Fundo verde
                  foregroundColor: Colors.white, // Letras brancas
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text("AJUDAR", style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}