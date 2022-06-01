abstract class Usuario {
  int id;
  String nome;
  String sobrenome;
  String email;
  String senha;

  Usuario(
      {required this.id,
      required this.nome,
      required this.sobrenome,
      required this.email,
      required this.senha});
}
