/* Modelo_Logico_CMYK: */

CREATE TABLE Cliente (
    CPF_Cliente STRING PRIMARY KEY,
    Nome_Cliente STRING,
    Endereço_Cliente STRING,
    Complemento STRING,
    Cidade INT,
    Estado STRING,
    CEP_Cliente STRING,
    Telefone_Cliente STRING,
    Email_Cliente STRING,
    Data_Nasc DATE,
    RG_Cliente STRING,
    UNIQUE (CPF_Cliente, RG_Cliente)
);

CREATE TABLE Funcionario (
    Cod_Funcionario STRING PRIMARY KEY,
    CPF_Funcionario STRING,
    Nome_Funcionario STRING,
    Endereço_Funcionario STRING,
    Telefone_Funcionario STRING,
    Email_Funcionario STRING,
    Data_Nasc DATE,
    Funcao STRING,
    Login_Funcionario STRING,
    Senha_Funcionario PASSWORD,
    UNIQUE (Cod_Funcionario, CPF_Funcionario)
);

CREATE TABLE Produto (
    Cod_Produto INT PRIMARY KEY,
    Nome_Produto STRING,
    Descricao STRING,
    Gramatura FLOAT,
    Preco_Produto STRING,
    CNPJ_Fornecedor STRING UNIQUE
);

CREATE TABLE Admnistrador (
    CPF_Administrador STRING PRIMARY KEY UNIQUE,
    Nome_Administrador STRING,
    Endereço_Administrador STRING,
    Telefone_Administrador STRING,
    Email_Administrador STRING,
    Data_Nasc DATE,
    Login_Administrador STRING,
    Senha_Administrador PASSWORD
);

CREATE TABLE Transportadora (
    CNPJ_Transportadora STRING PRIMARY KEY UNIQUE,
    Nome_Transportadora STRING,
    Endereço_Transportadora STRING,
    Telefone_Transportadora INT,
    Email_Transportadora STRING,
    Taxa_Entrega FLOAT
);

CREATE TABLE Fornecedor (
    CNPJ_Fornecedor STRING PRIMARY KEY UNIQUE,
    Nome_Fornecedor STRING,
    Endereço_Fornecedor STRING,
    Telefone_Fornecedor INT,
    Email_Fornecedor STRING,
    Taxa_Entrega FLOAT
);

CREATE TABLE Pedido (
    Cod_Pedido INT PRIMARY KEY,
    Data_Pedido DATE,
    Forma_Envio BOOLEAN,
    CPF_Cliente STRING,
    Cod_Carrinho STRING,
    CNPJ_Transportadora STRING,
    Total FLOAT,
    UNIQUE (CPF_Cliente, Cod_Pedido, Cod_Carrinho, CNPJ_Transportadora)
);

CREATE TABLE Pagamento (
    Cod_Pagamento INT PRIMARY KEY,
    Data_Pagamento DATE,
    Forma_Pagamento STRING,
    Quant_Parcelas INT,
    Valor_Parcelas FLOAT,
    Cod_Pedido INT,
    UNIQUE (Cod_Pagamento, Cod_Pedido)
);

CREATE TABLE Rastreio (
    Cod_Rastreio INT PRIMARY KEY,
    CNPJ_Transportadora STRING,
    UNIQUE (Cod_Rastreio, CNPJ_Transportadora)
);

CREATE TABLE Carrinho_Compra (
    Cod_Carrinho STRING PRIMARY KEY,
    Quantidade INT,
    ValorUnit FLOAT,
    Cod_Produto INT,
    UNIQUE (Cod_Produto, Cod_Carrinho)
);

CREATE TABLE Historico_Pedidos (
    Cod_Pedido INT PRIMARY KEY,
    CPF_Cliente STRING,
    Cod_Produto INT,
    Cod_Pagamento INT,
    Cod_Rastreio INT,
    UNIQUE (Cod_Pedido, CPF_Cliente, Cod_Produto, Cod_Pagamento, Cod_Rastreio)
);
 
ALTER TABLE Produto ADD CONSTRAINT FK_Produto_2
    FOREIGN KEY (CNPJ_Fornecedor)
    REFERENCES Fornecedor (CNPJ_Fornecedor);
 
ALTER TABLE Pedido ADD CONSTRAINT FK_Pedido_3
    FOREIGN KEY (CPF_Cliente)
    REFERENCES Cliente (CPF_Cliente);
 
ALTER TABLE Pedido ADD CONSTRAINT FK_Pedido_4
    FOREIGN KEY (Cod_Carrinho)
    REFERENCES Carrinho_Compra (Cod_Carrinho);
 
ALTER TABLE Pedido ADD CONSTRAINT FK_Pedido_5
    FOREIGN KEY (CNPJ_Transportadora)
    REFERENCES Transportadora (CNPJ_Transportadora);
 
ALTER TABLE Pagamento ADD CONSTRAINT FK_Pagamento_2
    FOREIGN KEY (Cod_Pedido)
    REFERENCES Pedido (Cod_Pedido);
 
ALTER TABLE Rastreio ADD CONSTRAINT FK_Rastreio_2
    FOREIGN KEY (CNPJ_Transportadora)
    REFERENCES Transportadora (CNPJ_Transportadora);
 
ALTER TABLE Carrinho_Compra ADD CONSTRAINT FK_Carrinho_Compra_2
    FOREIGN KEY (Cod_Produto)
    REFERENCES Produto (Cod_Produto);
 
ALTER TABLE Historico_Pedidos ADD CONSTRAINT FK_Historico_Pedidos_3
    FOREIGN KEY (CPF_Cliente)
    REFERENCES Cliente (CPF_Cliente);
 
ALTER TABLE Historico_Pedidos ADD CONSTRAINT FK_Historico_Pedidos_4
    FOREIGN KEY (Cod_Pedido)
    REFERENCES Pedido (Cod_Pedido);
 
ALTER TABLE Historico_Pedidos ADD CONSTRAINT FK_Historico_Pedidos_5
    FOREIGN KEY (Cod_Produto)
    REFERENCES Produto (Cod_Produto);
 
ALTER TABLE Historico_Pedidos ADD CONSTRAINT FK_Historico_Pedidos_6
    FOREIGN KEY (Cod_Pagamento)
    REFERENCES Pagamento (Cod_Pagamento);
 
ALTER TABLE Historico_Pedidos ADD CONSTRAINT FK_Historico_Pedidos_7
    FOREIGN KEY (Cod_Rastreio)
    REFERENCES Rastreio (Cod_Rastreio);