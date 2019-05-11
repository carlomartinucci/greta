class GoodSerializer
  include FastJsonapi::ObjectSerializer
  has_many :ingredients
  has_many :recipes

  attributes :name
end
