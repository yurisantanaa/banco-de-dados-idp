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





