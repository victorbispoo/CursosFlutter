import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indice = 0;
  final telas = const [InicioTela(), CursosTela(), PerfilTela()];
  final titulos = const ['Inicio', 'Cursos', 'Perfil'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titulos[indice]), centerTitle: true),
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
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.school_outlined),
            selectedIcon: Icon(Icons.school),
            label: 'Cursos',
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

class InicioTela extends StatelessWidget {
  const InicioTela({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(
          'Olá, estudante!',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        Text(
          'Continue aprendendo e evoluindo.',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Colors.black54),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: const LinearGradient(
              colors: [Color.fromARGB(255, 42, 146, 187), Color.fromARGB(255, 206, 244, 255)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x33000000),
                blurRadius: 12,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.flutter_dash, color: Colors.white, size: 42),
              SizedBox(height: 18),
              Text(
                'Flutter Básico',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '8 de 12 aulas concluídas',
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 14),
            ],
          ),
        ),
      ],
    );
  }
}

class CursosTela extends StatelessWidget {
  const CursosTela({super.key});

@override
Widget build(BuildContext context) {
  final cursos = [
    'Flutter Básico',
    'Dart Essencial',
    'Interface Mobile',
    'Conexão API',
  ];

  return ListView.builder(
    padding: const EdgeInsets.all(16),
    itemCount: cursos.length,
    itemBuilder: (context, indice) {
      return Card(
        child: ListTile(
          leading: const Icon(Icons.play_arrow),
          title: Text(cursos[indice]),
          trailing: const Icon(Icons.chevron_right),
        ),
      );
    },
  );
}
  }

class PerfilTela extends StatelessWidget {
  const PerfilTela({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Meu perfil'));
  }
}
