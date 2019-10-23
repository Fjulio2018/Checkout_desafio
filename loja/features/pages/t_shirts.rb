# frozen_string_literal: true

## Classe responavel pela escolha do produto
class Tshirts < SitePrism::Page
  element :item_tshirts, :xpath, '//*[@id="center_column"]/ul/li/div/div[1]/div/a[1]/img'
  element :addqtd, :xpath, '//input[@id="quantity_wanted"]' \
          '/following-sibling::a[contains(@class,"button-plus")]'
  element :retqtd, :xpath, '//input[@id="quantity_wanted"]' \
          '/following-sibling::a[contains(@class,"button-minus")]'
  element :tamanho, "//select[@id='group_1']"
  element :tamanhoS, :xpath, '//*[@id="group_1"]/option[1]'
  element :tamanhoM, :xpath, '//*[@id="group_1"]/option[2]'
  element :tamanhoL, :xpath, '//*[@id="group_1"]/option[3]'
  element :cor_laranja, :xpath, "//a[@id='color_13']"
  element :cor_azul, :xpath, "//a[@id='color_14']"
  element :ir_carrinho, :xpath, '//*[@id="add_to_cart"]/button/span'
  element :ir_pagamento, :xpath, '//*[@id="layer_cart"]/div[1]/div[2]/div[4]/a/span'

  def clic_foto_menina
    item_tshirts.click
  end

  def tamanho_m
    tamanhoM.click
  end

  def cor_az
    cor_azul.click
  end

  def add_car
    ir_carrinho.click
  end

  def chkout
    ir_pagamento.click
  end
end
