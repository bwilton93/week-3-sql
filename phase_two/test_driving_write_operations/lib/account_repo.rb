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
end