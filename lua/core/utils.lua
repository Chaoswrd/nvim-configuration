function TableMerge(table1, table2)
  for k, v in pairs(table2) do
    table1[k] = v
  end
end
