require 'singleton'

module CustomGateway
  module CPP
    class Categories < Base
      include Singleton

      def self.all
        instance.all
      end

      def all
        params = {
          "query": "fragment pages on PaginatorInterface {\npages {\npageCount\nitemCountPerPage\nfirst\ncurrent\nlast\nnext\nfirstPageInRange\nlastPageInRange\ncurrentItemCount\ntotalItemCount\nfirstItemNumber\nlastItemNumber\npagesInRange\n}\n}\nquery paginator($filter: Json, $order: Json, $page: Int, $count: Int) {\npaginator: product_categories(filter: $filter, order: $order, page: $page, count: $count) {\n... pages,\n\nitems {\nid, name, full_path\n}\n}\n}",
          "variables": {
            "order": {
              "full_path": "ASC"
            },
            "count": 100,
            "page": 1
          }
        }

        response = http_client.post(API_INTERNAL_GRAPHQL, params)
        if response.status == 200
          categories = []
          response.body['data']['paginator']['items'].each { |c| categories << CustomGateway::Category.new(c) }

          {
            pages: response.body['data']['paginator']['pages'],
            categories: categories
          }
        else
          if auth_failure?(response)
            self.auth!
            self.all
          end
        end
      end
    end
  end
end