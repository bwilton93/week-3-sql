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

  describe "#all" do
    it "returns all records from the accounts table" do
      repo = AccountRepo.new
      accounts = repo.all
      
      expect(accounts.length).to eq 2
      expect(accounts.first.id).to eq "1"
      expect(accounts.first.email_address).to eq "Email 1"
      expect(accounts.first.username).to eq "User 1"

      expect(accounts.last.id).to eq "2"
      expect(accounts.last.email_address).to eq "Email 2"
      expect(accounts.last.username).to eq "User 2"
    end
  end

end