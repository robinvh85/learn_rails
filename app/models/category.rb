class Category < ApplicationRecord
  has_many :products

  # has_one_attached :image

  mount_uploader :image, ImageUploader
  mount_uploader :pdf_file, PdfUploader
end
