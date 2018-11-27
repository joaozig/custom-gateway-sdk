module CustomGateway
  class Category
    attr_accessor :id, :name, :full_path

    def initialize(params)
      self.id = params['id'] || ''
      self.name = params['name'] || ''
      self.full_path = params['full_path'] || ''
    end
  end
end