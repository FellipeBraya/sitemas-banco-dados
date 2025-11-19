CREATE TABLE produto (
    produto_id INT PRIMARY KEY, 
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);

CREATE TABLE cliente (
    cliente_id INT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    identificador VARCHAR(20) UNIQUE
);

CREATE TABLE pedido (
    pedido_id INT PRIMARY KEY,
    cliente_id INT NOT NULL,
    data_pedido DATE NOT NULL,
    total_calculado DECIMAL(10,2),
    FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id)
);

CREATE TABLE pedido_item (
    pedido_item_id INT PRIMARY KEY,
    pedido_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedido(pedido_id),
    FOREIGN KEY (produto_id) REFERENCES produto(produto_id)
);

INSERT INTO produto (produto_id, nome, preco) VALUES
(1, 'Camiseta', 49.90),
(2, 'Caneca', 25.00),
(3, 'Caderno', 12.50),
(4, 'Mouse', 89.90),
(5, 'Teclado', 129.90),
(6, 'Fone', 79.90);

INSERT INTO cliente (cliente_id, nome, email, identificador) VALUES
(1, 'Ana Silva', 'ana@example.com', '2025001'),
(2, 'Bruno Costa', 'bruno@example.com', '2025002'),
(3, 'Carla Souza', 'carla@example.com', '2025003'),
(4, 'Daniel Reis', 'daniel@example.com', '2025004'),
(5, 'Elisa Moraes', 'elisa@example.com', '2025005');

INSERT INTO pedido (pedido_id, cliente_id, data_pedido, total_calculado) VALUES
(1, 1, '2025-10-01', 74.90),
(2, 2, '2025-10-03', 89.90),
(3, 3, '2025-09-30', 75.00),
(4, 1, '2025-10-05', 79.90),
(5, 4, '2025-10-02', 129.90),
(6, 5, '2025-09-29', 50.00),
(7, 2, '2025-10-06', 49.90),
(8, 3, '2025-10-07', 179.80);

INSERT INTO pedido_item (pedido_item_id, pedido_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1, 1, 1, 49.90),
(2, 1, 2, 1, 25.00),
(3, 2, 4, 1, 89.90),
(4, 3, 2, 3, 25.00),
(5, 4, 6, 1, 79.90),
(6, 5, 5, 1, 129.90),
(7, 6, 3, 4, 12.50),
(8, 7, 1, 1, 49.90),
(9, 8, 5, 1, 129.90),
(10, 8, 1, 1, 49.90);
