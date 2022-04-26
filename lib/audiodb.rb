# Copyright 2022 XXIV
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
require_relative "audiodb/version"
require 'net/http'
require 'erb'
require 'json'

class AudioDBException < StandardError
  def initialize(message)
    super(message)
  end
end

module AudioDB
  class << self

    ##
    #
    # * `s` artist name
    #
    # return Artist details from artist name
    #
    # Raises AudioDBException
    def search_artist(s)
      begin
        response = get_request("search.php?s=#{ERB::Util.url_encode(s)}")
        if response.length == 0
          raise AudioDBException.new("no results found")
        end
        json = JSON.parse(response)
        if json['artists'] == nil
          raise AudioDBException.new("no results found")
        end
        return json['artists'][0]
      rescue => ex
        raise AudioDBException.new(ex.message)
      end
    end

    ##
    #
    # * `s` artist name
    #
    # return Discography for an Artist with Album names and year only
    #
    # Raises AudioDBException
    def discography(s)
      begin
        response = get_request("discography.php?s=#{ERB::Util.url_encode(s)}")
        if response.length == 0
          raise AudioDBException.new("no results found")
        end
        json = JSON.parse(response)
        if json['album'] == nil
          raise AudioDBException.new("no results found")
        end
        return json['album']
      rescue => ex
        raise AudioDBException.new(ex.message)
      end
    end

    ##
    #
    # * `i` artist id
    #
    # return individual Artist details using known Artist ID
    #
    # Raises AudioDBException
    def search_artist_by_id(i)
      begin
        response = get_request("artist.php?i=#{i}")
        if response.length == 0
          raise AudioDBException.new("no results found")
        end
        json = JSON.parse(response)
        if json['artists'] == nil
          raise AudioDBException.new("no results found")
        end
        return json['artists'][0]
      rescue => ex
        raise AudioDBException.new(ex.message)
      end
    end

    ##
    #
    # * `i` album id
    #
    # return individual Album info using known Album ID
    #
    # Raises AudioDBException
    def search_album_by_id(i)
      begin
        response = get_request("album.php?m=#{i}")
        if response.length == 0
          raise AudioDBException.new("no results found")
        end
        json = JSON.parse(response)
        if json['album'] == nil
          raise AudioDBException.new("no results found")
        end
        return json['album'][0]
      rescue => ex
        raise AudioDBException.new(ex.message)
      end
    end

    ##
    #
    # * `i` artist id
    #
    # return All Albums for an Artist using known Artist ID
    #
    # Raises AudioDBException
    def search_albums_by_artist_id(i)
      begin
        response = get_request("album.php?i=#{i}")
        if response.length == 0
          raise AudioDBException.new("no results found")
        end
        json = JSON.parse(response)
        if json['album'] == nil
          raise AudioDBException.new("no results found")
        end
        return json['album']
      rescue => ex
        raise AudioDBException.new(ex.message)
      end
    end

    ##
    #
    # * `i` album id
    #
    # return All Tracks for Album from known Album ID
    #
    # Raises AudioDBException
    def search_tracks_by_album_id(i)
      begin
        response = get_request("track.php?m=#{i}")
        if response.length == 0
          raise AudioDBException.new("no results found")
        end
        json = JSON.parse(response)
        if json['track'] == nil
          raise AudioDBException.new("no results found")
        end
        return json['track']
      rescue => ex
        raise AudioDBException.new(ex.message)
      end
    end

    ##
    #
    # * `i` track id
    #
    # return individual track info using a known Track ID
    #
    # Raises AudioDBException
    def search_track_by_id(i)
      begin
        response = get_request("track.php?h=#{i}")
        if response.length == 0
          raise AudioDBException.new("no results found")
        end
        json = JSON.parse(response)
        if json['track'] == nil
          raise AudioDBException.new("no results found")
        end
        return json['track'][0]
      rescue => ex
        raise AudioDBException.new(ex.message)
      end
    end

    ##
    #
    # * `i` artist id
    #
    # return all the Music videos for a known Artist ID
    #
    # Raises AudioDBException
    def search_music_videos_by_artist_id(i)
      begin
        response = get_request("mvid.php?i=#{i}")
        if response.length == 0
          raise AudioDBException.new("no results found")
        end
        json = JSON.parse(response)
        if json['mvids'] == nil
          raise AudioDBException.new("no results found")
        end
        return json['mvids']
      rescue => ex
        raise AudioDBException.new(ex.message)
      end
    end

    private def get_request(endpoint)
      uri = URI("https://theaudiodb.com/api/v1/json/2/#{endpoint}")
      res = Net::HTTP.get_response(uri)
      res.body
    end

  end
end