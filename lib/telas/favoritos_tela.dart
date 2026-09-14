import 'package:flutter/material.dart';
import 'package:aplicativo_cursos/widgets/curso_card.dart';

class FavoritosTela extends StatelessWidget {
  final Set<String> favoritos;
  final Function(String) onFavoritar;

  const FavoritosTela({
    super.key,
    required this.favoritos,
    required this.onFavoritar,
  });

  @override
  Widget build(BuildContext context) {
    final bool temaClaro = Theme.of(context).brightness == Brightness.light;
    final cursosFavoritos = cursosDisponiveis
        .where((curso) => favoritos.contains(curso.nome))
        .toList();

    if (cursosFavoritos.isEmpty) {
      return Center(
        child: Text(
          'Você ainda não marcou cursos como favoritos.',
          style: TextStyle(
            fontSize: 16,
            color: temaClaro ? Colors.grey : Colors.white70,
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: cursosFavoritos.length,
      itemBuilder: (context, index) {
        final curso = cursosFavoritos[index];
        return CursoCard(
          curso: curso,
          ehFavorito: true,
          onFavoritar: () {
            onFavoritar(curso.nome);
          },
          onContinuar: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Continuando ${curso.nome}')),
            );
          },
        );
      },
    );
  }
}
