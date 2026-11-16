# Banco de Dados para Gestão Acadêmica

Projeto acadêmico de banco de dados relacional para organizar alunos, professores, cursos, disciplinas, turmas e histórico acadêmico. O trabalho parte do levantamento de requisitos e passa pelos modelos conceitual, lógico e físico.

## O que o projeto demonstra

- Modelagem conceitual no brModelo e modelagem lógica no MySQL Workbench.
- Script MySQL com 11 tabelas, chaves primárias e estrangeiras e dados fictícios.
- Consulta com `JOIN` que reúne a identificação do aluno e seu histórico acadêmico.

## Como executar

1. Abra [`sql/gestao-academica.sql`](sql/gestao-academica.sql) no MySQL Workbench.
2. Use uma conexão de teste em que o esquema `db_sistema_faculdade` ainda não exista.
3. Execute o script completo. A consulta final deve retornar **Aluno Exemplo 01**, com nota **9,50** e situação **Aprovado** no primeiro semestre de 2025.

## Escopo da implementação

A estrutura relaciona os alunos a seus registros de curso, disciplina, turma e histórico. Também mantém o cadastro e os contatos de professores. O vínculo entre professores e turmas ou disciplinas é uma possível evolução do modelo.

## Apresentação

[Vídeo do projeto no LinkedIn](https://www.linkedin.com/feed/update/urn:li:ugcPost:7362498906812772352/)
