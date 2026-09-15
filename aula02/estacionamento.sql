PRAGMA FOREIGN_KEYS = ON;
-- CRIAÇÃO DE TABELAS
CREATE TABLE IF NOT EXISTS Clientes
(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    cpf TEXT NOT NULL UNIQUE,
    telefone TEXT
);
 
CREATE TABLE IF NOT EXISTS Veiculos
(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cliente_id INTEGER NOT NULL,
    placa TEXT NOT NULL UNIQUE,
    modelo TEXT NOT NULL,
    cor TEXT,
    FOREIGN KEY (cliente_id) REFERENCES Clientes (id)
);
 
-- INSERÇÃO DE DADOS
 
INSERT INTO Clientes (nome, cpf, telefone) VALUES
('Ana Souza',      '111.111.111-11', '(11) 91111-1111'),
('Bruno Lima',     '222.222.222-22', '(11) 92222-2222'),
('Carla Mendes',   '333.333.333-33', '(11) 93333-3333'),
('Diego Alves',    '444.444.444-44', NULL);
 
INSERT INTO Veiculos (cliente_id, placa, modelo, cor) VALUES
(1, 'ABC1D23', 'Fiat Uno',         'Branco'),
(1, 'XYZ9K88', 'Honda Civic',      'Preto'),
(2, 'JKL4M56', 'VW Gol',           'Prata'),
(3, 'QWE7R89', 'Toyota Corolla',   'Cinza');
 
-- CONSULTA DE DADOS
 
SELECT * FROM Clientes;
 
SELECT * FROM Veiculos;
 
SELECT
    v.placa,
    v.modelo,
    v.cor,
    c.nome AS dono,
    c.telefone
FROM Veiculos v
JOIN Clientes c ON v.cliente_id = c.id;
 
SELECT
    c.nome,
    COUNT(v.id) AS qtd_veiculos
FROM Clientes c
LEFT JOIN Veiculos v ON v.cliente_id = c.id
GROUP BY c.id, c.nome;
 
SELECT c.nome
FROM Clientes c
LEFT JOIN Veiculos v ON v.cliente_id = c.id
WHERE v.id IS NULL;
 
SELECT * FROM Veiculos WHERE placa = 'ABC1D23';