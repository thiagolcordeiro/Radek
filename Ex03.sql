declare
  s varchar2(100) := :s;
  t varchar2(100) := :t; 
  k number(3)     := :k;
  
  v_PosIgual number(3) := 0;

  function fn_VerificaStringInput(p_String varchar2) return boolean
  is
  begin
    if length(p_String) between 1 and 100 and length(p_String) = REGEXP_COUNT(p_String, '[a-z]') then
      return true;
    else
      raise_application_error(-20010,'String.: '''|| p_String || ''' inválida! O tamanho deve ser de 1 à 100 caracteres e ser composta por letras de a à z, minúsculas.');
    end if;    
  end fn_VerificaStringInput;

  function fn_VerificaQTMovimentosInput(p_Movimentos number) return boolean
  is
  begin
    if p_Movimentos is not null and p_Movimentos between 1 and 100 then
      return true;
    else
      raise_application_error(-20020,'Nrº de Movimentos.: '|| k || ' inválido! Deve ser maior ou igual a 1 e menor ou igual a 100.');
    end if;    
  end fn_VerificaQTMovimentosInput;
   
begin
  if fn_VerificaStringInput(p_String => s) and fn_VerificaStringInput(p_String => t) and fn_VerificaQTMovimentosInput(p_Movimentos => k) then
    if abs(length(s) - length(t)) > k then
      dbms_output.put_line('não');
    else
      declare
        i number := 0;
      begin
        while substr(s,i,1) = substr(t,i,1)
        loop
          i := i + 1;
        end loop;
        v_PosIgual := i - 1;
      end; 
      
      if length(s)- v_PosIgual + length(t) - v_PosIgual > k then
        dbms_output.put_line('não');
      else
        dbms_output.put_line('sim');
      end if;           
    end if;  
  end if;  
end;
