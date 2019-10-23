# frozen_string_literal: true

module Helper
  def take_screenshot(file_name, result)
    timer_path = Time.now.strftime("%Y_%m_%d").to_s
    file_path = "reports/screenshots/test_#{result}/run_#{timer_path}/"
    file_name_normalized = file_name.to_s.gsub(/[^0-9A-Za-z]/, "") + ".png"
    screenshot = file_path + file_name_normalized
    page.save_screenshot(screenshot, full: true)
    embed(screenshot, "image/png", "SCREENSHOT")
    screenshot
  end
  def embed_image_report(file_path_name, file_name_report)
    embed(file_path_name, "image/png", file_name_report)
  end

  def aguardar(segundos)
    sleep(segundos)
  end

  ## Valida se a URL eh exatamente a mesma URL configurada
  def valida_abertura_pagina(url, timeout)
    aguardar(timeout) { URI.parse(current_url).to_s.eql? url }
    expect(URI.parse(current_url).to_s).to eq url
  end
def gerar_cpf
  documento = ""
  documento = DocumentosBr.cpf  
end


end
