class GetTweets
  attr_reader :client, :handle

  def initialize(handle: 'realDonaldTrump' )
    @client = initialize_rest_client
    @handle = handle
  end

  def timeline
    client.user_timeline(handle)
  end

  private
    def initialize_rest_client
      Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['API_KEY']
        config.consumer_secret     = ENV['API_SECRET']
        config.access_token        = ENV['TOKEN']
        config.access_token_secret = ENV['TOKEN_SECRET']
      end
    end
end