class Receiver

  prepend SimpleCommand

  def call
    puts 'Start'
    
    NATS.start(servers: ['nats://192.168.1.102:4222']) do
      NATS.subscribe('topic') do |msg, reply|
        save_number(msg.to_i)

        puts msg
      end
    end
  rescue Interrupt => _
    exit(0)
  end

  private

  def save_number(value)
    ActiveRecord::Base.connection.execute("INSERT INTO numbers (value) VALUES (#{value});")
  end

end