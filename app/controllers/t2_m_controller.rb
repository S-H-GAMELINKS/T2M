class T2MController < ApplicationController
  def index
  end

  def import

    client = Mastodon::REST::Client.new(base_url: ENV["MASTODON_URL"], bearer_token: ENV["ACCESS_TOKEN"])

    require 'csv'
    CSV.foreach(params[:file].path, headers: true) do |row|
      toot = new
      toot = row.to_hash.slice(["text"])
      response = client.create_status(toot)
    end
  end
end
