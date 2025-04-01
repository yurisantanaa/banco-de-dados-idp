CREATE TABLE IF NOT EXISTS vaga(
  id_vaga INT AUTO_INCREMENT NOT NULL,
  status_vaga ENUM("livre","ocupada"),
  tipo_vaga ENUM("prioritaria","comum"),
  localizacao VARCHAR(10),
  PRIMARY KEY(id_vaga)
);

CREATE TABLE IF NOT EXISTS tarifa(
  id_tarifa INT AUTO_INCREMENT NOT NULL,
  tipo_tarifa INT,
  valor DECIMAL,
  PRIMARY KEY(id_tarifa)
);

CREATE TABLE IF NOT EXISTS metodo_pagamento(
  id_metodo_pagamento INT AUTO_INCREMENT NOT NULL,
  tipo_metodo INT,
  descricao VARCHAR(50),
  PRIMARY KEY(id_metodo_pagamento)
);

CREATE TABLE IF NOT EXISTS usuario(
  id_usuario INT AUTO_INCREMENT NOT NULL,
  nome VARCHAR(50),
  cpf VARCHAR(20),
  tipo_usuario INT,
  PRIMARY KEY(id_usuario)
);

CREATE TABLE IF NOT EXISTS cadastro_cartao(
  id_cartao INT AUTO_INCREMENT NOT NULL,
  id_usuario INT,
  numero_cartao VARCHAR(20),
  validade DATE,
  cvv VARCHAR(5),
  bandeira VARCHAR(10),
  is_isento BOOLEAN,
  id_metodo_pagamento INT,
  PRIMARY KEY(id_cartao),
  FOREIGN KEY (id_metodo_pagamento) REFERENCES metodo_pagamento(id_metodo_pagamento),
  FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE IF NOT EXISTS tag_estacionamento(
  id_tag INT AUTO_INCREMENT NOT NULL,
  id_usuario INT,
  id_veiculo INT,
  codigo_tag VARCHAR(20),
  ativo BOOLEAN,
  PRIMARY KEY(id_tag),
  FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario),
  FOREIGN KEY(id_veiculo) REFERENCES veiculo(id_veiculo)
);

CREATE TABLE IF NOT EXISTS reserva(
  id_reserva INT,
  id_usuario INT,
  id_vaga INT,
  data_reserva DATETIME,
  PRIMARY KEY(id_reserva),
  FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario),
  FOREIGN KEY(id_vaga) REFERENCES vaga(id_vaga)
);

CREATE TABLE IF NOT EXISTS veiculo(
  id_veiculo INT AUTO_INCREMENT NOT NULL,
  placa VARCHAR(10),
  modelo VARCHAR(20),
  cor VARCHAR(10),
  nome_proprietario VARCHAR(50),
  PRIMARY KEY(id_veiculo)
);

CREATE TABLE IF NOT EXISTS registro_entrada_saida(
  id_registro INT AUTO_INCREMENT NOT NULL,
  id_veiculo INT,
  id_vaga INT,
  id_usuario INT,
  id_tarifa INT,
  data_hora_entrada DATETIME,
  data_hora_saida DATETIME,
  tempo_permanencia INT,
  valor_pago DECIMAL,
  id_metodo_pagamento INT,

  PRIMARY KEY(id_registro),
  FOREIGN KEY(id_veiculo) REFERENCES veiculo(id_veiculo),
  FOREIGN KEY(id_vaga) REFERENCES vaga(id_vaga),
  FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario),
  FOREIGN KEY(id_tarifa) REFERENCES tarifa(id_tarifa),
  FOREIGN KEY(id_metodo_pagamento) REFERENCES metodo_pagamento(id_metodo_pagamento)
);

INSERT INTO metodo_pagamento (tipo_metodo, descricao) VALUES
(1, 'Cartão de Crédito'),
(2, 'Cartão de Débito'),
(3, 'PIX'),
(4, 'Dinheiro'),
(5, 'Tag Estacionamento');

INSERT INTO vaga (status_vaga, tipo_vaga, localizacao) VALUES
('livre', 'comum', 'A1'),
('livre', 'comum', 'A2'),
('ocupada', 'comum', 'A3'),
('livre', 'prioritaria', 'B1'),
('ocupada', 'prioritaria', 'B2'),
('livre', 'comum', 'C1'),
('livre', 'comum', 'C2'),
('ocupada', 'comum', 'C3'),
('livre', 'prioritaria', 'D1'),
('livre', 'prioritaria', 'D2');

INSERT INTO tarifa (tipo_tarifa, valor) VALUES
(1, 5.00),  -- Primeira hora
(2, 3.00),  -- Horas adicionais
(3, 10.00), -- Diária
(4, 2.50);  -- Meia hora

INSERT INTO usuario (nome, cpf, tipo_usuario) VALUES
('João Silva', '123.456.789-00', 1),
('Maria Souza', '987.654.321-00', 1),
('Carlos Oliveira', '456.789.123-00', 2),
('Ana Pereira', '789.123.456-00', 1),
('Pedro Santos', '321.654.987-00', 2),
('Lucia Ferreira', '654.987.321-00', 1),
('Marcos Rocha', '147.258.369-00', 1),
('Julia Almeida', '258.369.147-00', 1),
('Fernando Costa', '369.147.258-00', 2),
('Patricia Lima', '951.753.852-00', 1);

