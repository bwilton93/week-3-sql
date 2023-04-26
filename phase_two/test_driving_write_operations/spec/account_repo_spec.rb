require 'account_repo'
require 'account'

def reset_tables
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
  connection.exec(seed_sql)
end
  
describe AccountRepo do
  before(:each) do 
    reset_tables
  end

end