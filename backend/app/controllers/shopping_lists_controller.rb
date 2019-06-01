class ShoppingListsController < ApplicationController
  # GET /shopping_lists
  def index
    purchased_ats = Shopping.pluck(:purchased_at).uniq.compact.sort.reverse

    shopping_lists = []
    purchased_ats.each do |purchased_at|
      menu_goods = Shopping.where(purchased_at: purchased_at).menu_goods.includes(:good)
      shopping_lists << {
        items: get_items(menu_goods),
        purchased: purchased_at.to_i * 1000
      }
    end

    render json: { shopping_lists: shopping_lists }
  end

  # GET /shopping_lists/current
  def current
    menu_goods = Shopping.where(purchased_at: nil).menu_goods.includes(:good)
    json = {
      items: get_items(menu_goods)
    }

    render json: json
  end

  # NOTA: tecnicamente questo dovrebbe essere un destroy, o un'altra azione
  # ma per il momento va bene così
  # POST /shopping_lists
  def create
    Shopping.where(purchased_at: nil).update_all(purchased_at: Time.now)

    render json: {done: 'ok'}
  end

  private

    def get_items(menu_goods)
      menu_goods.reduce([]) do |items, menu_good|
        found = items.find { |item| item[:name] == menu_good.good.name }
        if found
          found[:quantity] += menu_good.quantity || 0
          items
        elsif menu_good.quantity.to_i > 0
          items << {
            name: menu_good.good.name,
            quantity: menu_good.quantity || 0
          }
        else
          items
        end
      end
    end
end
