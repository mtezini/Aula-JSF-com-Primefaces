CREATE TABLE mensagem
(
  men_codigo bigint NOT NULL,
  men_assunto character varying(80) NOT NULL,
  men_datahora timestamp without time zone,
  men_exigirresposta boolean,
  men_lido boolean NOT NULL,
  men_mensagem character varying(1000) NOT NULL,
  versionnum integer,
  usr_destino bigint,
  usr_origem bigint,
  CONSTRAINT mensagem_pkey PRIMARY KEY (men_codigo),
  CONSTRAINT usr_destino_fk FOREIGN KEY (usr_destino)
      REFERENCES entidade (ent_codigo) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT usr_origem_fk FOREIGN KEY (usr_origem)
      REFERENCES entidade (ent_codigo) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE mensagem
  OWNER TO postgres;
