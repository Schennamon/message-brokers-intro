# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: generate_number.proto for package 'generate_number'

require 'grpc'
require_relative 'generate_number_pb'

module GenerateNumber
  module IntegerGenerator
    class Service

      include ::GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'generate_number.IntegerGenerator'

      rpc :Generate, ::Google::Protobuf::Empty, ::GenerateNumber::RandomNumber
    end

    Stub = Service.rpc_stub_class
  end
end