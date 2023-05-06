class GenerateNumber
  
  prepend SimpleCommand

  def call
    send_number
  rescue Interrupt => _
    exit(0)
  end

  private

  def send_number
    NATS.start(servers: ['nats://192.168.1.102:4222']) do |conn|
      loop do
        number = rand(0..100)

        conn.publish('topic', number)
        sleep(3)
      end
    end
  end
end

