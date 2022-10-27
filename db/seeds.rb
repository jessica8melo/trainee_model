Category.create!(name: "Alimentos")
Category.create!(name: "Vestuário")
Category.create!(name: "Eletrodomésticos")

Brand.create!(name: "Bauducco")
Brand.create!(name: "Nike")
Brand.create!(name: "Eletrolux")

Product.create!(name: "Panettone", price: 20, category_id: 1, brand_id: 1, description: "Pão com fruta cristalizada", inventory: 10)
Product.create!(name: "Chocottone", price: 30, category_id: 1, brand_id: 1, description: "Pão com chocolate", inventory: 10)
Product.create!(name: "Barrinha", price: 15, category_id: 1, brand_id: 1, description: "Barra de cereal", inventory: 10)
Product.create!(name: "Tênis", price: 800, category_id: 2, brand_id: 2, description: "Tênis de corrida", inventory: 10)
Product.create!(name: "Camisa do Brasil", price: 350, category_id: 2, brand_id: 2, description: "Camisa amarela e azul da seleção do Brasil", inventory: 10)
Product.create!(name: "Meia", price: 60, category_id: 2, brand_id: 2, description: "Meia soquete", inventory: 10)
Product.create!(name: "Máquina de Lavar", price: 2400, category_id: 3, brand_id: 3, description: "Máquina de lavar de 8kg", inventory: 10)
Product.create!(name: "Aspirador de Pó", price: 1300, category_id: 3, brand_id: 3, description: "Aspirador de 1,2L", inventory: 10)
Product.create!(name: "Geladeira", price: 3000 category_id: 3, brand_id: 3, description: "Geladeira duplex", inventory: 10)
Product.create!(name: "Cafeteira", price: 240, category_id: 3, brand_id: 3, description: "Cafeteira Expresso dose única", inventory: 10)