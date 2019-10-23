# frozen_string_literal: true

class AuthenticPage < SitePrism::Page
  element :username, :xpath, "//*[@id='email']"
  element :password, :xpath, "//*[@id='passwd']"
  element :loga, :xpath, "//*[@id='SubmitLogin']"
  element :email_creden, :xpath, "//input[@id='email_create']"
  element :creden_novo, :xpath, "//form[@id='create-account_form']//span[1]"

  def preenche(email, senha)
    username.set(email)
    password.set(senha)
  end

  def login
    loga.click
  end

  def preenc_mail(novo_email)
    email_creden.set(novo_email)
  end

  def ir_creden
    creden_novo.click
  end
end
