-- Criação da Base de Dados
CREATE DATABASE db_sistema_faculdade CHARACTER SET utf8mb4;

-- Iniciar comandos da Base de Dados
use db_sistema_faculdade;

-- Criação da Tabela do Aluno
create table tbl_aluno (
        id int primary key auto_increment,
        nome_completo varchar (255) not null,
        data_nascimento date not null,
        cpf varchar (14) not null,
        status varchar (45) not null,
        RA int not null,
        unique index (id));

-- Inserindo os dados na tabela do Aluno
insert into tbl_aluno
(id, nome_completo, data_nascimento, cpf, status, RA)
values    (1, 'Aluno Exemplo 01', '2000-01-01', '000.000.000-01', 'Ativo', '100001'),
        (2, 'Aluno Exemplo 02', '2000-01-02', '000.000.000-02', 'Ativo', '100002'),
        (3, 'Aluno Exemplo 03', '2000-01-03', '000.000.000-03', 'Trancado', '100003'),
        (4, 'Aluno Exemplo 04', '2000-01-04', '000.000.000-04', 'Ativo', '100004'),
        (5, 'Aluno Exemplo 05', '2000-01-05', '000.000.000-05', 'Formado', '100005');

-- Criação da Tabela Telefone do Aluno
create table tbl_telefone_aluno (
        id int primary key auto_increment,
        telefone_aluno varchar (45) not null,
        id_aluno int not null,

        constraint fk_telefone_aluno
        foreign key (id_aluno)
        references tbl_aluno (id),
        unique index (id));

-- Inserindo os dados na tabelo do telefone do Aluno
insert into tbl_telefone_aluno
(id, telefone_aluno, id_aluno)
values    (6, '00000000006',1),
        (7, '00000000007',2),
        (8, '00000000008',3),
        (9, '00000000009',4),
        (10, '00000000010',5);

-- Criação da tabela e-mail do Aluno
create table tbl_email_aluno (
        id int primary key auto_increment,
        email varchar (45) not null,
        id_aluno int not null,

        constraint fk_email_aluno
        foreign key (id_aluno)
        references tbl_aluno (id),
        unique index (id));

-- Inserindo os dados na tabela de e-mail do Aluno
insert into tbl_email_aluno
(id, email, id_aluno)
values    (11, 'aluno1@example.com',1),
        (12, 'aluno2@example.com',2),
        (13, 'aluno3@example.com',3),
        (14, 'aluno4@example.com',4),
        (15, 'aluno5@example.com',5);

-- Criação da tabela endereço do Aluno
create table tbl_endereco_aluno (
        id int primary key auto_increment,
        logradouro varchar (45) not null,
        cep varchar (45) not null,
        bairro varchar (45) not null,
        cidade varchar (45) not null,
        estado varchar (45) not null,
        pais varchar (45) not null,
        id_aluno int not null,

        constraint fk_endereco_aluno
        foreign key (id_aluno)
        references tbl_aluno (id),
        unique index (id));

-- Inserindo os dados na tabela de endereço do Aluno
insert into tbl_endereco_aluno
(id, logradouro, cep, bairro, cidade, estado, pais, id_aluno)
values     (16, 'Rua Exemplo, 16', '00000-000', 'Bairro Exemplo', 'Cidade Exemplo', 'SP', 'Brasil',1),
        (17, 'Rua Exemplo, 17', '00000-000', 'Bairro Exemplo', 'Cidade Exemplo', 'SP', 'Brasil',2),
        (18, 'Rua Exemplo, 18', '00000-000', 'Bairro Exemplo', 'Cidade Exemplo', 'SP', 'Brasil',3),
        (19, 'Rua Exemplo, 19', '00000-000', 'Bairro Exemplo', 'Cidade Exemplo', 'SP', 'Brasil',4),
        (20, 'Rua Exemplo, 20', '00000-000', 'Bairro Exemplo', 'Cidade Exemplo', 'SP', 'Brasil',5);


-- Criação da tabela de curso
create table tbl_curso (
        id int primary key auto_increment,
        nome_curso varchar (45) not null,
        descricao text not null,
        duracao_semestre int not null,
        carga_horaria int not null,
        valor_mensalidade decimal (10,2) not null,
        id_aluno int not null,

        constraint fk_curso_aluno
        foreign key (id_aluno)
        references tbl_aluno (id),
        unique index (id));

-- Inserindo os dados na tabela do curso
insert into tbl_curso
(id, nome_curso, descricao, duracao_semestre, carga_horaria, valor_mensalidade, id_aluno)
values    (21, 'Análise e Desenvolvimento de Sistemas', 'Graduação Tecnico em Análise e Desenvolvimento de Sistemas', 3, '2480', '280.5', 1),
        (22, 'Gestão de Recursos Humanos', 'Graduação Técnico em Gestão de Recursos Humanos', 2, '1800', '160.7', 2),
        (23, 'Administração de Empresas', 'Graduação Superior em Administração de Empresas', 4, '4200', '300.5', 3),
        (24, 'Nutrição', 'Graduação Técnico em Nutrição', 3, '1800', '180.2', 4),
        (25, 'Medicina', 'Graduação Superior em Medicina', 6, '6800', '400.2', 5);

