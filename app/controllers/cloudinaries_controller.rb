class CloudinariesController < ApplicationController

  def index
    # binding.pry
  end

  def create
    # file = params[:image_id]
    # binding.pry
    # if params[:image_id].present?
    #   preloaded = Cloudinary::PreloadedFile.new(params[:image_id])
    #   raise "Invalid upload signature" if !preloaded.valid?
    #   image_id = preloaded.identifier
    #   binding.pry
    # end
    value = Cloudinary::Uploader.upload(params[:image1], {folder: 'my_pics', use_filename: true, unique_filename: false, type: :private})
    binding.pry
  end
end

