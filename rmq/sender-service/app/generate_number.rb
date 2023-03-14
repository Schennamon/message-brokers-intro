require 'dotenv'
require 'bunny'
require 'simple_command'

class GenerateNumber

  prepend SimpleCommand

  attr_reader :connection, :channel, :queue

  def initialize
    @connection = open_connection
    @channel    = connection.create_channel
    @queue      = channel.queue('number_generation')
  end

  def call
    while true do
      number = rand(1..1000)
    
      channel.default_exchange.publish(number.to_s, :routing_key => queue.name)
      puts "[X] Send #{number}"
    
      sleep(5)
    end
  rescue Interrupt => _
    connection.close
    exit(0)
  end

  private

  def open_connection
    connection = Bunny.new(
      automatically_recover: false,
      host:  ENV['HOST'],
      port:  ENV['PORT'],
      vhost: ENV['VHOST'],
      user:  ENV['USER'],
      pass:  ENV['PASS']
    )

    connection.start
    connection
  end

end