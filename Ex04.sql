    select case
             when n.nota < 8 then
              'NULL'
             else
              a.nome
           end as nome,
           n.nota,
           a.valor
      from alunos a
     inner join notas n
        on a.valor between n.valor_min and n.valor_max
     order by case
                when n.nota >= 8 then
                 n.nota
                else
                 a.valor * -1
              end desc,
              a.nome
