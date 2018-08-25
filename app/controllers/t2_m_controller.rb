class T2MController < ApplicationController
  def index
  end

  def import
    require 'csv'

    current_user.email.match("@")

    client = Mastodon::REST::Client.new(base_url: "https://" + $', bearer_token: current_user.token)

    toot = String.new

        CSV.foreach(params[:file].path, headers: true) do |row|
          toot = row.to_hash.slice("text")
          puts toot["text"]
          response = client.create_status(toot["text"])
        end
  end
end
