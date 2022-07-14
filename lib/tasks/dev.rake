namespace :dev do
  desc "Configura o ambiente de Desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando DB...") { %x(rails db:drop) } 
      show_spinner("Criando DB...") { %x(rails db:create) }     
      show_spinner("Migrando DB...") { %x(rails db:migrate) }      
      %x(rails dev:add_coins)
      %x(rails dev:add_mining_types)
    else
      puts "Você não esta no ambiente de desenvolvimento"    
    end      
  end  

  desc "Cadastrar Moedas"
  task add_coins: :environment do
    show_spinner("Criando Moedas...") do
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
  end

  desc "Cadastrar os tipos de Mineração"
  task add_mining_types: :environment do
    show_spinner("Cadastrando tipos de Mineração...") do
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

  private

  def show_spinner(msg_start, msg_end = "Concluido!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end 
end