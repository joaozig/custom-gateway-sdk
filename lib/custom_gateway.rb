require "faraday"
require "faraday_middleware"
require "json"

require "custom_gateway/configuration"
require "custom_gateway/version"
require "custom_gateway/models/product"
require "custom_gateway/models/category"
require "custom_gateway/services/base"
require "custom_gateway/services/categories"
require "custom_gateway/services/products"
require "custom_gateway/errors/auth_error"

module CustomGateway
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.config
    yield(configuration)
  end
end