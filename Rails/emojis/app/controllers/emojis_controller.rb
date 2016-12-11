require "json"
require 'net/http'
require 'open-uri'


class EmojisController < ApplicationController
  skip_before_filter :verify_authenticity_token

  $emoji_uri = "https://api.github.com/emojis"

  def index
  end

  def mood
    uri = URI.parse($emoji_uri)
    http = Net::HTTP.new(uri.host, uri.port)

    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)

    data = JSON.load(response.body)

    if data[params[:emoji]]
      @emoji = data[params[:emoji]]
    else
      flash[:error] = "I'm sorry. I could not recognize your mood. Please try again."
      redirect_to "/"
    end
  end
end
