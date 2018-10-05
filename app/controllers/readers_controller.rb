class ReadersController < ApplicationController

  def index
  end

  def upload_pdf
    binding.pry
  end

  def pdf
    pdf_file = Category.find(5).pdf_file.file.file
    send_file(pdf_file, filename: pdf_file.split('/').last, type: 'application/pdf', disposition: :inline)
  end
end
