module CustomGateway
  class Product
    attr_accessor :id, :ref, :name, :retail_sku, :product_code, :machine_type,
                  :space, :is_locked, :load_count, :last_load, :last_modified,
                  :print_job_count, :product_sample_count, :date_created, :type,
                  :legacy_3d, :default_app, :default_app_config, :default_app_pc,
                  :default_app_g, :default_app_ddp, :default_app_dd, :always_use_px,
                  :default_app_locale, :base_product_id, :base_stock_product_id,
                  :product_state_overlay_id, :artwork_output_type, :product_image_ref,
                  :has_texture_png, :has_model_dae, :has_webgl_model_dae, :parent_id,
                  :has_reflection_model_dae, :creator_user_id, :background_image_ref,
                  :space_conversion_product, :base_product, :snapshot_small_url,
                  :snapshot_large_url, :bespoke_image_url, :background_image_url,
                  :acl_can_write, :supplier_name, :supplier_company_ref_id, :supplier_type,
                  :supplier_company_name, :supplier_customer_ref_id, :creator_user_username

    def initialize(params)
      self.id = params['id'] || ''
      self.ref = params['ref'] || ''
      self.name = params['name'] || ''
      self.retail_sku = params['retail_sku'] || ''
      self.product_code = params['productCode'] || ''
      self.machine_type = params['machine_type'] || ''
      self.space = params['space'] || ''
      self.is_locked = params['is_locked'] || ''
      self.load_count = params['load_count'] || ''
      self.last_load = params['last_load'] || ''
      self.last_modified = params['last_modified'] || ''
      self.print_job_count = params['print_job_count'] || ''
      self.product_sample_count = params['product_sample_count'] || ''
      self.date_created = params['date_created'] || ''
      self.type = params['type'] || ''
      self.legacy_3d = params['legacy_3d'] || ''
      self.default_app = params['default_app'] || ''
      self.default_app_config = params['default_app_config'] || ''
      self.default_app_locale = params['default_app_locale'] || ''
      self.default_app_pc = params['default_app_pc'] || ''
      self.default_app_g = params['default_app_g'] || ''
      self.default_app_ddp = params['default_app_ddp'] || ''
      self.default_app_dd = params['default_app_dd'] || ''
      self.always_use_px = params['always_use_px'] || ''
      self.base_product_id = params['base_product_id'] || ''
      self.base_stock_product_id = params['base_stock_product_id'] || ''
      self.product_state_overlay_id = params['product_state_overlay_id'] || ''
      self.artwork_output_type = params['artwork_output_type'] || ''
      self.product_image_ref = params['product_image_ref'] || ''
      self.has_texture_png = params['has_texture_png'] || ''
      self.has_model_dae = params['has_model_dae'] || ''
      self.has_webgl_model_dae = params['has_webgl_model_dae'] || ''
      self.has_reflection_model_dae = params['has_reflection_model_dae'] || ''
      self.background_image_ref = params['background_image_ref'] || ''
      self.creator_user_id = params['creator_user_id'] || ''
      self.parent_id = params['parent_id'] || ''
      self.space_conversion_product = params['space_conversion_product'] || ''
      self.base_product = params['base_product'] || ''
      self.supplier_name = params['supplierName'] || ''
      self.supplier_company_ref_id = params['supplier_company_ref_id'] || ''

      self.snapshot_small_url = ''
      self.snapshot_large_url = ''
      if params.key?('snapshots')
        self.snapshot_small_url = params['snapshots']['small'] || ''
        self.snapshot_large_url = params['snapshots']['large'] || ''
      end

      self.bespoke_image_url = ''
      if params.key?('bespoke_image')
        self.bespoke_image_url = params['bespoke_image']['url'] || ''
      end

      self.background_image_url = ''
      if params.key?('background_image')
        self.background_image_url = params['background_image']['url'] || ''
      end

      self.acl_can_write = ''
      if params.key?('acl')
        self.acl_can_write = params['acl']['can_write'] || ''
      end

      self.supplier_company_name = ''
      self.supplier_customer_ref_id = ''
      self.supplier_type = ''
      if params.key?('supplier')
        self.supplier_company_name = params['supplier']['company_name'] || ''
        self.supplier_customer_ref_id = params['supplier']['customer_ref_id'] || ''
        self.supplier_type = params['supplier']['type'] || ''
      end

      self.creator_user_username = ''
      if params.key?('creator_user')
        self.creator_user_username = params['creator_user']['username'] || ''
      end
    end
  end
end