require_relative '../lib/generate_number_services_pb'
require_relative 'generator'

class Generator < GenerateNumber::IntegerGenerator::Service
  def generate(empty_req, _unused_call)
    ::GenerateNumber::RandomNumber.new(value: rand(1..100))
  end
end

server = GRPC::RpcServer.new
server.add_http2_port("localhost:50051", :this_port_is_insecure)
server.handle(Generator.new)
server.run_till_terminated
