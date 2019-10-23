# frozen_string_literal: true

class ControleOrderPage < SitePrism::Page
  element :descricao, :xpath, "//td[@class='cart_description']"
  element :prossiga_checkout, :xpath, "//span[contains(text(),'Proceed to checkout')]"
   
  def prosschkt_controle
    prossiga_checkout.click
  end
end
