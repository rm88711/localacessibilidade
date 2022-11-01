create or replace procedure insere_estado(p_nm_estado    in varchar2
                                         ,p_sigla_estado in varchar2) is
begin
  --
  insert into t_estado (id_estado , nm_estado, nm_sigla_estado)
      values (sq_estado.nextval,p_nm_estado,p_sigla_estado);
  --
exception
  when others then
    raise_application_error(-20000, 'insere_estado: '||sqlerrm);
end insere_estado;
/

create or replace procedure insere_cidade(p_nm_cidade    in varchar2
                                         ,p_sigla_estado in varchar2) is
v_id_estado number;
begin
  --
  select t.id_estado
    into v_id_estado
    from t_estado t 
   where t.nm_sigla_estado = p_sigla_estado;
  --
  insert into t_cidade (id_cidade , id_estado, nm_cidade)
      values (SQ_CIDADE.nextval,v_id_estado,p_nm_cidade);
  --
exception
  when others then
    raise_application_error(-20000, 'insere_cidade: '||sqlerrm);
end insere_cidade;
/
