module OmniAuth
  module Strategies
    class SecondLife < OmniAuth::Strategies::OpenID
      #args :api_key

      #option :api_key, nil
      option :name, "secondlife"
      option :identifier, "https://id.secondlife.com/openid/openidserver"

      uid { steam_id }

      info do
        {
          "nickname" => player["personaname"],
          "name"     => player["realname"],
          "location" => [player["loccityid"], player["locstatecode"], player["loccountrycode"]].compact.join(", "),
          "image"    => player["avatarmedium"],
          "urls"     => {
            "Profile" => player["profileurl"]
          }
        }
      end

      extra do
        { "raw_info" => player }
      end

      private

      def raw_info
        @raw_info ||= options.api_key ? MultiJson.decode(Net::HTTP.get(player_profile_uri)) : {}
      end

      def player
        @player ||= raw_info["response"]["players"]["player"].first
      end

      def steam_id
        openid_response.display_identifier.split("/").last
      end
    end
  end
end
