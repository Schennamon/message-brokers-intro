class Receiver

  prepend SimpleCommand

  attr_reader :connection, :channel, :queue

  def initialize
    @connection = open_connection
    @channel    = connection.create_channel
    @queue      = channel.queue('number_generation')
  end

  def call
    puts " [*] Receiver waiting for messages."

    queue.subscribe(block: true) do |delivety_info, properties, body|
      save_number(body.to_i)

      puts " [x] Received #{body}"
    end
  rescue Interrupt => _
    connection.close
    exit(0)
  end

  private

  def save_number(value)
    ActiveRecord::Base.connection.execute("INSERT INTO numbers (value) VALUES (#{value});")
  end

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