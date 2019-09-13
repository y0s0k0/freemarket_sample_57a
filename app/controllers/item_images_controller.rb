class ItemImagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @image = Image.new(file_name: params[:file])
    if @image.save
      render json: { message: "success", fileID: @image.id }, status: 200
    else
      render json: { error: @image.errors.fullmessages.json(',')}, status: 400
    end
  end

  private
  def image_params
    params.require(:image).permit(:image)
  end
end
