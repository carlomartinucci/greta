class GoodsController < ApplicationController
  before_action :set_good, only: [:show, :update, :destroy]

  # GET /goods
  def index
    @goods = Good.all

    render json: @goods.serialized_json
  end

  # GET /goods/1
  def show
    render json: @good.serialized_json
  end

  # POST /goods
  def create
    @good = Good.new(good_params)

    if @good.save
      render json: @good.serialized_json, status: :created, location: @good
    else
      render json: @good.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /goods/1
  def update
    if @good.update(good_params)
      render json: @good.serialized_json
    else
      render json: @good.errors, status: :unprocessable_entity
    end
  end

  # DELETE /goods/1
  def destroy
    @good.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_good
      @good = Good.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def good_params
      params.require(:good).permit(:name, :shelf)
    end
end
