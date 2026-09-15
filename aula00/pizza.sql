CREATE TABLE Pizzas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    sabor TEXT NOT NULL UNIQUE,
    ingredientes TEXT,
    valor REAL CHECK (valor > 0)
);

CREATE TABLE Pedidos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cliente_id INTEGER NOT NULL,
    data_hora TEXT NOT NULL,
    status TEXT NOT NULL DEFAULT 'Em preparo',
    valor_total REAL,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
);

CREATE TABLE Clientes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    telefone TEXT,
    endereco TEXT
);

INSERT INTO Clientes (nome, telefone, endereco) VALUES
('Maria Silva', '(11) 98765-4321', 'Rua das Flores, 123'),
('João Pereira', '(11) 91234-5678', 'Av. Brasil, 456');
 
INSERT INTO Pizzas (sabor, ingredientes, valor) VALUES
('Margherita', 'Molho de tomate, mussarela, manjericão', 39.90),
('Calabresa', 'Molho de tomate, mussarela, calabresa, cebola', 42.90),
('Quatro Queijos', 'Mussarela, provolone, parmesão, gorgonzola', 47.90),
('Frango com Catupiry', 'Molho de tomate, mussarela, frango desfiado, catupiry', 44.90);
 
INSERT INTO Pedidos (cliente_id, data_hora, status, valor_total) VALUES
(1, '2026-09-09T19:30:00', 'Em preparo', 39.90),
(2, '2026-09-09T20:15:00', 'Entregue', 87.80);

SELECT * FROM Pedidos;
SELECT * FROM clientes;
SELECT * from pizzas;

-- Faça uma consulta, que mostre os pedidos com o nome do cliente
SELECT * 
FROM Pedidos
JOIN clientes on Pedidos.cliente_id = clientes_id;