import 'package:evolution_app/models/comentario.dart';
import 'package:evolution_app/models/gestor.dart';
import 'package:evolution_app/models/grupo.dart';

import '../models/liderado.dart';

final dummyLiderados = [
  Liderado(
    imagem: "images/perfil1.png",
    cargo: "Desenvolvedor Front-End",
    experiencia: "Junior",
    //indiceAvaliacao: 4.5,
    id: 15698,
    nome: "João",
    sobrenome: "Carlos de Oliveira",
    email: "joao.oliveira@gmail.com",
    senha: "014524841",
    //comentarios: [],
  ),
  Liderado(
    imagem: "images/perfil2.png",
    cargo: "Desenvolvedor Back-End",
    experiencia: "Junior",
    //indiceAvaliacao: 4.2,
    id: 15458,
    nome: "Matheus",
    sobrenome: "Henrique de Almeida",
    email: "matheus.almeida@gmail.com",
    senha: "01451115641",
    //comentarios: [],
  ),
  Liderado(
    imagem: "images/perfil3.png",
    cargo: "Cientista de Dados",
    experiencia: "Junior",
    //indiceAvaliacao: 4.0,
    id: 11293,
    nome: "Marcelo",
    sobrenome: "Pereira dos Santos",
    email: "marcelo.santos@gmail.com",
    senha: "561313215",
    //comentarios: [],
  ),
];

final dummyGestores = [
  Gestor(
    imagem: "images/perfil1.png",
    cargo: "Engenheiro de Software",
    experiencia: "Sênior",
    id: 013456,
    nome: "Valdir",
    sobrenome: "da Silva Oliveira",
    email: "valdir.silva@gmail.com",
    senha: "451156484132",
  ),
  Gestor(
    imagem: "images/perfil2.png",
    cargo: "Arquiteto de Software",
    experiencia: "Sênior",
    id: 013452,
    nome: "Antônio",
    sobrenome: "de Lara Mancuzzi",
    email: "toni.delara@hotmail.com",
    senha: "5646146512",
  ),
  Gestor(
    imagem: "images/perfil3.png",
    cargo: "Cientista de Dados",
    experiencia: "Sênior",
    id: 014856,
    nome: "Marcos",
    sobrenome: "Donatti dos Santos",
    email: "marcos_donatti@gmail.com",
    senha: "46545613215644",
  ),
];

final dummyGrupos = [
  Grupo(
      idGrupo: 1,
      gestor: dummyGestores[0],
      liderados: [
        dummyLiderados[1],
        dummyLiderados[0],
        dummyLiderados[2],
      ],
      nome: "Maximus App",
      descricao:
          "Projeto de aplicativo para a empresa 'Maximus', onde será desenvolvido um aplicativo que auxilie no gerenciamento dos colaboradores."),
  Grupo(
      idGrupo: 2,
      gestor: dummyGestores[1],
      liderados: [
        dummyLiderados[0],
        dummyLiderados[1],
        dummyLiderados[2],
      ],
      nome: "Maximus Web",
      descricao:
          "Projeto de site para a empresa 'Maximus', onde será desenvolvido um ambiente online que auxilie no gerenciamento dos colaboradores."),
];

final dummyComentarios = [
  Comentario(
    id: 1,
    gestor: dummyGestores[0],
    liderado: dummyLiderados[1],
    nomeGrupo: dummyGrupos[0].nome,
    assunto: 'Comunicação com o Time',
    descricao:
        "Acredito que possa melhorar em aluns aspectos relacionados a comunicação, pois isso fará com que participe mais ativamente dos projetos, e assim, você poderá evoluir ainda mais",
    dataAvaliacao: '13/05/2022',
    //notaAvaliacao: 3.8
  ),
  Comentario(
    id: 2,
    gestor: dummyGestores[0],
    liderado: dummyLiderados[1],
    nomeGrupo: dummyGrupos[0].nome,
    assunto: 'Melhora na Comunicação',
    descricao:
        "Identifiquei uma grande melhoria desde o nosso último contato, principalmente depois da reunião da quarta feira, em que conseguiu identificar um problema ainda não encontrado pela equipe, e explicou de forma clara e objetiva. Parabéns.",
    dataAvaliacao: '20/05/2022',
    //notaAvaliacao: 4.5
  ),
];
