require 'sms_gateway_to'

producttoken = "producttoken"
client = SmsGatewayTo::Client.new(producttoken) 
puts client.send_message!("From", "+999999", "message")
