namespace :app do
  desc "prepara o app para rodar no ambiente de desenvolvimento"
  task setup: :environment do
    puts "Verificando o ambiente..."
    Rake::Task['app:env'].invoke
    if Rails.env.development?
      puts "Tudo ok, continuando..."
      Rake::Task['app:create_database_yml_file'].invoke
      Rake::Task['app:install'].invoke
    end
  end

  desc "mostra qual ambiente estamos trabalhando"

  task env: :environment do
    puts "O ambiente atual é #{Rails.env}"
  end

  task create_database_yml_file: :environment do
     if File.exists?("config/database.yml")
      puts "O arquivo config/database.yml já existe, não será criado um novo"
     else
      puts "Criando arquivo config/database.yml..."
      f = File.new("config/database.yml", "w+")
      
      f.puts("")
      f.puts("default: &default")
      f.puts("adapter: sqlite3")
      f.puts("pool: 5")
      f.puts("timeout: 5000")
      f.puts("")
      f.puts("development:")
      f.puts("<<: *default")
      f.puts("database: db/development.sqlite3")
      f.puts("")
      f.puts("test:")
      f.puts("<<: *default")
      f.puts("database: db/test.sqlite3")
      f.puts("")
      f.puts("production:")
      f.puts("<<: *default")
      f.puts("database: db/production.sqlite3")
      f.close
      
      puts "Arquivo criado com sucesso!"
     end
  end
  
  task install: :environment do
    puts ""
    puts "Verificando se o banco de dados já existe..."
    if User.nil?
      puts "Criando banco de dados..."
      Rake::Task['db:migrate'].invoke
      puts "Banco de dados criado com sucesso!"      
    else
      puts "Banco de dados presente, ignorando criação!"
    end
    puts "Verificando se banco de dados está vazio..."
    if User.count.nil?
      puts "Criando primeiro usuário..."
      Rake::Task['db:seed'].invoke
      puts "Usuário criado com sucesso!"      
    else
      puts "Banco de dados já possui dados e está pronto para uso!"
    end
      puts ""
      puts "A aplicação está pronta para uso!"
      puts ""
      puts "Inicie o servidor com o comando:"
      puts "rails -s"
      puts ""
      puts "e acesse a url: http://localhost:3000"
      puts ""
      puts "Acesse o sistema com as credenciais:"
      puts "Email: admin@adminmail.com"
      puts "Senha: password"
  end
  
end
