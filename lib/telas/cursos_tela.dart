import 'package:flutter/material.dart';
import 'package:aplicativo_cursos/widgets/curso_card.dart';

class CursosTela extends StatefulWidget {
  final Set<String> favoritos;
  final Function(String) onFavoritar;

  const CursosTela({
    super.key,
    required this.favoritos,
    required this.onFavoritar,
  });

  @override
  State<CursosTela> createState() => _CursosTelaState();
}

class _CursosTelaState extends State<CursosTela> {
  final TextEditingController _pesquisaController = TextEditingController();

  @override
  void dispose() {
    _pesquisaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textoBusca = _pesquisaController.text.toLowerCase();

    final cursosFiltrados = cursosDisponiveis.where((curso) {
      return curso.nome.toLowerCase().contains(textoBusca) ||
          curso.descricao.toLowerCase().contains(textoBusca);
    }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
          child: TextField(
            controller: _pesquisaController,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
              hintText: 'Pesquisar curso',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                  color: Color(0xFF2A92BB),
                  width: 2,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: cursosFiltrados.isEmpty
              ? const Center(
                  child: Text('Nenhum curso encontrado.'),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: cursosFiltrados.length,
                  itemBuilder: (context, index) {
                    final curso = cursosFiltrados[index];
                    return CursoCard(
                      curso: curso,
                      ehFavorito: widget.favoritos.contains(curso.nome),
                      onFavoritar: () {
                        widget.onFavoritar(curso.nome);
                        setState(() {});
                      },
                      onContinuar: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Continuando ${curso.nome}'),
                          ),
                        );
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }
}
