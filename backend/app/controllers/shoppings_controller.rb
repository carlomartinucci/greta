class ShoppingsController < ApplicationController
  before_action :set_shopping, only: [:show, :update, :destroy]

  # GET /shoppings
  def index
    @shoppings = Shopping.all

    render json: @shoppings.serialized_json
  end

  # GET /shoppings/1
  def show
    render json: @shopping.serialized_json
  end

  # POST /shoppings
  def create
    ActiveRecord::Base.transaction do
      shopping = Shopping.create!
      shopping_params[:menus].each do |menu_params|
        menu = Menu.create!(
          shopping: shopping,
          eat_at: Time.at(menu_params[:eat])
        )
        menu_params[:menu_goods].each do |menu_good_params|
          good = Good.where(name: menu_good_params[:name]).first_or_create
          MenuGood.create!(
            menu: menu,
            quantity: menu_good_params[:quantity],
            course: menu_good_params[:course],
            good: good
          )
        end
      end

      render json: shopping.serialized_json, status: :created, location: shopping
    end
  rescue StandardError => e
    puts e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  # PATCH/PUT /shoppings/1
  def update
    if @shopping.update(shopping_params)
      render json: @shopping.serialized_json
    else
      render json: @shopping.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shoppings/1
  def destroy
    @shopping.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping
      @shopping = Shopping.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shopping_params
      menu_goods = [:quantity, :course, :name]
      menus = [{menu_goods: menu_goods}, :eat]

      params.require(:shopping).permit(:purchased, menus: menus)
    end
end
