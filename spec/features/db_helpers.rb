def clear_test_table
  con = PG.connect dbname: 'bnb_test'
  con.exec("TRUNCATE TABLE users;")
end