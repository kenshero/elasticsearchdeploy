class Member < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  include Customers::Searchable
  include Customers::Mapping
  
end
