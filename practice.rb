# Cryptocurrency is all the rage. You have decided to create your own,
# KelloggCoin, that will massively disrupt financial markets at the Global
# Hub.

# Don't change the following code, which represents a series of transactions, each
# of which represents a transfer of KelloggCoin from one user to another – transactions 
# with no from_user are from the "ICO" (Initial Coin Offering)

blockchain = [
  { "from_user" => nil, "to_user" => "ben", "amount" => 20000 },
  { "from_user" => nil, "to_user" => "brian", "amount" => 20000 },
  { "from_user" => "ben", "to_user" => "evan", "amount" => 9000 },
  { "from_user" => "brian", "to_user" => "anthony", "amount" => 7000 },
  { "from_user" => "evan", "to_user" => "anthony", "amount" => 400 },
  { "from_user" => "ben", "to_user" => "anthony", "amount" => 1500 },
  { "from_user" => "anthony", "to_user" => "ben", "amount" => 4500 },
  { "from_user" => "anthony", "to_user" => "evan", "amount" => 1750 }
]

# Write code below that returns the number of KelloggCoin that each user has in their 
# KelloggCoin "wallet".

# It should print out:
# Ben's KelloggCoin balance is 14000
# Brian's KelloggCoin balance is 13000
# Evan's KelloggCoin balance is 10350
# Anthony's KelloggCoin balance is 2650

# 👇👇👇 Your code HERE 👇👇👇

# Code to dynamically obtain the name of the users involved in transaction. 
index = 0
users = []
loop do
  if index == blockchain.length
    break
  end
  users.push(blockchain[index]["to_user"])
  users.push(blockchain[index]["from_user"])
  index += 1
end

#Remove any duplicate values that might appear on To user.
users = users.uniq

#Code to create a hash in which i will have a list for each of the users with money comng in and money coming out
users_account = {}
for user in users
  users_account[user] = {"money_in"=>0, "money_out"=> 0, "balance"=>0}
end

index = 0
users = []
loop do
  if index == blockchain.length
    break
  end
  receiver=blockchain[index]["to_user"]
  sender = blockchain[index]["from_user"]
  transaction = blockchain[index]["amount"]

  users_account[receiver]["money_in"] += transaction
  users_account[sender]["money_out"] += transaction
  users_account[receiver]["balance"] += transaction
  users_account[sender]["balance"] -= transaction
  index += 1
end


# Code to verify that numbers were accurate
# p "Money coming in: #{users_account["ben"]["money_in"]}"
# p "Money coming out : #{users_account["ben"]["money_out"]}"
# p "Money in balance : #{users_account["ben"]["balance"]}"

p "Ben's KelloggCoin balance is: $#{users_account["ben"]["balance"]}"
p "Brian's KelloggCoin balance is: $#{users_account["brian"]["balance"]}"
p "Evan's KelloggCoin balance is: $#{users_account["evan"]["balance"]}"
p "Anthony's KelloggCoin balance is: $#{users_account["anthony"]["balance"]}"