INSERT INTO veiculo (placa, modelo, cor, nome_proprietario) VALUES
('ABC1234', 'Gol', 'Branco', 'João Silva'),
('DEF5678', 'Onix', 'Prata', 'Maria Souza'),
('GHI9012', 'HB20', 'Preto', 'Carlos Oliveira'),
('JKL3456', 'Corolla', 'Vermelho', 'Ana Pereira'),
('MNO7890', 'Civic', 'Azul', 'Pedro Santos'),
('PQR1234', 'Fiesta', 'Verde', 'Lucia Ferreira'),
('STU5678', 'Palio', 'Cinza', 'Marcos Rocha'),
('VWX9012', 'Uno', 'Amarelo', 'Julia Almeida'),
('YZA3456', 'Sandero', 'Marrom', 'Fernando Costa'),
('BCD7890', 'Ka', 'Laranja', 'Patricia Lima');

INSERT INTO cadastro_cartao (id_usuario, numero_cartao, validade, cvv, bandeira, is_isento, id_metodo_pagamento) VALUES
(1, '1234567812345678', '2025-12-31', '123', 'Visa', FALSE, 1),
(2, '8765432187654321', '2024-10-31', '456', 'Master', FALSE, 1),
(3, '1122334455667788', '2026-05-31', '789', 'Elo', TRUE, 1),
(4, '4433221166558877', '2023-08-31', '321', 'Visa', FALSE, 1),
(5, '5566778899001122', '2025-03-31', '654', 'Master', TRUE, 1),
(6, '9988776655443322', '2024-07-31', '987', 'Hiper', FALSE, 1),
(7, '6677889900112233', '2026-01-31', '159', 'Visa', FALSE, 1),
(8, '3344556677889900', '2025-09-30', '357', 'Master', FALSE, 1),
(9, '2233445566778899', '2024-11-30', '753', 'Elo', TRUE, 1),
(10, '7788990011223344', '2026-02-28', '951', 'Visa', FALSE, 1);

INSERT INTO tag_estacionamento (id_usuario, id_veiculo, codigo_tag, ativo) VALUES
(1, 1, 'TAG001', TRUE),
(2, 2, 'TAG002', TRUE),
(3, 3, 'TAG003', FALSE),
(4, 4, 'TAG004', TRUE),
(5, 5, 'TAG005', FALSE),
(6, 6, 'TAG006', TRUE),
(7, 7, 'TAG007', TRUE),
(8, 8, 'TAG008', FALSE),
(9, 9, 'TAG009', TRUE),
(10, 10, 'TAG010', TRUE);

INSERT INTO reserva (id_reserva, id_usuario, id_vaga, data_reserva) VALUES
(1, 1, 1, '2023-06-01 08:00:00'),
(2, 2, 4, '2023-06-01 09:30:00'),
(3, 3, 5, '2023-06-02 10:15:00'),
(4, 4, 7, '2023-06-02 11:45:00'),
(5, 5, 9, '2023-06-03 13:00:00'),
(6, 6, 2, '2023-06-03 14:30:00'),
(7, 7, 3, '2023-06-04 15:45:00'),
(8, 8, 6, '2023-06-04 16:20:00'),
(9, 9, 8, '2023-06-05 17:10:00'),
(10, 10, 10, '2023-06-05 18:00:00');

INSERT INTO registro_entrada_saida (id_veiculo, id_vaga, id_usuario, id_tarifa, data_hora_entrada, data_hora_saida, tempo_permanencia, valor_pago, id_metodo_pagamento) VALUES
(1, 1, 1, 1, '2023-06-01 08:15:00', '2023-06-01 09:15:00', 60, 5.00, 1),
(2, 4, 2, 2, '2023-06-01 09:45:00', '2023-06-01 12:45:00', 180, 11.00, 2),
(3, 5, 3, 3, '2023-06-02 10:30:00', '2023-06-02 18:30:00', 480, 10.00, 5),
(4, 7, 4, 4, '2023-06-02 12:00:00', '2023-06-02 12:30:00', 30, 2.50, 3),
(5, 9, 5, 1, '2023-06-03 13:15:00', '2023-06-03 14:15:00', 60, 5.00, 1),
(6, 2, 6, 2, '2023-06-03 14:45:00', '2023-06-03 17:45:00', 180, 11.00, 2),
(7, 3, 7, 3, '2023-06-04 16:00:00', '2023-06-05 08:00:00', 960, 10.00, 5),
(8, 6, 8, 4, '2023-06-04 16:35:00', '2023-06-04 17:05:00', 30, 2.50, 3),
(9, 8, 9, 1, '2023-06-05 17:25:00', '2023-06-05 18:25:00', 60, 5.00, 1),
(10, 10, 10, 2, '2023-06-05 18:15:00', '2023-06-05 21:15:00', 180, 11.00, 2);


SELECT nome FROM usuario a
INNER JOIN tag_estacionamento b ON a.id_usuario = b.id_usuario
WHERE b.ativo = TRUE;

SELECT nome FROM usuario a
WHERE a.id_usuario IN(SELECT id_usuario FROM reserva)
AND a.id_usuario NOT IN(SELECT id_usuario FROM tag_estacionamento);

SELECT a.id_usuario from usuario a
JOIN tag_estacionamento b ON a.id_usuario = b.id_usuario
JOIN cadastro_cartao c ON c.id_usuario = a.id_usuario
WHERE b.ativo = TRUE
AND c.bandeira = 'VISA';

SELECT a.id_usuario from usuario a
JOIN tag_estacionamento b ON a.id_usuario = b.id_usuario
WHERE b.ativo = FALSE;

SELECT * FROM cadastro_cartao a
WHERE a.bandeira = 'VISA'

SELECT a.nome from usuario a
JOIN tag_estacionamento b ON a.id_usuario = b.id_usuario
JOIN cadastro_cartao c ON c.id_usuario = a.id_usuario
WHERE b.ativo = TRUE





