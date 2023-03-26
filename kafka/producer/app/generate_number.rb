class GenerateNumber

  prepend SimpleCommand

  attr_reader :producer

  def initialize
    @producer = kafka.producer
  end

  def call
    loop do
      number = rand(1..1000)
      
      producer.produce(number, topic: 'my-topic')
      producer.deliver_messages
    
      sleep(5)
    end
  rescue Interrupt => _
    exit(0)
  end

  private

  def kafka
    kafka = Kafka.new(seed_brokers: [ENV['BROKER_HOST']], client_id: 'kafka-app')
  end

end