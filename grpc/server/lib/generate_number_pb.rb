# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: generate_number.proto

require 'google/protobuf'

require 'google/protobuf/empty_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("generate_number.proto", :syntax => :proto3) do
    add_message "generate_number.RandomNumber" do
      optional :value, :int32, 1
    end
  end
end

module GenerateNumber
  RandomNumber = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("generate_number.RandomNumber").msgclass
end