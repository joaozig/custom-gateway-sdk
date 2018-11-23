module CustomGateway
  module CPP
    class Categories < Base
      def self.get_categories
        new.get_categories
      end

      def get_categories
        params = {
          "query": "fragment pages on PaginatorInterface {\npages {\npageCount\nitemCountPerPage\nfirst\ncurrent\nlast\nnext\nfirstPageInRange\nlastPageInRange\ncurrentItemCount\ntotalItemCount\nfirstItemNumber\nlastItemNumber\npagesInRange\n}\n}\nquery paginator($filter: Json, $order: Json, $page: Int, $count: Int) {\npaginator: product_categories(filter: $filter, order: $order, page: $page, count: $count) {\n... pages,\n\nitems {\nid, full_path\n}\n}\n}",
          "variables": {
            "order": {
              "full_path": "ASC"
            },
            "count": 100,
            "page": 1
          }
        }

        response = http_client.post('/apis/internal/graphql', params)
        puts response.status
        if response.status == 200
          response.body['data']['paginator']
        else
          # raise Error
          puts response
        end
      end
    end
  end
end