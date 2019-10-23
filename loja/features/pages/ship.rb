# frozen_string_literal: true

class ControleShipPage < SitePrism::Page
  element :agree, :xpath, '//div[@id="uniform-cgv"]/descendant::input[@id="cgv"]'
  element :agree1, :xpath, "//label[contains(text(),'I agree to the terms of service and will adhere to')]"
  element :prossiga_checkout1, :xpath, "//span[contains(text(),'Proceed to checkout')]"
  element :prossiga_checkout2, :xpath, "//button[@name='processCarrier']//span[contains(text(),'Proceed to checkout')]"

  def concordo
    agree1.click
  end

  def ir_pagto
    prossiga_checkout2.click
  end
end
