# frozen_string_literal: true

Dado("que acesse a loja virtual") do
  Acesso.new.load
  valida_abertura_pagina("http://automationpractice.com/index.php?", 3)
end

Dado("escolha os produtos para o carrinho com sucesso") do
  Acesso.new.pagina_camiseta
  aguardar(3)
  expect(page).to have_content("T-shirts")
  expect(page).to have_content("The must have of your wardrobe, take a look at our different colors,")
  Tshirts.new.clic_foto_menina
  last = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.window(last)
  Tshirts.new.tamanho_m
  Tshirts.new.cor_az
  aguardar(5)
  Tshirts.new.add_car
  Tshirts.new.chkout
  aguardar(2)
  expect(page).to have_content("Faded Short Sleeve T-shirts")
  expect(page).to have_content("Color : Blue")
  expect(page).to have_content("Size : M")
  expect(page).to have_content("SKU : demo_1")
  ControleOrderPage.new.prosschkt_controle
end

Dado("realize o cadastro dos dados do cliente") do
  ## massa de dados
  puts @fname_m = "#{Faker::Name.first_name}"
  puts @mname_m = "#{Faker::Name.middle_name}"
  puts @lname_m = "#{Faker::Name.last_name}"
  puts @fname_senha_m = I18n.transliterate(@mname_m)
  puts @documento_m = "#{Faker::CPF.numeric}"
  puts @novo_email_m = "teste" + @documento_m + "@mailinator.com"
  puts @senha_m = "@" + @fname_senha_m + "9876"
  puts @comp_m = "#{Faker::Company.name} "
  puts @endereco_m = "78 FRANKLIN ST , NEW YORK, NY 10013-3481, USA"
  puts @endereco2_m = "Apartamento Royal, 10° andar"
  puts @telefone_m = "#{Faker::PhoneNumber.phone_number}"
  puts @celular_m = "#{Faker::PhoneNumber.cell_phone}"
  puts @aliass_m = "XPTO"
  puts @ifd_m = "Vamos comprar!!!"
  puts @cidade_m = "New York"
  puts @cep_m = "10013"

  ## cadastro
  AuthenticPage.new.preenc_mail(@novo_email_m)
  take_screenshot("autentica", "OK")
  AuthenticPage.new.ir_creden
  CadastroCliente.new.dados_pessoais(@fname_m, @lname_m, @senha_m)
  CadastroCliente.new.dia_niver
  CadastroCliente.new.mes_niver
  CadastroCliente.new.ano_niver
  CadastroCliente.new.dados_end(@fname_m, @lname_m, @comp_m, @endereco_m, @endereco2_m, @telefone_m, @celular_m, @aliass_m, @ifd_m, @cidade_m, @cep_m)
  aguardar(3)
  take_screenshot("dados", "OK")
  CadastroCliente.new.final_cadras
  expect(page).to have_content("ADDRESSES")
  expect(page).to have_content(@endereco_m)
  expect(page).to have_content(@endereco2_m)
  expect(page).to have_content(@telefone_m)
  expect(page).to have_content(@celular_m)
  ControleEnderecoPage.new.prossship
  take_screenshot("cadastro", "OK")
end

Quando("realizar o checkout") do
  expect(page).to have_content("Shipping")
  ControleShipPage.new.concordo
  ControleShipPage.new.ir_pagto
  take_screenshot("aceite", "OK")
  aguardar(3)
  expect(page).to have_content("PLEASE CHOOSE YOUR PAYMENT METHOD")
  expect(page).to have_content("$18.51")
  ControlePayPage.new.pagto_check
  aguardar(2)
  expect(page).to have_content("CHECK PAYMENT")
  expect(page).to have_content("$18.51")
  take_screenshot("pagamento", "OK")
end

Entao("realizo o checkout do produto com sucesso") do
  ControlePayPage.new.confirma
  expect(page).to have_content("YOUR CHECK MUST INCLUDE:")
  expect(page).to have_content("Your order on My Store is complete.")
  expect(page).to have_content("$18.51")
end
