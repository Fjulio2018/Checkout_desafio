# frozen_string_literal: true

    class ConfirmaOrder < SitePrism::Page
      element :valor_final, :xpath, "//div[@class='box']"
      element :voltar_order, :xpath, "//*[@id='center_column']/p/a"
    end

