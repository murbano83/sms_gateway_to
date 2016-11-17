module SmsGatewayTo
  class Client
    include HTTParty
    base_uri 'https://sgw01.cm.nl'
    attr_reader :product_token

    def initialize(product_token)
      @product_token = product_token
    end

    def send_message(from, to, message)
      self.class.post("/json/gateway.ashx",
                      {
                        body: {
                          messages: {
                            authentication: { 
                              producttoken: @product_token
                            },
                            msg: [{ 
                              from: from,
                              to: [{
                                number: to
                              }],
                              body:  { 
                                type: "AUTO",
                                content: message 
                              }
                            }]
                          }
                        }.to_json,
                        headers: { 'Content-Type' => 'application/json' } 
                      }
                     )
    end

    def send_message!(from, to, message)
      response = send_message(from, to, message)
      unless response.nil? || response.empty?
        handle_error(response)
      end
    end

    private

    def handle_error(response)
      SmsGatewayTo::ErrorHandler.new(response).response
    end
  end
end
