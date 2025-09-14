CREATE SCHEMA Desafio_Final;
USE Desafio_Final;

CREATE TABLE CLIENTE (
    CPF CHAR(11) PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Endereco VARCHAR(50),
    Telefone VARCHAR(15),
    Email VARCHAR(50),
    Nacionalidade VARCHAR(50)
);

CREATE TABLE FUNCIONARIO (
    ID_Funcionario INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50),
    CPF CHAR(11),
    Numero_CTPS VARCHAR(20),
    Endereco VARCHAR(50),
    Nacionalidade VARCHAR(50),
    FOREIGN KEY (CPF) REFERENCES CLIENTE(CPF)
);

CREATE TABLE VEICULO (
    PLACA CHAR(8) PRIMARY KEY,
    Modelo VARCHAR(50),
    Cor VARCHAR(20),
    Ano_Fabricacao INT,
    Valor_Diaria FLOAT,
    Status_Veiculo VARCHAR(20)
);

CREATE TABLE ALUGUEL (
    ID_Aluguel INT AUTO_INCREMENT PRIMARY KEY,
    Data_Inicio DATE,
    Data_Fim DATE,
    Status_Aluguel VARCHAR(20),
    Carro_Selecionado VARCHAR(50),
    Valor_Total FLOAT,
    ID_Funcionario INT,
    PLACA CHAR(8),
    CPF_Cliente CHAR(11),
    FOREIGN KEY (ID_Funcionario) REFERENCES FUNCIONARIO(ID_Funcionario),
    FOREIGN KEY (PLACA) REFERENCES VEICULO(PLACA),
    FOREIGN KEY (CPF_Cliente) REFERENCES CLIENTE(CPF)
);

CREATE TABLE PAGAMENTO (
    ID_Pagamento INT AUTO_INCREMENT PRIMARY KEY,
    Valor FLOAT,
    Data DATE,
    Metodo VARCHAR(50),
    Status_Pagamento VARCHAR(20),
    Referencia VARCHAR(50),
    ID_Aluguel INT,
    FOREIGN KEY (ID_Aluguel) REFERENCES ALUGUEL(ID_Aluguel)
);

CREATE TABLE MANUTENCAO (
    ID_Manutencao INT AUTO_INCREMENT PRIMARY KEY,
    Custo FLOAT,
    Data DATE,
    Descricao_Servico VARCHAR(100),
    Responsavel_Manutencao VARCHAR(50),
    Tipo_Manutencao VARCHAR(50),
    Status_Manutencao VARCHAR(20),
    ID_Funcionario INT,
    PLACA CHAR(8),
    FOREIGN KEY (ID_Funcionario) REFERENCES FUNCIONARIO(ID_Funcionario),
    FOREIGN KEY (PLACA) REFERENCES VEICULO(PLACA)
);



INSERT INTO CLIENTE (CPF, Nome, Endereco, Telefone, Email, Nacionalidade) VALUES ('11111111111', 'Ana Souza', 'Rua das Flores, 101', '11987654321', 'ana.souza@email.com', 'Brasileira'), ('22222222222', 'Bruno Lima', 'Avenida Paulista, 202', '11998765432', 'bruno.lima@email.com', 'Brasileiro'), ('33333333333', 'Carlos Ferreira', 'Rua do Comércio, 303', '11976543210', 'carlos.f@email.com', 'Português'), ('44444444444', 'Diana Rocha', 'Rua da Consolação, 404', '11965432109', 'diana.r@email.com', 'Brasileira'), ('55555555555', 'Eduardo Costa', 'Avenida Ipiranga, 505', '11954321098', 'eduardo.c@email.com', 'Argentino'), ('66666666666', 'Fernanda Mendes', 'Rua Augusta, 606', '11943210987', 'fernanda.m@email.com', 'Brasileira'), ('77777777777', 'Gabriel Alves', 'Rua Oscar Freire, 707', '11932109876', 'gabriel.a@email.com', 'Brasileiro'), ('88888888888', 'Helena Gomes', 'Rua da Sé, 808', '11921098765', 'helena.g@email.com', 'Brasileira'), ('99999999999', 'Igor Santos', 'Avenida Brigadeiro, 909', '11910987654', 'igor.s@email.com', 'Alemão'), ('00000000000', 'Julia Pereira', 'Rua Pamplona, 1010', '11909876543', 'julia.p@email.com', 'Brasileira');

