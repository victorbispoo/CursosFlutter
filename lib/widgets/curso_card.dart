import 'package:flutter/material.dart';

class Curso {
  final String nome;
  final String descricao;
  final int aulas;
  final IconData icone;

  const Curso({
    required this.nome,
    required this.descricao,
    required this.aulas,
    required this.icone,
  });
}

const List<Curso> cursosDisponiveis = [
  Curso(
    nome: 'Flutter Básico',
    descricao: 'Curso introdutório sobre desenvolvimento mobile utilizando Flutter.',
    aulas: 12,
    icone: Icons.flutter_dash,
  ),
  Curso(
    nome: 'Dart Essencial',
    descricao: 'Fundamentos da linguagem Dart e boas práticas de programação.',
    aulas: 10,
    icone: Icons.code,
  ),
  Curso(
    nome: 'Interface Mobile',
    descricao: 'Criação de layouts responsivos e experiências visuais modernas.',
    aulas: 15,
    icone: Icons.phone_android,
  ),
  Curso(
    nome: 'Conexão com API',
    descricao: 'Consumindo serviços REST e gerenciando respostas em Flutter.',
    aulas: 14,
    icone: Icons.api,
  ),
  Curso(
    nome: 'Banco de Dados',
    descricao: 'Armazenamento local e persistência de dados em aplicações mobile.',
    aulas: 11,
    icone: Icons.storage,
  ),
  Curso(
    nome: 'Desenvolvimento Mobile',
    descricao: 'Processo completo de planejamento, construção e entrega de apps.',
    aulas: 18,
    icone: Icons.smartphone,
  ),
];

class CursoCard extends StatelessWidget {
  final Curso curso;
  final bool ehFavorito;
  final VoidCallback onFavoritar;
  final VoidCallback onContinuar;

  const CursoCard({
    super.key,
    required this.curso,
    required this.ehFavorito,
    required this.onFavoritar,
    required this.onContinuar,
  });

  @override
  Widget build(BuildContext context) {
    final bool temaClaro = Theme.of(context).brightness == Brightness.light;
    final Color corTitulo = temaClaro ? const Color(0xFF1B4965) : Colors.white;
    final Color corTexto = temaClaro ? Colors.grey.shade700 : Colors.white70;
    final Color corCard = temaClaro ? Colors.white : const Color(0xFF2F3542);

    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 14),
      color: corCard,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: const Color(0xFF2A92BB),
                  child: Icon(curso.icone, color: Colors.white, size: 30),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        curso.nome,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: corTitulo,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${curso.aulas} aulas',
                        style: TextStyle(
                          color: corTexto,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: onFavoritar,
                  icon: Icon(
                    ehFavorito ? Icons.star : Icons.star_border,
                    color: ehFavorito ? Colors.amber : Colors.grey,
                    size: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              curso.descricao,
              style: TextStyle(
                color: corTexto,
                fontSize: 14,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: onContinuar,
                    icon: const Icon(Icons.play_arrow_rounded),
                    label: const Text('Continuar curso'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2A92BB),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
