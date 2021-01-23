declare 
  function fn_TamanhoString(p_String varchar2) return number
  is
    i number := 0;
  begin
    while substr(p_String,i,1) is not null 
    loop
      i := i + 1;
    end loop;
    return i - 1;
  end fn_TamanhoString; 
begin
  dbms_output.put_line(fn_TamanhoString(p_String => :texto));
end;
