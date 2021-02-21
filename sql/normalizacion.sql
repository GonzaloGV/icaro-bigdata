-- Creamos las nuevas tablas
CREATE TABLE IF NOT EXISTS bebida 
	(id_bebida SERIAL PRIMARY KEY, 
	 nombre VARCHAR(100));
	 
INSERT INTO bebida (nombre)
	SELECT DISTINCT unnest(tipo_de_cafe)
	FROM tienda_de_cafe;

CREATE TABLE IF NOT EXISTS endulzante 
	(id_endulzante SERIAL PRIMARY KEY, 
	 nombre VARCHAR(100));
	 
INSERT INTO endulzante (nombre)
	SELECT DISTINCT unnest(endulzantes_usados)
	FROM tienda_de_cafe;

CREATE TABLE IF NOT EXISTS cajero 
	(id_cajero SERIAL PRIMARY KEY,
	 nombre VARCHAR(100));
	 
INSERT INTO cajero (nombre)
	SELECT DISTINCT nombre_cajero
	FROM tienda_de_cafe;

CREATE TABLE IF NOT EXISTS cliente 
	(id_cliente SERIAL PRIMARY KEY,
	 nombre VARCHAR(100));
	 
INSERT INTO cliente (nombre)
	SELECT DISTINCT nombre_cliente
	FROM tienda_de_cafe;

CREATE TABLE IF NOT EXISTS orden 
	(orden_id SERIAL PRIMARY KEY,
	 cliente_id integer REFERENCES cliente(id_cliente) NOT NULL,
	 cajero_id integer REFERENCES cajero(id_cajero) NOT NULL,
	 monto numeric);
	 
INSERT INTO orden (cliente_id, cajero_id, monto) 
VALUES (1, 2, 355), (3, 2, 300), (2, 1, 600);

CREATE TABLE IF NOT EXISTS item_endulzante 
	(item_endulzante_id SERIAL PRIMARY KEY,
	 orden_id integer REFERENCES orden(orden_id),
	 id_endulzante integer REFERENCES endulzante(id_endulzante));

INSERT INTO item_endulzante (orden_id, id_endulzante)
VALUES	(1, 1), (1, 4), (2, 4), (3, 2), (3, 3);

CREATE TABLE IF NOT EXISTS item_bebida 
	(item_bebida_id SERIAL PRIMARY KEY,
	 orden_id integer REFERENCES orden(orden_id),
	 id_bebida integer REFERENCES bebida(id_bebida));

INSERT INTO item_bebida (orden_id, id_bebida)
VALUES	(1, 4), (1, 5), (2, 1), (3, 2), (3, 3);





