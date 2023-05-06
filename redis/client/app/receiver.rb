class Receiver

  prepend SimpleCommand

  def call
    puts " [*] Receiver waiting for messages."

    connection.subscribe(ENV['CHANNEL']) do |on|
      on.message do |channel, message|
        save_number(message.to_i)

        puts message
      end
    end
  rescue Interrupt => _
    connection.close
    exit(0)
  end

  private

  def connection
    @connection ||= Redis.new(host: ENV['HOST'], port: 6379)
  end

  def save_number(value)
    ActiveRecord::Base.connection.execute("INSERT INTO numbers (value) VALUES (#{value});")
  end

end