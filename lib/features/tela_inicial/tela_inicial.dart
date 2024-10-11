import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:projeto_ajudar/features/pub5/pub5.dart';
import 'package:projeto_ajudar/features/pub1/pub1.dart';
import 'package:projeto_ajudar/features/pub2/pub2.dart';
import 'package:projeto_ajudar/features/pub3/pub3.dart';
import 'package:projeto_ajudar/features/pub4/pub4.dart';


class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  //Cria um estado para que a interface do usuário da Tela Inicial reaja a mudanças
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  // Controlador para o campo de busca
  final TextEditingController _searchController = TextEditingController();
  // Lista de artigos filtrados
  List<Article> filteredArticles = articles;

  @override
  void initState() {
    super.initState();
    // Adiciona um listener para monitorar mudanças no campo de busca
    _searchController.addListener(_onSearchChanged);
  }

  // Função chamada sempre que o usuário digita um texto no campo de busca
  void _onSearchChanged() {
    final searchKeyword = _searchController.text.toLowerCase();
    setState(() {
      // Filtra a lista de artigos com base no texto de busca
      filteredArticles = articles.where((article) {
        return article.title.toLowerCase().contains(searchKeyword);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  //Função para enviar um e-mail - Botão Fale conosco
  Future<void> _sendEmail() async {
    //Abre o aplicativo de e-mail padrão
    //Define parâmentros para o envio do e-mail
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: '4028062@alunouninter.com',
      query: encodeQueryParameters({
        'subject': 'Suporte do Aplicativo',
      }),
    );

    await launch(emailLaunchUri.toString());
  }

  // Função para  codificar corretamente os parâmetros do email
  String encodeQueryParameters(Map<String, String> params) {
    return params.entries.map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //implementa uma AppBar
        appBar: AppBar(
          actions: [
            // Botão para enviar email ao suporte
            TextButton.icon(
              onPressed: _sendEmail,
              icon: Icon(Icons.help, color: Colors.black),
              label: Text('Fale conosco', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                //coluna de elementos centralizada
                child: Column(
                  children: [
                    // Imagem do cabeçalho
                    Image.asset(
                      'assets/images/Ajude fundo.png',
                      width: 130,
                      fit: BoxFit.cover,
                    ),
                    // Carrossel de imagens - responsivo ao toque
                    CarouselSlider(
                      items: [
                        //widget para detectar gestos do usuário
                        GestureDetector(
                          //função que detecta o toque do usuário e realiza o comando desejado
                          onTap: () {
                            //função do url_launcher para abrir link no navegador
                            launch('https://ipatinga.portaldacidade.com/noticias/cidade/prefeitura-de-ipatinga-lanca-campanha-para-arrecadar-agasalhos-1302');
                          },
                          child: Image.asset('assets/images/agasalho.png'),
                        ),
                        GestureDetector(
                          onTap: () {
                            launch('https://www.fsfx.com.br/doacao-de-sangue/');
                          },
                          child: Image.asset('assets/images/doe_sangue.png'),
                        ),
                      ],
                      //personaliza o desing do Carrousel
                      options: CarouselOptions(
                        height: 200,
                        autoPlay: true,
                        enlargeCenterPage: true,
                      ),
                    ),
                    // Campo de busca
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Pesquisar por Entidade',
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    // Lista de artigos filtrados
                    //Construtor que cria uma lista de itens de forma dinâmica
                    ListView.builder(
                      //adaptar o  tamanho do ListView com base no conteúdo interno
                      shrinkWrap: true,
                      //impede que o ListView seja rolável, elementos/tamanho fixo
                      physics: NeverScrollableScrollPhysics(),
                      //numero total de itens da lista
                      itemCount: filteredArticles.length,

                      //Função que define como cada item deve ser construído
                      //Utiliza um mesmo padrão para gerar uma caixa para cada elemento a ser inserido na lista
                      //Título, subtitulo, texto, imagem e botão
                      itemBuilder: (context, index) {
                        final article = filteredArticles[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Card(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: ListTile(
                                        title: Text(
                                          article.title,
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Text(
                                          article.subtitle,
                                          textAlign: TextAlign.justify,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10, width: 10,),
                                    // Imagem da logo da entidade
                                    Image.asset(
                                      article.imagePath,
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(height: 10, width: 10,),
                                  ],
                                ),
                                //Cria uma botão para cada elemento da lista
                                //Define uma rota para o clique no botão de acordo com o indice do elemento na lista
                                //Direcionando para página do projeto correspondente
                                ElevatedButton(
                                  onPressed: () {
                                    if (index == 0) {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Pub1()));
                                    } else if (index == 1) {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Pub2()));
                                    } else if (index == 2) {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Pub3()));
                                    } else if (index == 3) {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Pub4()));
                                    } else if (index == 4) {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Pub5()));
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor: Colors.yellow,
                                  ),
                                  child: Text('Conheça e Ajude'),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Classe para representar um artigo
class Article {
  final String title;
  final String subtitle;
  final String imagePath;

  //construtor nomeado que permite criar uma nova instância da classe Article
  //garante que um artigo tenha sempre um título, subtítulo e caminho de imagem válidos.
  Article({
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });
}

// Lista para criar os artigos/elementos da lista, inserindo os paramêtros obrigatórios
final List<Article> articles = [
  Article(
    title: "Se Toque - Grupo de Apoio e Prevenção do Câncer - Ipatinga",
    subtitle: "Orientar e incentivar a detecção precoce do câncer e promover o acolhimento aos pacientes oncológicos e seus familiares.",
    imagePath: "assets/images/se_toque.jpeg",
  ),
  Article(
    title: "SSVP - Bom Pastor - Coronel Fabriciano",
    subtitle: "Presta um trabalho caritativo que auxilia pessoas e famílias carentes em Coronel Fabriciano/MG no entorno da Comunidade Bom Pastor.",
    imagePath: "assets/images/ssvp.png",
  ),
  Article(
    title: "Associação Cuidado Humano - Ipatinga",
    subtitle: "Ajudar as pessoas com doenças terminais de uma maneira mais humana.",
    imagePath: "assets/images/cuidado_humano.jpeg",
  ),
  Article(
    title: "Associação de Amparo a Pacientes com Câncer (ASAPAC) - Ipatinga",
    subtitle: "Atendimento ao portador de câncer, apoiando-o durante todo o processo do seu tratamento.",
    imagePath: "assets/images/asapac_logo.png",
  ),
  Article(
    title: "Centro de Assist. Social e Incentivo ao Bem - CASIB - Coronel Fabriciano",
    subtitle: "Assistência social para crianças, adolescentes e jovens estejam em situações de risco social e extrema vulnerabilidade",
    imagePath: "assets/images/CASIB_logo.jpg",
  ),
];