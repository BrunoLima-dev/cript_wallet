
namespace :dev do
  desc "Configura o ambiente de Desenvolvimento"
  task setup: :environment do
    puts "Criando Moedas..."
    puts %x(rails db:drop) 
    puts %x(rails db:create) 
    puts %x(rails db:migrate) 
    puts %x(rails db:seed)
    puts "Moedas Criadas com SUCESSO..."
  end    

  desc "Cadastrar Moedas"
  task add_coins: :environment do
    coins = [   
      {
          description: "Bitcoin",
          acronym: "BTC",
          url_image: "https://pngimg.com/uploads/bitcoin/bitcoin_PNG47.png"
      },
      {
          description: "Eterion",
          acronym: "ETE",
          url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1027.png"
      },
      {
          description: "Bitcoin",
          acronym: "DASH",
          url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/131.png"
      },
      {
          description: "Dogecoin",
          acronym: "XDG",
          url_image: "https://upload.wikimedia.org/wikipedia/pt/d/d0/Dogecoin_Logo.png"
      }
    ]
    
    # Pecorrendo o array de moedas e verificando se já existe se não existe ele cria
    coins.each do |coin|  
    Coin.find_or_create_by!(coin)
    end
  end

  desc "Cadastrar os tipos de Mineração"
  task add_mining_types: :environment do
    mining_types = [
      {description: "Proof of Work", acronym: "POW"},
      {description: "Proof of Stake", acronym: "POS"},
      {description: "Proof of Capacity", acronym: "POC"}
    ]  

    mining_types.each do |mining_type|
      MiningType.find_or_create_by!(mining_type)
    end
  end
end

  
  
