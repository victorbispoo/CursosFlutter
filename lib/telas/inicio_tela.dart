import 'package:flutter/material.dart';
import 'package:aplicativo_cursos/widgets/curso_card.dart';

class InicioTela extends StatelessWidget {
  final String nomeUsuario;

  const InicioTela({
    super.key,
    required this.nomeUsuario,
  });

  @override
  Widget build(BuildContext context) {
    final bool temaClaro = Theme.of(context).brightness == Brightness.light;

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(
          'Olá, $nomeUsuario!',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: temaClaro ? const Color(0xFF1B4965) : Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Continue aprendendo e evoluindo.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: temaClaro ? Colors.black54 : Colors.white70,
          ),
        ),
        const SizedBox(height: 24),

        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF2A92BB),
                Color(0xFF8FD3F4),
              ],
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.flutter_dash, color: Colors.white, size: 42),
                  SizedBox(width: 12),
                  Text(
                    'Curso em andamento',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const Text(
                'Flutter Básico',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '8 de 12 aulas concluídas',
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 12),
              const LinearProgressIndicator(
                value: 8 / 12,
                minHeight: 8,
                backgroundColor: Colors.white30,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        _SecaoEstatistica(
          titulo: 'Cursos disponíveis',
          valor: '${cursosDisponiveis.length}',
          icone: Icons.menu_book_rounded,
          cor: const Color(0xFF1B4965),
        ),

        const SizedBox(height: 14),

        _SecaoEstatistica(
          titulo: 'Resumo do estudante',
          valor: 'Cursos iniciados: 4\nCursos concluídos: 1\nAulas concluídas: 18',
          icone: Icons.assignment_turned_in_rounded,
          cor: const Color(0xFF2A92BB),
        ),
      ],
    );
  }
}

class _SecaoEstatistica extends StatelessWidget {
  final String titulo;
  final String valor;
  final IconData icone;
  final Color cor;

  const _SecaoEstatistica({
    required this.titulo,
    required this.valor,
    required this.icone,
    required this.cor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: cor,
            child: Icon(icone, color: Colors.white),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).brightness == Brightness.light
                        ? const Color(0xFF1B4965)
                        : Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  valor,
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.grey.shade700
                        : Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
