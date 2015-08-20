module Customers
  module Mapping
    extend ActiveSupport::Concern
      included do 
      index_name "#{Rails.env}_customers"
      mapping do
          indexes :id, index: :not_analyzed
          indexes :firstname
          indexes :lastname
          indexes :address
          indexes :phone
          indexes :age
      end
    end
  end
end
