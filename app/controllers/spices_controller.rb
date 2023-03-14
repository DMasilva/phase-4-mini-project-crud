class SpicesController < ApplicationController
  wrap_parameters format: []
  rescue_from ActiveRecord::RecordNotFound, with: :error_handler
  def index
    render json: Spice.all
  end

  # def show
  #   spice = find_all_spices
  #   render json: spice, status: :ok

  # end

  def create
      spice= Spice.create(spice_params)
      render json: spice, status: :created
  end

  def update
    spice = find_all_spices
      spice.update(spice_params)
      render json: spice
  end

    def destroy
      spice = find_all_spices
      spice.destroy
      head :no_content
    end



  private
  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end

  def find_all_spices
    Spice.all.find(params[:id])
  end

  def error_handler
    render json: {error: 'spice not found'}, status: :not_found
  end
end
