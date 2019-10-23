# frozen_string_literal: true

class CadastroCliente < SitePrism::Page
  element :titulo_masc, :xpath, "//input[@id='id_gender1']"
  element :titulo_fem, :xpath, "//input[@id='id_gender2']"
  element :prime_nome, :xpath, "//input[@id='customer_firstname']"
  element :ultim_nome, :xpath, "//input[@id='customer_lastname']"
  element :email, :xpath, "//input[@id='email']"
  element :senha, :xpath, "//input[@id='passwd']"
  element :dia, :xpath, "//select[@id='days']"
  element :mes, :xpath, "//select[@id='months']"
  element :ano, :xpath, "//select[@id='years']"
  element :pri_nome_end, :xpath, "//input[@id='firstname']"
  element :ult_nome_end, :xpath, "//input[@id='lastname']"
  element :company, :xpath, "//input[@id='company']"
  element :end_hum, :xpath, "//input[@id='address1']"
  element :end_dois, :xpath, "//input[@id='address2']"
  element :cidade, :xpath, "//input[@id='city']"
  element :estado, :xpath, "//select[@id='id_state']"
  element :cep, :xpath, "//input[@id='postcode']"
  element :pais, :xpath, "//select[@id='id_country']"
  element :info_add, "#other"
  element :telefone, :xpath, "//input[@id='phone']"
  element :celular, :xpath, "//input[@id='phone_mobile']"
  element :aliaas, :xpath, "//input[@id='alias']"
  element :registrar, :xpath, "//span[contains(text(),'Register')]"

  def dados_pessoais(fname, lname, senha_m)
    titulo_masc.click
    prime_nome.set(fname)
    ultim_nome.set(lname)
    senha.set(senha_m)
  end

  def dados_end(fname_m, lname_m, comp_m, endereco_m, endereco2_m, telefone_m, celular_m, aliass_m, ifd_m, cidade_m, cep_m)
    pri_nome_end.set(fname_m)
    ult_nome_end.set(lname_m)
    company.set(comp_m)
    end_hum.set(endereco_m)
    end_dois.set(endereco2_m)
    cidade.set(cidade_m)
    find("#uniform-id_state").find(:xpath, "//option[contains(text(),'New York')]").select_option
    find("#uniform-id_country").find(:xpath, "//option[contains(text(),'United States')]").select_option
    cep.set(cep_m)
    #find(info_add).set(ifd_m)
    # fill_in(info_add), with: @ifd_m
    telefone.set(telefone_m)
    celular.set(celular_m)
    aliaas.set(aliass_m)
  end

  def final_cadras
    registrar.click
  end

  def dia_niver
    dia = [1, 15, 25, 28]
    puts "Este é o dia do aniversário + #{@dia = dia.sample}"

    case dia
    when @dia == 1
      find("#uniform-days").find(:xpath, "//div[@id='uniform-days']//option[2]").select_option
    when @dia == 15
      find("#uniform-days").find(:xpath, "//div[@id='uniform-days']//option[16]").select_option
    when @dia == 25
      find("#uniform-days").find(:xpath, "//div[@id='uniform-days']//option[26]").select_option
    when @dia == 28
      find("#uniform-days").find(:xpath, "//div[@id='uniform-days']//option[29]").select_option
    end
  end

  def mes_niver
    mes = [3, 5, 10, 12]
    puts "Este é o mes do aniversário + #{@mes = mes.sample}"

    case mes
    when @mes == 3
      find("#uniform-months").find(:xpath, "//option[contains(text(),'March')]").select_option
    when @mes == 5
      find("#uniform-months").find(:xpath, "//option[contains(text(),'May')]").select_option
    when @mes == 10
      find("#uniform-months").find(:xpath, "//option[contains(text(),'October')]").select_option
    when @mes == 12
      find("#uniform-months").find(:xpath, "//option[contains(text(),'December')]").select_option
    end
  end

  def ano_niver
    ano = [1969, 1979, 1989, 1999]
    puts "Este é o ano do aniversario + #{@ano = ano.sample}"

    case ano
    when @ano == 1969
      find("#uniform-years").find(:xpath, "//option[contains(text(),'1969')]").select_option
    when @ano == 1979
      find("#uniform-years").find(:xpath, "//option[contains(text(),'1979')]").select_option
    when @ano == 1989
      find("#uniform-years").find(:xpath, "//option[contains(text(),'1989')]").select_option
    when @ano == 1999
      find("#uniform-years").find(:xpath, "//option[contains(text(),'1999')]").select_option
    end
  end
end
