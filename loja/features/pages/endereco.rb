# frozen_string_literal: true

class ControleEnderecoPage < SitePrism::Page
  element :prossiga_checkout, :xpath, "//span[contains(text(),'Proceed to checkout')]"
  #"//*[@id='center_column']/form/p/button"

  def prossship
    prossiga_checkout.click
  end
end
