begin
  for i in 1..100 loop
    if mod(i,15) = 0 then
      dbms_output.put_line('FooBaa');
    elsif mod(i,3) = 0 then
      dbms_output.put_line('Foo') ;
    elsif mod(i,5) = 0 then
      dbms_output.put_line('Baa');
    else
      dbms_output.put_line(i);
    end if;   
  end loop; 
end;
