# frozen_string_literal: true

require 'pg'

def clean_table
  conn = PG.connect(dbname: 'bnb_test')
  conn.exec('TRUNCATE TABLE users CASCADE;')
  conn.exec('TRUNCATE TABLE spaces CASCADE;')
  conn.exec('TRUNCATE TABLE bookings;')
end
