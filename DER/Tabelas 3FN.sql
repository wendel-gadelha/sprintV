CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    senha VARCHAR(100),
    endereco VARCHAR(200)
);

CREATE TABLE Fornecedores (
    id_fornecedor INT PRIMARY KEY,
    nome VARCHAR(100),
    contato VARCHAR(100),
    endereco VARCHAR(200)
);

CREATE TABLE Produtos (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    preco DECIMAL(10, 2),
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedores(id_fornecedor)
);

CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY,
    id_usuario INT,
    id_produto INT,
    data_pedido DATE,
    quantidade INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);

-- Inserção de dados na tabela Usuarios
INSERT INTO Usuarios (id_usuario, nome, email, senha, endereco)
VALUES
    (1, 'João Silva', 'joao@example.com', 'senha123', 'Rua A, 123'),
    (2, 'Maria Souza', 'maria@example.com', 'senha456', 'Av. B, 456');

-- Inserção de dados na tabela Fornecedores
INSERT INTO Fornecedores (id_fornecedor, nome, contato, endereco)
VALUES
    (1, 'Fornecedor A', 'Fulano de Tal', 'Rua X, 789'),
    (2, 'Fornecedor B', 'Beltrano da Silva', 'Av. Y, 321');

-- Inserção de dados na tabela Produtos
INSERT INTO Produtos (id_produto, nome, descricao, preco, id_fornecedor)
VALUES
    (1, 'Produto 1', 'Descrição do Produto 1', 50.00, 1),
    (2, 'Produto 2', 'Descrição do Produto 2', 75.00, 2),
    (3, 'Produto 3', 'Descrição do Produto 3', 30.00, 1);

-- Inserção de dados na tabela Pedidos
INSERT INTO Pedidos (id_pedido, id_usuario, id_produto, data_pedido, quantidade)
VALUES
    (1, 1, 1, '2024-06-20', 2),
    (2, 1, 2, '2024-06-21', 1),
    (3, 2, 3, '2024-06-22', 3);



/*Listar todos os produtos e seus respectivos fornecedores*/
SELECT Produtos.nome AS Produto, Fornecedores.nome AS Fornecedor
FROM Produtos
JOIN Fornecedores ON Produtos.id_fornecedor = Fornecedores.id_fornecedor;


/*Listar todos os pedidos realizados por um determinado usuário*/
SELECT Pedidos.id_pedido, Produtos.nome AS Produto, Pedidos.data_pedido, Pedidos.quantidade
FROM Pedidos
JOIN Produtos ON Pedidos.id_produto = Produtos.id_produto
WHERE Pedidos.id_usuario = 1; -- Substitua 1 pelo id_usuario desejado

/*Obter o total de vendas por produto*/
SELECT Produtos.nome AS Produto, SUM(Pedidos.quantidade) AS Total_Vendas
FROM Pedidos
JOIN Produtos ON Pedidos.id_produto = Produtos.id_produto
GROUP BY Produtos.nome;


