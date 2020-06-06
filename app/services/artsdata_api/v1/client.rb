module ArtsdataAPI
  module V1
    # Main Client for Artsdata.ca
    class Client
      API_ENDPOINT = 'http://db.artsdata.ca'.freeze

      attr_reader :oauth_token

      def initialize(oauth_token: nil, graph_repository: 'artsdata')
        @oauth_token = oauth_token
        @graph_repository = graph_repository
      end

      def execute_sparql sparql
        data = request_json(
          http_method: :post,
          endpoint: "/repositories/#{@graph_repository}",
          params: { 'query': sparql }
        )
        data['results']['bindings']
      end

      private

      def client
        @client ||= Faraday.new(API_ENDPOINT) do |client|
          client.request :url_encoded
          client.adapter Faraday.default_adapter
          client.headers['Authorization'] = "token #{oauth_token}" if oauth_token.present?
        end
      end

      def request_text(http_method:, endpoint:, params: {})
        client.headers['Accept'] = 'application/json'
        client.headers['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8'
        response = client.public_send(http_method, endpoint, params)
        response.body
      end

      def request_json(http_method:, endpoint:, params: {})
        client.headers['Accept'] = 'application/json'
        client.headers['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8'
        response = client.public_send(http_method, endpoint, params)
        puts response.inspect
        Oj.load(response.body)
      end

      def request_jsonld(http_method:, endpoint:, params: {})
        client.headers['Accept'] = 'application/ld+json'
        client.headers['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8'
        response = client.public_send(http_method, endpoint, params)
        Oj.load(response.body)
      end

      def request_turtle(http_method:, endpoint:, params: {})
        client.headers['Accept'] = 'text/turtle'
        response = client.public_send(http_method, endpoint, params)
        response.body
      end
    end
  end
end
