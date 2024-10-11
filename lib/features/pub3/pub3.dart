import 'package:projeto_ajudar/features/tela_inicial/tela_inicial.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Pub3 extends StatelessWidget {
  const Pub3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String pixKey = '14639168000156'; // Chave Pix (CNPJ)

    return MaterialApp(
      home: Scaffold(
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Associação Cuidado Humano",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[700],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
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
                      'A Associação Cuidado Humano surgiu de um sonho em ajudar as pessoas com doenças terminais de uma maneira mais humana.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 16),
                    Image.asset(
                      "assets/images/grupo_cuidado.png",
                      width: 300,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Câncer',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green,),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      'Atualmente a ACH atende mais de 200 pacientes de 27 municípios de Minas Gerais, que '
                          'recebem todo o apoio psicológico, suporte nutricional, fraldas geriátricas, '
                          'visitas domiciliares, cestas básicas, orientações relacionadas aos direitos do paciente '
                          'com câncer além de oficinas socioeducativas que contribuem para melhorar a qualidade de vida e o '
                          'bem-estar dos pacientes, proporcionando alívio e uma maior esperança de cura num momento tão difícil de luta contra o câncer.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 16),
                    Image.asset(
                      "assets/images/grupo_cuidado_2.png",
                      width: 300,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Idosos',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green,),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      'O Grupo Viver Bem é um serviço realizado de forma continuada de convivência e fortalecimento de vínculos para idosos, com '
                          'oferta de atividades artesanais, atendimento psicossocial, grupo temático, rodas de conversas, jogos de memória, atividades '
                          'físicas, artísticas e culturais com o objetivo de contribuir para que os idosos tenham mais autonomia, liberdade e felicidade na sua melhor idade,',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      'Fonte: https://cuidadohumano.org.br/',
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              // Caixa para exibir a chave Pix
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green[50], // Fundo verde claro
                  border: Border.all(color: Colors.green[700]!), // Borda verde
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      'Chave Pix (CNPJ):',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      pixKey,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.green[900],
                      ),
                    ),
                    SizedBox(height: 16),
                    // Botão para copiar a chave Pix
                    ElevatedButton.icon(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: pixKey)); // Copia a chave Pix
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Chave Pix copiada!'),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[500], // Fundo verde
                        foregroundColor: Colors.white, // Letras brancas
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      icon: Icon(Icons.copy),
                      label: Text(
                        'Copiar Chave Pix',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
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