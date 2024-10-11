import 'package:projeto_ajudar/features/tela_inicial/tela_inicial.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class Pub4 extends StatelessWidget {
  const Pub4({Key? key}) : super(key: key);
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
                "ASAPAC - Associação de Amparo a Pacientes com Câncer",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[700], // Título em verde
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              //Cria o botão "AJUDAR" que abre o link do site da entidade no navegador quando clicado
              ElevatedButton(
                onPressed: () {
                  // Abre o navegador com a URL especificada.
                  const url = 'https://asapac.org.br'; // URL da entidade.
                  launch(url); // Lança a URL no navegador.
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700], // Fundo verde
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
                      'História',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Foi fundada em 1° de Março de 2004 em Belo Horizonte por Isabel Matilde Cunha. A ASAPAC está em São João del-Rei desde 2006'
                          ' e também atua na região de Ipatinga/MG.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'É uma organização civil sem fins lucrativos, que tem por finalidade lutar por uma Política de Saúde Pública ligada ao câncer '
                          'atuando efetivamente pela melhoria do atendimento ao portador, apoiando-o durante todo o processo do seu tratamento.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 16),
                    Image.asset(
                      "assets/images/ASAPAC_IMAGEM.png",
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
                      'Missão',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue,),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Promover e articular ações de defesa e garantia de direitos, prevenção, orientação, prestação de serviços, atendimento e apoio '
                          'aos pacientes com câncer e seus familiares, valorizando cada segundo da vida, amenizando o sofrimento e lutando pelo tratamento, '
                          'cura e manutenção da qualidade de vida.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Fonte: https://asapac.org.br/',
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
                  const url = 'https://asapac.org.br'; // URL da entidade.
                  launch(url); // Lança a URL no navegador.
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700], // Fundo verde
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