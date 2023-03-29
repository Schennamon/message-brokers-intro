class Consumer

  prepend SimpleCommand

  attr_reader :consumer

  def initialize
    @consumer = kafka.consumer(group_id: 'my-group')
  end

  def call
    puts " [*] Consumer waiting for messages."

    consumer.subscribe('my-topic')

    consumer.each_message do |message|
      save_number(message.value.to_i)
      
      puts message.value
    end
  rescue Interrupt => _
    exit(0)
  end

  private

  def save_number(value)
    ActiveRecord::Base.connection.execute("INSERT INTO numbers (value) VALUES (#{value});")
  end

  def kafka
    Kafka.new(seed_brokers: [ENV['BROKER_HOST']], client_id: 'kafka-app')
  end

end