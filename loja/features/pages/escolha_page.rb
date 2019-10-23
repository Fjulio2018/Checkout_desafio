# frozen_string_literal: true

## Classe responsavel por ...
class Acesso < SitePrism::Page
  set_url "http://automationpractice.com/index.php?"
  element :tshirts, :xpath, '//*[@id="block_top_menu"]/ul/li[3]/a'

  def pagina_camiseta
    tshirts.click
  end
end
