import 'package:flutter/material.dart';

class PerfilTela extends StatelessWidget {
  final VoidCallback onEditarPerfil;
  final String nomeUsuario;
  final String emailUsuario;

  const PerfilTela({
    super.key,
    required this.onEditarPerfil,
    required this.nomeUsuario,
    required this.emailUsuario,
  });

  @override
  Widget build(BuildContext context) {
    final bool temaClaro = Theme.of(context).brightness == Brightness.light;
    final Color corTextoPrincipal = temaClaro
        ? const Color(0xFF1B4965)
        : Colors.white;
    final Color corTextoSecundario = temaClaro
        ? Colors.grey
        : Colors.white70;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundColor: const Color(0xFF2A92BB),
            child: const Icon(Icons.person, size: 56, color: Colors.white),
          ),
          const SizedBox(height: 18),
          Text(
            nomeUsuario,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: corTextoPrincipal,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            emailUsuario,
            style: TextStyle(color: corTextoSecundario, fontSize: 16),
          ),
          const SizedBox(height: 28),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: temaClaro ? Colors.white : const Color(0xFF2F3542),
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x11000000),
                  blurRadius: 8,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                _InfoPerfil(
                  label: 'Curso atual',
                  valor: 'Flutter Básico',
                  textoPrincipal: corTextoPrincipal,
                  textoSecundario: corTextoSecundario,
                ),
                Divider(color: temaClaro ? Colors.grey.shade300 : Colors.white24),
                _InfoPerfil(
                  label: 'Quantidade de cursos',
                  valor: '6',
                  textoPrincipal: corTextoPrincipal,
                  textoSecundario: corTextoSecundario,
                ),
                Divider(color: temaClaro ? Colors.grey.shade300 : Colors.white24),
                _InfoPerfil(
                  label: 'Aulas concluídas',
                  valor: '18',
                  textoPrincipal: corTextoPrincipal,
                  textoSecundario: corTextoSecundario,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: onEditarPerfil,
            icon: const Icon(Icons.edit),
            label: const Text('Editar perfil'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2A92BB),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoPerfil extends StatelessWidget {
  final String label;
  final String valor;
  final Color textoPrincipal;
  final Color textoSecundario;

  const _InfoPerfil({
    required this.label,
    required this.valor,
    required this.textoPrincipal,
    required this.textoSecundario,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: textoPrincipal,
          ),
        ),
        Text(
          valor,
          style: TextStyle(fontSize: 15, color: textoSecundario),
        ),
      ],
    );
  }
}
