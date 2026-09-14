# Aplicativo de Cursos Flutter

Um aplicativo Flutter de cursos com navegação por menu inferior, perfil do aluno, cursos disponíveis, favoritos e edição de perfil.

## 📚 Funcionalidades

- Tela de início com saudação personalizada e resumo do estudante.
- Tela de cursos com busca por nome ou descrição.
- Lista com seis cursos e widget reutilizável `CursoCard`.
- Sistema de favoritos com atualização em tempo real na tela de Favoritos.
- Tela de perfil com dados do usuário e botão para edição.
- Tela de edição de perfil com `TextField` e `ElevatedButton`.
- Suporte a tema claro e escuro com troca visual por botão.
- Progress bar do curso principal na tela inicial.

## 🧩 Estrutura do projeto

```text
lib/
  main.dart
  telas/
    inicio_tela.dart
    cursos_tela.dart
    favoritos_tela.dart
    perfil_tela.dart
    editar_perfil_tela.dart
  widgets/
    curso_card.dart
```

## 🚀 Como executar

1. Instale o Flutter em sua máquina.
2. Entre na pasta do projeto.
3. Execute:

```sh
flutter pub get
flutter run -d windows
```

## 🛠️ Tecnologias

- Flutter
- Dart
- Material Design
