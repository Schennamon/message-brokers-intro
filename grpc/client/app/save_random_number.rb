class SaveRandomNumber

  prepend SimpleCommand

  attr_reader :grpc_stub

  def initialize
    @grpc_stub = create_channel
  end

  def call
    loop do
      number_processing

      sleep(3)
    end
  rescue Interrupt => _
    exit(0)
  end

  private

  def create_channel
    GenerateNumber::IntegerGenerator::Stub.new(ENV['GRPC_HOST'], :this_channel_is_insecure)
  rescue GRPC::BadStatus
    exit(1)
  end

  def number_processing
    number = grpc_stub.generate(::Google::Protobuf::Empty.new).value
    save_number(number)

    puts number
  end

  def save_number(value)
    ActiveRecord::Base.connection.execute("INSERT INTO numbers (value) VALUES (#{value});")
  end

end