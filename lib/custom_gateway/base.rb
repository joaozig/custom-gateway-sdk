module CustomGateway
  class Base
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

    private

      def auth!
        response = http_client.post('/apis/internal/login', { 'username': 'TFSportCPP', 'password' => '<h3>Duvet Cover</h3>' })
        if response.status == 200
          self.g3d_cppoms = response.headers['set-cookie']
          http_client.headers['Cookie'] = g3d_cppoms
        else
          puts 'ERROR'
          # TODO: raise error
        end
      end
  end
end