create or replace trigger tg_log_acessibilidade_local
before insert or update or delete on T_ACESSIBILIDADE_LOCAL
for each row
declare
v_tp_operacao varchar2(30);
begin
 
  if deleting then
    v_tp_operacao := 'DELETE';
  elsif updating then
    v_tp_operacao := 'UPDATE';
  elsif inserting then
    v_tp_operacao := 'INSERT';
  end if;

 insert into t_log_acessibilidade_local(id_log                       , nm_tp_operacao,id_local_old ,id_acessibilidade_old,id_local_new,id_acessibilidade_new,nm_usuario_operacao, dt_data_operacao)
                           values(sq_log_acessibilidade_local.nextval,v_tp_operacao  ,:old.id_local , :old.id_acessibilidade , :new.id_local ,:new.id_acessibilidade,user,sysdate);
exception
  when others then
    raise_application_error(-20000, 'tg_log_acessibilidade_local: '||sqlerrm);
end tg_log_acessibilidade_local;
/

exec insere_acesso(p_acesso => 'GUIA PARA CEGOS');
exec insere_acesso(p_acesso => 'AJUDANTE PARA COMPRAS');
--
exec insere_local_acessibilidade('SP','barueri','TAmboré','Avenida Esbertalina Barbosa Damiani','shopping tambore','GUIA PARA CEGOS');
exec insere_local_acessibilidade('SP','barueri','TAmboré','Avenida Esbertalina Barbosa Damiani','shopping tambore','AJUDANTE PARA COMPRAS');
--
update T_ACESSIBILIDADE_LOCAL ac
  set ac.id_local           = (select lo.id_local from t_local lo where lo.nm_local = upper('shopping tambore'))
 where ac.id_acessibilidade = (select a.id_acessibilidade from T_ACESSIBILIDADE a where a.tp_acessibilidade = upper('GUIA PARA CEGOS'));
--
update T_ACESSIBILIDADE_LOCAL ac
  set ac.id_local           = (select lo.id_local from t_local lo where lo.nm_local = upper('teatro vila lobos'))
 where ac.id_acessibilidade = (select a.id_acessibilidade from T_ACESSIBILIDADE a where a.tp_acessibilidade = upper('AJUDANTE PARA COMPRAS'));
--
delete T_ACESSIBILIDADE_LOCAL ac
 where ac.id_acessibilidade = (select a.id_acessibilidade from T_ACESSIBILIDADE a where a.tp_acessibilidade = upper('GUIA PARA CEGOS'))
   and ac.id_local           = (select lo.id_local from t_local lo where lo.nm_local = upper('shopping tambore'));
--
delete T_ACESSIBILIDADE_LOCAL ac
 where ac.id_acessibilidade = (select a.id_acessibilidade from T_ACESSIBILIDADE a where a.tp_acessibilidade = upper('AJUDANTE PARA COMPRAS'))
   and ac.id_local           = (select lo.id_local from t_local lo where lo.nm_local = upper('teatro vila lobos'));

commit;