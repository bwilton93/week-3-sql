require "account"

class AccountRepo
  def all
    accounts = []

    sql = "SELECT * FROM user_accounts;"
    records = DatabaseConnection.exec_params(sql, [])

    records.each do |record|
      account = Account.new
      account.id = record["id"]
      account.email_address = record["email_address"]
      account.username = record["username"]
      accounts << account
    end
    
    return accounts
  end
  
  def find(id)
    sql = "SELECT * FROM user_accounts WHERE id = $1;"
    result = DatabaseConnection.exec_params(sql, [id]).first

    account = Account.new
    account.id = result["id"]
    account.email_address = result["email_address"]
    account.username = result["username"]

    return account
  end

  def create
  end

  def delete
  end
end