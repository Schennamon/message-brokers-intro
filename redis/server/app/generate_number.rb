class GenerateNumber

  prepend SimpleCommand

  def call
    loop do
      number = rand(0..100)

      connection.publish(ENV['CHANNEL'], number)
      sleep(5)
    end
  rescue Interrupt => _
    exit(0)
  end

  private

  def connection
    @connection ||= Redis.new(host: ENV['HOST'], port: 6379)
  end


end