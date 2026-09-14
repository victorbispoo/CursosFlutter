import 'package:flutter/material.dart';
import 'package:aplicativo_cursos/telas/cursos_tela.dart';
import 'package:aplicativo_cursos/telas/editar_perfil_tela.dart';
import 'package:aplicativo_cursos/telas/favoritos_tela.dart';
import 'package:aplicativo_cursos/telas/inicio_tela.dart';
import 'package:aplicativo_cursos/telas/perfil_tela.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool temaEscuro = false;

  void alternarTema() {
    setState(() {
      temaEscuro = !temaEscuro;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: temaEscuro ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: const Color(0xFFF5F3FA),
        useMaterial3: true,
        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: Color.fromARGB(255, 42, 146, 187),
          indicatorColor: Color.fromARGB(255, 206, 244, 255),
          iconTheme: WidgetStatePropertyAll(
            IconThemeData(color: Colors.white),
          ),
          labelTextStyle: WidgetStatePropertyAll(
            TextStyle(color: Colors.white),
          ),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1D1F26),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2A92BB),
          brightness: Brightness.dark,
        ),
        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: Color(0xFF1B4965),
          indicatorColor: Color(0xFF8FD3F4),
          iconTheme: WidgetStatePropertyAll(
            IconThemeData(color: Colors.white),
          ),
          labelTextStyle: WidgetStatePropertyAll(
            TextStyle(color: Colors.white),
          ),
        ),
      ),
      home: HomePage(
        alternarTema: alternarTema,
        temaEscuro: temaEscuro,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final VoidCallback alternarTema;
  final bool temaEscuro;

  const HomePage({
    super.key,
    required this.alternarTema,
    required this.temaEscuro,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indice = 0;
  String nomeUsuario = 'Bispo';
  String emailUsuario = 'bispo@email.com';

  final Set<String> favoritos = <String>{
    'Flutter Básico',
    'Dart Essencial',
    'Interface Mobile',
  };

  void alternarFavorito(String nomeCurso) {
    setState(() {
      if (favoritos.contains(nomeCurso)) {
        favoritos.remove(nomeCurso);
      } else {
        favoritos.add(nomeCurso);
      }
    });
  }

  void atualizarPerfil(String novoNome, String novoEmail) {
    setState(() {
      nomeUsuario = novoNome.trim().isEmpty ? 'Bispo' : novoNome.trim();
      emailUsuario = novoEmail.trim().isEmpty ? 'bispo@email.com' : novoEmail.trim();
    });
  }

  @override
  Widget build(BuildContext context) {
    final telas = [
      InicioTela(nomeUsuario: nomeUsuario),
      CursosTela(
        favoritos: favoritos,
        onFavoritar: alternarFavorito,
      ),
      FavoritosTela(
        favoritos: favoritos,
        onFavoritar: alternarFavorito,
      ),
      PerfilTela(
        nomeUsuario: nomeUsuario,
        emailUsuario: emailUsuario,
        onEditarPerfil: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => EditarPerfilTela(
                nomeInicial: nomeUsuario,
                emailInicial: emailUsuario,
                onSalvar: atualizarPerfil,
              ),
            ),
          );
        },
      ),
    ];

    final titulos = ['Início', 'Cursos', 'Favoritos', 'Perfil'];

    return Scaffold(
      appBar: AppBar(
        title: Text(titulos[indice]),
        centerTitle: true,
        backgroundColor: const Color(0xFF2A92BB),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: widget.alternarTema,
            icon: Icon(
              widget.temaEscuro ? Icons.light_mode : Icons.dark_mode,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: telas[indice],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (valor) {
          setState(() {
            indice = valor;
          });
        },
        selectedIndex: indice,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Início',
          ),
          NavigationDestination(
            icon: Icon(Icons.school_outlined),
            selectedIcon: Icon(Icons.school),
            label: 'Cursos',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