-- Criação da tabela da matéria
create table tbl_materia (
        id int primary key auto_increment,
        nome_materia varchar (45) not null,
        carga_horaria int not null,
        nota decimal (4,2) not null,
        ementa text not null,
        id_aluno int not null,

        constraint fk_materia_aluno
        foreign key (id_aluno)
        references tbl_aluno (id),
        unique index (id));

-- Inserindo os dados na tabela da matéria
insert into tbl_materia
(id, nome_materia, carga_horaria, nota, ementa, id_aluno)
values    (26, 'Database Modeling & SQL', '60', '9.8', 'Avaliação, Questionário, Pesquisa, Estudo de Caso, Portfólio', 1),
        (27, 'Recrutamento e Seleção', '60', '10.0', 'Avaliação, Questionário, Pesquisa, Estudo de Caso, Estágio', 2),
        (28, 'Raciocíonio Lógico Matemático', '60', '9.5', 'Avaliação, Questionário', 3),
        (29, 'Nutrição Esportiva', '80', '9.0', 'Avaliação, Questionário, Pesquisa, Estudo de Caso, Estágio Supervisionado', 4),
        (30, 'Anatomia', '80', '9.8', 'Avaliação, Questionário, Pesquisa, Estudo de Caso, Estágio Supervisionado', 5);

-- Criação da tabela turma
create table tbl_turma (
        id int primary key auto_increment,
        nome_turma varchar (100) not null,
        periodo varchar (20) not null,
        ano_semestre varchar (10) not null,
        id_aluno int not null,

        constraint fk_turma_aluno
        foreign key (id_aluno)
        references tbl_aluno (id),
        unique index (id));

-- Inserindo os dados na tabela turma
insert into tbl_turma
(id, nome_turma, periodo, ano_semestre, id_aluno)
values    (31, 'A1.2025', '1º Semestre', '2025', 1),
        (32, 'E2.2024', '2º Semestre', '2024', 2),
        (33, 'I1.2025', '1º Semestre', '2025', 3),
        (34, 'O2.2024', '2º Semestre', '2024', 4),
        (35, 'U1.2025', '1º Semestre', '2025', 5);

-- Criação da tabela histórico acadêmico
create table tbl_historico_academico (
        id int primary key auto_increment,
        semestre varchar (45) not null,
        ano_semestre varchar (10) not null,
        nota_final decimal (4,2) not null,
        status_materia varchar (50) not null,
        id_aluno int not null,

        constraint fk_historico_academico_aluno
        foreign key (id_aluno)
        references tbl_aluno (id),
        unique index (id));

-- Inserindo os dados na tabela histórico acadêmico
insert into tbl_historico_academico
(id, semestre, ano_semestre, nota_final, status_materia, id_aluno)
values    (36, '1º semestre', '2025', '9.5', 'Aprovado', 1),
        (37, '2º semestre', '2024', '9.9', 'Aprovado', 2),
        (38, '1º semestre', '2025', '9.0', 'Aprovado', 3),
        (39, '2º semestre', '2024', '8.9', 'Aprovado', 4),
        (40, '1º semestre', '2025', '9.5', 'Aprovado', 5);

-- Criação da tabela do(a) professor(a)
create table tbl_professor (
        id int primary key auto_increment,
        nome_completo varchar (255) not null,
        cpf varchar (14) not null,
        titulacao varchar (100) not null);

-- Inserindo os dados na tabela do(a) professor(a)
insert into tbl_professor
(id, nome_completo, cpf, titulacao)
values    (41, 'Professor Exemplo 1', '000.000.000-41', 'Doutorado'),
        (42, 'Professor Exemplo 2', '000.000.000-42', 'Mestrado'),
        (43, 'Professor Exemplo 3', '000.000.000-43', 'Doutorado'),
        (44, 'Professor Exemplo 4', '000.000.000-44', 'Mestrado');

-- Criação da tabela telefone do(a) professor(a)
create table tbl_telefone_professor (
        id int primary key auto_increment,
        telefone_professor varchar (20) not null,
        id_professor int not null,

        constraint fk_telefone_professor_professor
        foreign key (id_professor)
        references tbl_professor (id),
        unique index (id));

-- Inserindo os dados na tebela do(a) professor(a)
insert into tbl_telefone_professor
(id, telefone_professor, id_professor)
values    (45, '00000000045', 41),
        (46, '00000000046', 42),
        (47, '00000000047', 43),
        (48, '00000000048', 44);

-- Criação da tabela e-mail do(a) professor(a)
create table tbl_email_professor (
        id int primary key auto_increment,
        email varchar (100) not null,
        id_professor int not null,

        constraint fk_email_professor_professor
        foreign key (id_professor)
        references tbl_professor (id),
        unique index (id));

-- Inserindo os dados na tabela e-mail do(a) professor(a)
insert into tbl_email_professor
(id, email, id_professor)
values    (49, 'professor1@example.com', 41),
        (50, 'professor2@example.com',  42),
        (51, 'professor3@example.com',  43),
        (52, 'professor4@example.com', 44);

-- Consulta de exemplo do histórico acadêmico.
SELECT aluno.ra,
       aluno.nome_completo AS aluno,
       historico.semestre,
       historico.ano_semestre AS ano,
       historico.nota_final,
       historico.status_materia AS situacao
FROM tbl_historico_academico AS historico
JOIN tbl_aluno AS aluno ON aluno.id = historico.id_aluno
WHERE aluno.id = 1;
