namespace :utils do
  desc "Popular banco de dados."
  task seed: :environment do
    
    puts "Gerando os Contato (Contatos)..."
      10.times do |i|
        Contato.create!(
          nome: Faker::Name.name,
          email: Faker::Internet.email,
          tipo: Tipo.all.sample,
          obs: LeroleroGenerator.sentence([1,2,3,4,5].sample)
        )
    end
  puts "Gerando os Contato (Contatos)...[OK]"
  
  puts "Gerando os Endereços (Endereco)..."
    Contato.all.each do |contato|
    Endereco.create!(
        rua: Faker::Address.street_address,
        cidade: Faker::Address.city,
        estado: Faker::Address.state,
        contato: Contato.all.sample
        )
    end
puts "Gerando os Endereços (Endereco)...[OK]"

puts "Gerando os Telefones (Telefone)..."
    Contato.all.each do |contato|
      Random.rand(1..5).times do |i|
    Telefone.create!(
        telefone: Faker::PhoneNumber.cell_phone,
        contato: contato 
        )
      end
    end
puts "Gerando os Telefones (Telefone)...[OK]"
  
    end

end
