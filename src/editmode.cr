require "json"
require "http/client"

class Editmode
  VERSION = "0.1.0"

  class Unset
  end

  @@api_key : String?

  def self.api_key=(api_key)
    @@api_key = api_key
  end

  def self.api_key
    @@api_key
  end

  BASE_URL = URI.parse("https://api.editmode.com")

  def self.client : HTTP::Client
    return @@client.not_nil! unless @@client.nil?

    self.reset_client

    @@client.not_nil!
  end

  def self.reset_client
    @@client = HTTP::Client.new(BASE_URL)

    @@client.not_nil!.before_request do |request|
      request.headers["Authorization"] = @@api_key.not_nil!
    end
  end
end

require "./editmode/**"
