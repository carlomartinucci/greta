class MenuGoodsController < ApplicationController
  before_action :set_menu_good, only: [:show, :update, :destroy]

  # GET /menu_goods
  def index
    @menu_goods = MenuGood.all

    render json: @menu_goods
  end

  # GET /menu_goods/1
  def show
    render json: @menu_good
  end

  # POST /menu_goods
  def create
    @menu_good = MenuGood.new(menu_good_params)

    if @menu_good.save
      render json: @menu_good, status: :created, location: @menu_good
    else
      render json: @menu_good.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /menu_goods/1
  def update
    if @menu_good.update(menu_good_params)
      render json: @menu_good
    else
      render json: @menu_good.errors, status: :unprocessable_entity
    end
  end

  # DELETE /menu_goods/1
  def destroy
    @menu_good.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_good
      @menu_good = MenuGood.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def menu_good_params
      params.require(:menu_good).permit(:good_id, :menu_id, :quantity, :meal)
    end
end
