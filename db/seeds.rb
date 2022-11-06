Category.create!(name: "Alimentos")
Category.create!(name: "Vestuário")
Category.create!(name: "Eletrodomésticos")

Brand.create!(name: "Bauducco").image.attach(io: File.open('./public/bauducco_logo.jpg'), filename:'bauducco_logo.jpg')
Brand.create!(name: "Nike").image.attach(io: File.open('./public/nike_logo.png'), filename:'nike_logo.png')
Brand.create!(name: "Eletrolux").image.attach(io: File.open('./public/electrolux_logo.webp'), filename:'electrolux_logo.webp')

Product.create!(name: "Panettone", price: 20, category_id: 1, brand_id: 1, description: "Pão com fruta cristalizada", inventory: 10)
Product.create!(name: "Chocottone", price: 30, category_id: 1, brand_id: 1, description: "Pão com chocolate", inventory: 10)
Product.create!(name: "Barrinha", price: 15, category_id: 1, brand_id: 1, description: "Barra de cereal", inventory: 10)
Product.create!(name: "Tênis", price: 800, category_id: 2, brand_id: 2, description: "Tênis de corrida", inventory: 10)
Product.create!(name: "Camisa do Brasil", price: 350, category_id: 2, brand_id: 2, description: "Camisa amarela e azul da seleção do Brasil", inventory: 10)
Product.create!(name: "Meia", price: 60, category_id: 2, brand_id: 2, description: "Meia soquete", inventory: 10)
Product.create!(name: "Máquina de Lavar", price: 2400, category_id: 3, brand_id: 3, description: "Máquina de lavar de 8kg", inventory: 10)
Product.create!(name: "Aspirador de Pó", price: 1300, category_id: 3, brand_id: 3, description: "Aspirador de 1,2L", inventory: 10)
Product.create!(name: "Geladeira", price: 3000, category_id: 3, brand_id: 3, description: "Geladeira duplex", inventory: 10)
Product.create!(name: "Cafeteira", price: 240, category_id: 3, brand_id: 3, description: "Cafeteira Expresso dose única", inventory: 10)

User.create!(name: "Jessica", is_admin: false, email:"trainee@struct", password:"123456").profile_picture.attach(io: File.open('./public/user_1.jpeg'), filename:'user_1.jpeg')
User.create!(name: "Nicolas", is_admin: true, email:"membro@struct", password:"123456")

Product.find_by!(name: "Panettone").images.attach(io: File.open('./public/panettone_1.webp'), filename:'panettone_1.webp')
Product.find_by!(name: "Panettone").images.attach(io: File.open('./public/panettone_2.webp'), filename:'panettone_2.webp')
Product.find_by!(name: "Chocottone").images.attach(io: File.open('./public/chocottone_1.webp'), filename:'chocottone_1.webp')
Product.find_by!(name: "Chocottone").images.attach(io: File.open('./public/chocottone_2.webp'), filename:'chocottone_2.webp')
Product.find_by!(name: "Barrinha").images.attach(io: File.open('./public/barrinha_1.webp'), filename:'barrinha_1.webp')
Product.find_by!(name: "Barrinha").images.attach(io: File.open('./public/barrinha_2.jpeg'), filename:'barrinha_2.jpeg')
Product.find_by!(name: "Tênis").images.attach(io: File.open('./public/tenis_1.webp'), filename:'tenis_1.webp')
Product.find_by!(name: "Tênis").images.attach(io: File.open('./public/tenis_2.webp'), filename:'tenis_2.webp')
Product.find_by!(name: "Camisa do Brasil").images.attach(io: File.open('./public/camisa_1.webp'), filename:'camisa_1.webp')
Product.find_by!(name: "Camisa do Brasil").images.attach(io: File.open('./public/camisa_2.webp'), filename:'camisa_2.webp')
Product.find_by!(name: "Meia").images.attach(io: File.open('./public/meia_1.webp'), filename:'meia_1.webp')
Product.find_by!(name: "Meia").images.attach(io: File.open('./public/meia_2.webp'), filename:'meia_2.webp')
Product.find_by!(name: "Máquina de Lavar").images.attach(io: File.open('./public/maquina_1.webp'), filename:'maquina_1.webp')
Product.find_by!(name: "Máquina de Lavar").images.attach(io: File.open('./public/maquina_2.webp'), filename:'maquina_2.webp')
Product.find_by!(name: "Aspirador de Pó").images.attach(io: File.open('./public/aspirador_1.webp'), filename:'aspirador_1.webp')
Product.find_by!(name: "Aspirador de Pó").images.attach(io: File.open('./public/aspirador_2.webp'), filename:'aspirador_2.webp')
Product.find_by!(name: "Geladeira").images.attach(io: File.open('./public/geladeira_1.webp'), filename:'geladeira_1.webp')
Product.find_by!(name: "Geladeira").images.attach(io: File.open('./public/geladeira_2.webp'), filename:'geladeira_2.webp')
Product.find_by!(name: "Cafeteira").images.attach(io: File.open('./public/cafeteira_1.jpeg'), filename:'cafeteira_1.jpeg')
Product.find_by!(name: "Cafeteira").images.attach(io: File.open('./public/cafeteira_2.webp'), filename:'cafeteira_2.webp')