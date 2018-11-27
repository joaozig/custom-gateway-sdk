require 'singleton'

module CustomGateway
  module CPP
    class Products < Base
      include Singleton

      def self.all(category: nil, term: nil)
        instance.all(category, term)
      end

      def all(category, term)
        filter = {
          "type_flags": {
            "8": nil,
            "32": nil,
            "64": nil,
            "128": nil,
            "256": nil,
            "512": nil,
            "1024": nil,
            "2048": nil,
            "4096": nil
          }
        }

        filter['category_id'] = category unless category.nil?
        filter['term'] = term unless term.nil?

        params = {
          "query": "fragment pages on PaginatorInterface {\npages {\npageCount\nitemCountPerPage\nfirst\ncurrent\nlast\nnext\nfirstPageInRange\nlastPageInRange\ncurrentItemCount\ntotalItemCount\nfirstItemNumber\nlastItemNumber\npagesInRange\n}\n}\nquery paginator($filter: Json, $order: Json, $page: Int, $count: Int) {\npaginator: products(filter: $filter, order: $order, page: $page, count: $count) {\n... pages,\n\nitems {\n\nid\nref\nbase_product_id\nname\nproductCode\nretail_sku\nsupplierName\nis_locked\ntype\n\nlegacy_3d {\ntexture_map_url\nmodel_url\nreflection_model_url\nwebgl_model_url\n}\n\nbase_product {\nid\nname\nproductCode\nsupplierName\nmachine_type\n}\n\nbase_stock_product {\nid\nname\nproductCode\nsupplierName\n}\n\nsnapshots { small, large }\nbespoke_image { url }\n\n}\n}\n}",
          "variables": {
            "filter": filter,
            "order": {
              "id": "DESC"
            },
            "count": 20,
            "page": 1
          }
        }

        response = http_client.post(API_INTERNAL_GRAPHQL, params)
        if response.status == 200
          products = []
          response.body['data']['paginator']['items'].each { |p| products << CustomGateway::Product.new(p) }

          {
            pages: response.body['data']['paginator']['pages'],
            products: products
          }
        else
          if auth_failure?(response)
            self.auth!
            self.all
          end
        end
      end

      def self.find(id)
        instance.find(id)
      end

      def find(id)
        params = {
          "query": "query($id: ID!) {\nproduct(id: $id) {\nid,ref,name,supplierName,retail_sku,productCode,machine_type,supplier_company_ref_id,space,is_locked,load_count,last_load,last_modified,print_job_count,product_sample_count,date_created,type,default_app,default_app_config,default_app_locale,default_app_pc,default_app_g,default_app_ddp,default_app_dd,always_use_px,base_product_id,base_stock_product_id,product_state_overlay_id,artwork_output_type,product_image_ref,has_texture_png,has_model_dae,has_webgl_model_dae,has_reflection_model_dae,background_image_ref,creator_user_id,parent_id,space_conversion_product\n\nbase_product {\nid,ref,name,supplierName,retail_sku,productCode,machine_type,supplier_company_ref_id,space,is_locked,load_count,last_load,last_modified,print_job_count,product_sample_count,date_created,type,default_app,default_app_config,default_app_locale,default_app_pc,default_app_g,default_app_ddp,default_app_dd,always_use_px,base_product_id,base_stock_product_id,product_state_overlay_id,artwork_output_type,product_image_ref,has_texture_png,has_model_dae,has_webgl_model_dae,has_reflection_model_dae,background_image_ref,creator_user_id,parent_id,space_conversion_product\n\nsupplier {\ncompany_name\ncustomer_ref_id\ntype\n}\n}\n\nbespoke_image { url }\n\nbackground_image { url }\n\nacl {\ncan_write\n},\n\nsupplier {\ncompany_name\ncustomer_ref_id\ntype\n}\n\ncreator_user {\nusername\n}\n}\n}",
          "variables": {
            "id": id
          }
        }

        response = http_client.post(API_INTERNAL_GRAPHQL, params)
        if response.status == 200
          CustomGateway::Product.new(response.body['data']['product'])
        else
          if auth_failure?(response)
            self.auth!
            self.find(id)
          end
        end
      end
    end
  end
end