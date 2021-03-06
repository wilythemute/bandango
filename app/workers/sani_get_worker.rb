class SaniGetWorker
  include Sidekiq::Worker
  sidekiq_options backtrace: true

  def perform
    since = SaniRequest.last_id
    url = SANI[:host] + "/api/transacciones.json?since=#{since}"
    begin
      response = JSON.parse(RestClient.get url, :content_type => :json, :Authorization => "Token token=\"#{SANI[:token]}\"")
      SaniRequest.parse_transacciones response["transacciones"]
      SaniRequest.last_id = response["meta"]["max_id"]
    rescue Errno::ETIMEDOUT
      # handle connectivity error
    end
  end
  def self.schedule
    perform_async unless Sidekiq::Queue.new.map(&:klass).include?("SaniGetWorker")
  end
end
