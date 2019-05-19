module Types
  class QueryType < Types::BaseObject
    description 'The query root of this schema'

    field :good, GoodType, null: true do
      description 'Find a good by ID'
      argument :id, ID, required: true
    end

    def good(id:)
      Good.find(id)
    end

    field :goods, [GoodType], null: true do
      description 'Find all goods'
    end

    def goods
      Good.all
    end
  end
end