INSERT INTO FUNCIONARIO (Nome, CPF, Numero_CTPS, Endereco, Nacionalidade) VALUES ('Pedro Henrique', '11111111111', '12345678', 'Rua A, 1', 'Brasileiro'), ('Larissa Fernanda', '22222222222', '23456789', 'Rua B, 2', 'Brasileira'), ('Gustavo Oliveira', '33333333333', '34567890', 'Rua C, 3', 'Brasileiro'), ('Sofia Santos', '44444444444', '45678901', 'Rua D, 4', 'Brasileira'), ('Felipe Silva', '55555555555', '56789012', 'Rua E, 5', 'Brasileiro'), ('Camila Rodrigues', '66666666666', '67890123', 'Rua F, 6', 'Brasileira'), ('André Almeida', '77777777777', '78901234', 'Rua G, 7', 'Brasileiro'), ('Mariana Lima', '88888888888', '89012345', 'Rua H, 8', 'Brasileira'), ('Rafael Martins', '99999999999', '90123456', 'Rua I, 9', 'Brasileiro'), ('Beatriz Costa', '00000000000', '01234567', 'Rua J, 10', 'Brasileira');

INSERT INTO VEICULO (PLACA, Modelo, Cor, Ano_Fabricacao, Valor_Diaria, Status_Veiculo) VALUES ('ABC-1234', 'Ford Ka', 'Branco', 2021, 80.00, 'Disponível'), ('DEF-5678', 'VW Gol', 'Prata', 2020, 75.00, 'Em Manutenção'), ('GHI-9012', 'Fiat Uno', 'Vermelho', 2022, 90.00, 'Disponível'), ('JKL-3456', 'Chevrolet Onix', 'Preto', 2023, 100.00, 'Disponível'), ('MNO-7890', 'Toyota Corolla', 'Cinza', 2021, 150.00, 'Alugado'), ('PQR-1357', 'Honda Civic', 'Azul', 2022, 160.00, 'Disponível'), ('STU-2468', 'Hyundai HB20', 'Branco', 2020, 85.00, 'Alugado'), ('VWX-9753', 'Renault Kwid', 'Verde', 2023, 70.00, 'Disponível'), ('YZA-8642', 'Jeep Renegade', 'Laranja', 2022, 180.00, 'Alugado'), ('BCD-7531', 'Nissan Kicks', 'Preto', 2021, 130.00, 'Disponível');

INSERT INTO ALUGUEL (Data_Inicio, Data_Fim, Status_Aluguel, Carro_Selecionado, Valor_Total, ID_Funcionario, PLACA, CPF_Cliente) VALUES ('2024-05-01', '2024-05-05', 'Concluído', 'Ford Ka', 400.00, 1, 'ABC-1234', '11111111111'), ('2024-05-02', '2024-05-06', 'Concluído', 'VW Gol', 300.00, 2, 'DEF-5678', '22222222222'), ('2024-05-03', '2024-05-08', 'Em andamento', 'Fiat Uno', 450.00, 3, 'GHI-9012', '33333333333'), ('2024-05-04', '2024-05-09', 'Em andamento', 'Chevrolet Onix', 500.00, 4, 'JKL-3456', '44444444444'), ('2024-05-05', '2024-05-10', 'Concluído', 'Toyota Corolla', 750.00, 5, 'MNO-7890', '55555555555'), ('2024-05-06', '2024-05-11', 'Em andamento', 'Honda Civic', 800.00, 6, 'PQR-1357', '66666666666'), ('2024-05-07', '2024-05-12', 'Concluído', 'Hyundai HB20', 425.00, 7, 'STU-2468', '77777777777'), ('2024-05-08', '2024-05-13', 'Em andamento', 'Renault Kwid', 350.00, 8, 'VWX-9753', '88888888888'), ('2024-05-09', '2024-05-14', 'Concluído', 'Jeep Renegade', 900.00, 9, 'YZA-8642', '99999999999'), ('2024-05-10', '2024-05-15', 'Em andamento', 'Nissan Kicks', 650.00, 10, 'BCD-7531', '00000000000');

