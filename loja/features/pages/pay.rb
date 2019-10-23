# frozen_string_literal: true

class ControlePayPage < SitePrism::Page
  element :descricao, :xpath, "//td[@class='cart_description']"
  element :pay_card, :xpath, "//a[@class='bankwire']"
  element :pay_check, :xpath, "//a[@class='cheque']"
  element :confirm_order, :xpath, "//span[contains(text(),'I confirm my order')]"

  def pagto_banco
    pay_card.click
  end

  def pagto_check
    pay_check.click
  end

  def confirma
    confirm_order.click
  end
end
