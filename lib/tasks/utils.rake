require 'faker'
namespace :utils do
  desc "Cria Administradores Fake"
  task generate_admin: :environment do
    puts "Cadastrando ADMINISTRADORES FAKE..."

    10.times do
      Admin.create!(email: Faker::Internet.email,
                            name: Faker::Name.name,
                           password:"123456",
                           password_confirmation: "123456",
                           role:[0,1].sample)
      end
      puts "ADMINISTRADORES cadastrados com sucesso!"
  end

end
