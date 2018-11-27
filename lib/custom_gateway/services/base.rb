module CustomGateway
  class Base

    API_INTERNAL_LOGIN = "/apis/internal/login"
    API_INTERNAL_GRAPHQL = "/apis/internal/graphql"

    attr_accessor :http_client
    attr_accessor :g3d_cppoms

    def initialize
      self.http_client = Faraday.new('https://cpp.custom-gateway.net/v2') do |b|
        b.request :json
        b.response :json, content_type: 'application/json'
        b.adapter Faraday.default_adapter
      end

      auth!
    end

    protected

      def auth!
        username = CustomGateway.configuration.username
        password = CustomGateway.configuration.password

        response = http_client.post(API_INTERNAL_LOGIN, { 'username': username, 'password' => password })
        if response.status == 200
          self.g3d_cppoms = response.headers['set-cookie']
          http_client.headers['Cookie'] = g3d_cppoms
        else
          raise CustomGateway::AuthError, "Auth failed: #{response.body['error']['message']}"
        end
      end

      def auth_failure?(response)
        response.body.key?('error') && response.body['error']['message'] == 'Authentication required'
      end
  end
end