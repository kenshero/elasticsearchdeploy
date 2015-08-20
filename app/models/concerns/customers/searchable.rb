module Customers
  module Searchable
    extend ActiveSupport::Concern

    included do 
      def self.member_search(query,choice)
        __elasticsearch__.search(
          {
            query: {
              multi_match: {
                query: query,
                type: "phrase_prefix",
                fields: field_search(choice)
              }
            }
          }
        )
      end

      def self.field_search(choice)
        case choice
        when "all"
          ['firstname', 'lastname', 'address', 'phone','age']
        when "firstname"
          ['firstname']
        when "lastname"
          ['lastname']
        when "address"
          ['address']
        when "phone"
          ['phone']
        when "age"
          ['age']
        else
          ['firstname', 'lastname', 'address', 'phone','age']
        end
      end

      # def as_indexed_json(options={})
      #   as_json(
      #     only: [:firstname]
      #   )
      # end
    # end
     end
  end
end

# # Delete the previous Customers index in Elasticsearch
# Member.__elasticsearch__.client.indices.delete index: Member.index_name rescue nil

# # Create the new index with the new mapping
# Member.__elasticsearch__.client.indices.create \
#   index: Member.index_name,
#   body: { settings: Member.settings.to_hash, mappings: Member.mappings.to_hash }

# Member.import
