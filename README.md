# 🎓 Sistema de Gestão de Atividades Complementares 

Banco de dados PostgreSQL desenvolvido para gerenciar o processo de submissão, validação e acompanhamento de atividades complementares acadêmicas.

O sistema controla alunos, coordenadores, cursos, regras por categoria, horas aprovadas, notificações e auditoria, garantindo integridade, rastreabilidade e organização institucional.

---

## Objetivo

Este banco de dados foi projetado para:

- Gerenciar usuários com múltiplos papéis (aluno, coordenador, administrador);
- Controlar cursos e carga horária mínima obrigatória;
- Permitir submissão de atividades complementares com anexos;
- Validar atividades e registrar horas aprovadas;
- Aplicar regras específicas por curso e categoria;
- Registrar notificações automáticas;
- Manter logs de auditoria para rastreabilidade;
- Fornecer views analíticas para dashboards e relatórios.

---

## Estrutura do Banco de Dados

### 👤 Usuários e Permissões

- `users`
- `roles`
- `user_roles`
- `student_profiles`
- `coordinator_profiles`

Permite controle de acesso baseado em papéis (RBAC) e separação entre identidade e perfil acadêmico.

---

### Cursos e Regras

- `courses`
- `categories`
- `course_activity_rules`
- `user_courses`
- `course_coordinators`

Define:

- Carga horária mínima obrigatória por curso
- Regras específicas por categoria
- Vínculo aluno × curso
- Vínculo coordenador × curso

---

### Submissões e Validações

- `submissions`
- `submission_files`
- `validations`

Funcionalidades:

- Registro de atividade complementar
- Upload de certificados
- Controle de horas solicitadas e aprovadas
- Histórico completo de validações

---

### Notificações e Auditoria

- `notifications`
- `audit_logs`

Permite:

- Comunicação com usuários
- Registro de ações realizadas no sistema
- Rastreabilidade de alterações

---

## Views Criadas

### `vw_submission_overview`

Exibe visão consolidada das submissões contendo:

- Nome do aluno
- Curso
- Categoria
- Horas solicitadas
- Horas aprovadas
- Status atual

Ideal para dashboards administrativos.

---

### `vw_student_progress`

Calcula:

- Total de horas aprovadas por aluno
- Percentual de progresso em relação à carga mínima do curso

Ideal para painel do aluno e acompanhamento acadêmico.

---

## Regras de Negócio

O banco aplica regras por meio de:

- ENUMs para controle de status
- Constraints de integridade referencial (FOREIGN KEY)
- Unique constraints para evitar duplicidades
- Índices estratégicos para performance
- Normalização até 3FN

Exemplos:

- Um usuário pode ter múltiplos papéis
- Cada curso possui regras específicas por categoria
- Uma submissão pode ter múltiplos arquivos
- Cada validação mantém histórico de decisão

---

## DER (Diagrama Entidade-Relacionamento)

O diagrama ER foi modelado utilizando Mermaid e representa:

- Estrutura relacional completa
- Cardinalidades
- Integridade referencial
- Organização modular do sistema

---

## Tecnologias Utilizadas

- PostgreSQL
- Mermaid (Diagrama ER)
- Git & GitHub

---

## Segurança e Integridade

- Controle de status via ENUM
- Integridade referencial com ON DELETE apropriado
- Índices para otimização de consultas
- Registro de auditoria
- Armazenamento seguro de senha com hash

---

## Finalidade

Projeto acadêmico desenvolvido para demonstrar:

- Modelagem relacional avançada
- Estrutura de sistema institucional real
- Controle de permissões baseado em papéis
- Organização profissional de banco de dados

---

## Possíveis Evoluções
- Procedures para consolidação de horas
- Dashboard analítico com BI
- Integração com sistema acadêmico externo
- Controle automático de encerramento de curso

---

🪴 Projeto de uso acadêmico. Livre para estudo e adaptação com os devidos créditos.