INSERT INTO PAGAMENTO (Valor, Data, Metodo, Status_Pagamento, Referencia, ID_Aluguel) VALUES (400.00, '2024-05-05', 'Cartão de Crédito', 'Pago', 'REF001', 1), (300.00, '2024-05-06', 'Pix', 'Pago', 'REF002', 2), (450.00, '2024-05-08', 'Dinheiro', 'Pendente', 'REF003', 3), (500.00, '2024-05-09', 'Cartão de Débito', 'Pago', 'REF004', 4), (750.00, '2024-05-10', 'Boleto', 'Pago', 'REF005', 5), (800.00, '2024-05-11', 'Pix', 'Pendente', 'REF006', 6), (425.00, '2024-05-12', 'Cartão de Crédito', 'Pago', 'REF007', 7), (350.00, '2024-05-13', 'Dinheiro', 'Pendente', 'REF008', 8), (900.00, '2024-05-14', 'Boleto', 'Pago', 'REF009', 9), (650.00, '2024-05-15', 'Cartão de Crédito', 'Pendente', 'REF010', 10);

INSERT INTO MANUTENCAO (Custo, Data, Descricao_Servico, Responsavel_Manutencao, Tipo_Manutencao, Status_Manutencao, ID_Funcionario, PLACA) VALUES (200.00, '2024-04-25', 'Troca de óleo', 'Mecânico A', 'Preventiva', 'Concluída', 1, 'ABC-1234'), (50.00, '2024-04-26', 'Conserto de pneu', 'Mecânico B', 'Corretiva', 'Concluída', 2, 'DEF-5678'), (300.00, '2024-04-27', 'Revisão geral', 'Mecânico C', 'Preventiva', 'Concluída', 3, 'GHI-9012'), (150.00, '2024-04-28', 'Alinhamento e balanceamento', 'Mecânico D', 'Corretiva', 'Concluída', 4, 'JKL-3456'), (450.00, '2024-04-29', 'Revisão de freios', 'Mecânico E', 'Preventiva', 'Concluída', 5, 'MNO-7890'), (250.00, '2024-04-30', 'Troca de bateria', 'Mecânico F', 'Corretiva', 'Concluída', 6, 'PQR-1357'), (100.00, '2024-05-01', 'Lavagem e polimento', 'Mecânico G', 'Estética', 'Concluída', 7, 'STU-2468'), (350.00, '2024-05-02', 'Troca de velas', 'Mecânico H', 'Preventiva', 'Concluída', 8, 'VWX-9753'), (600.00, '2024-05-03', 'Reparo de suspensão', 'Mecânico I', 'Corretiva', 'Concluída', 9, 'YZA-8642'), (400.00, '2024-05-04', 'Revisão de motor', 'Mecânico J', 'Preventiva', 'Concluída', 10, 'BCD-7531');



SELECT Nacionalidade, COUNT(*) AS TotalClientes FROM CLIENTE GROUP BY Nacionalidade;
SELECT AVG(ID_Funcionario) AS MediaID, MAX(ID_Funcionario) AS MaximoID, MIN(ID_Funcionario) AS MinimoID FROM FUNCIONARIO;
SELECT Status_Veiculo, COUNT(*) AS TotalVeiculos FROM VEICULO GROUP BY Status_Veiculo;
SELECT SUM(Valor_Total) AS SomaTotalAlugueis FROM ALUGUEL;
SELECT Metodo, AVG(Valor) AS ValorMedioPagamento FROM PAGAMENTO GROUP BY Metodo;
SELECT Tipo_Manutencao, COUNT(*) AS TotalManutencoes FROM MANUTENCAO GROUP BY Tipo_Manutencao;


SELECT c.Nome, a.PLACA FROM CLIENTE AS c INNER JOIN ALUGUEL AS a ON c.CPF = a.CPF_Cliente WHERE a.Status_Aluguel = 'Concluído';
SELECT v.PLACA, v.Modelo, m.Descricao_Servico FROM VEICULO AS v LEFT JOIN MANUTENCAO AS m ON v.PLACA = m.PLACA;
