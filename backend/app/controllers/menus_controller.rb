class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :update, :destroy]

  # GET /menus
  def index
    @menus = Menu.all

    render json: @menus.serialized_json
  end

  # GET /menus/1
  def show
    render json: @menu.serialized_json
  end

  # POST /menus
  def create
    ActiveRecord::Base.transaction do
      menu = Menu.create!
      menu_params[:menu_goods].map do |menu_good|
        good = Good.where(name: menu_good[:name]).first_or_create
        MenuGood.create!(
          menu: menu,
          quantity: menu_good[:quantity],
          course: menu_good[:course],
          good: good
        )
      end

    render json: menu.serialized_json, status: :created, location: menu
    end
  rescue StandardError => e
    puts e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  # PATCH/PUT /menus/1
  def update
    if @menu.update(menu_params)
      render json: @menu.serialized_json
    else
      render json: @menu.errors, status: :unprocessable_entity
    end
  end

  # DELETE /menus/1
  def destroy
    @menu.destroy
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def menu_params
      menu_goods = [:quantity, :course, :name]
      params.require(:menu).permit(menu_goods: menu_goods)
    end
end
