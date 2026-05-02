-- =============================
-- LIMPAR (caso já exista)
-- =============================
DROP TABLE IF EXISTS voluntario CASCADE;
DROP TABLE IF EXISTS cronograma CASCADE;

-- =============================
-- TABELA CRONOGRAMA
-- =============================
CREATE TABLE cronograma (
  id SERIAL PRIMARY KEY,

  nome VARCHAR(150) NOT NULL,
  descricao TEXT NOT NULL,

  data_inicio DATE NOT NULL,
  data_fim DATE NOT NULL,

  meses JSONB DEFAULT '[]' -- armazena ["Jan","Fev",...]
);

-- =============================
-- TABELA VOLUNTARIO
-- =============================
CREATE TABLE voluntario (
  id SERIAL PRIMARY KEY,

  nome VARCHAR(150) NOT NULL,
  email VARCHAR(150),
  telefone VARCHAR(20),

  cpf VARCHAR(20),

  data_nascimento DATE,
  nacionalidade VARCHAR(100),

  estudante VARCHAR(10), -- "sim" ou "nao"
  curso VARCHAR(150),
  periodo VARCHAR(20),
  ra VARCHAR(50),

  endereco VARCHAR(200),
  cidade VARCHAR(100),
  estado VARCHAR(100),

  ativo BOOLEAN DEFAULT true, -- 🔥 IMPORTANTE

  cronograma_id INTEGER,

  CONSTRAINT fk_cronograma
    FOREIGN KEY (cronograma_id)
    REFERENCES cronograma(id)
    ON DELETE SET NULL
);

-- =============================
-- DADOS EXEMPLO (OPCIONAL)
-- =============================

INSERT INTO cronograma (nome, descricao, data_inicio, data_fim, meses)
VALUES 
(
  'Projeto Social 2026',
  'Atividades com a comunidade',
  '2026-01-01',
  '2026-12-31',
  '["Jan","Fev","Mar"]'
),
(
  'Evento Educacional',
  'Ações em escolas',
  '2026-03-01',
  '2026-08-30',
  '["Mar","Abr","Mai","Jun"]'
);

INSERT INTO voluntario (
  nome, email, telefone, cpf,
  data_nascimento, nacionalidade,
  estudante, curso, periodo, ra,
  endereco, cidade, estado,
  ativo, cronograma_id
)
VALUES
(
  'João Silva',
  'joao@email.com',
  '43999999999',
  '12345678900',
  '2000-05-10',
  'Brasileiro',
  'sim',
  'Engenharia de Software',
  '5',
  '123456',
  'Rua A, 123',
  'Cornélio Procópio',
  'PR',
  true,
  1
),
(
  'Maria Souza',
  'maria@email.com',
  '43988888888',
  '98765432100',
  '1998-08-20',
  'Brasileira',
  'nao',
  NULL,
  NULL,
  NULL,
  'Rua B, 456',
  'Londrina',
  'PR',
  false,
  2
);