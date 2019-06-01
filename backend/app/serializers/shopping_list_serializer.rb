class ShoppingListSerializer
  include FastJsonapi::ObjectSerializer
  attributes :quantity, :course
  attribute :name do |obj|
    obj.good.name
  end
end
