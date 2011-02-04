require 'rubygems'
require 'tweetstream'
require 'whatlanguage'
require 'json'

class HomeController < ApplicationController
  
  def index
    
  end

  def twitter_stream

#    TweetStream::Client.new('tweetrails','princessthecat').track(Keyword.all.map(&:keyword) * ",") do |status|

#    render :text=>(Keyword.all.map(&:keyword) * ",") and return false

#    curl -d @tracking http://stream.twitter.com/1/statuses/filter.json -u tweetrails:princessthecat

#    @data = `curl -d @tracking http://stream.twitter.com/1/statuses/filter.json -u tweetrails:princessthecat`

#    render :text=>( Date.today.to_s).inspect and return false

    today_date = Date.today.to_s

#    @data = `curl -d @tracking http://stream.twitter.com/1/statuses/filter.json -u tweetrails:princessthecat -o #{RAILS_ROOT}/public/stream_data_#{today_date}.json`
    @data = `curl -d @tracking http://stream.twitter.com/1/statuses/filter.json -u tweetrails:princessthecat -o #{RAILS_ROOT}/public/stream_data.json`

#      @counter = badword_length("#{status.text}")
#      if @counter.to_i > 0
#        @spam = '%.2f' % ((@counter*100).to_f/"#{status.text}".length)
#      else
#        @spam = 0
#      end
#
#      if "#{status.text}".language.to_s == "english"
#
#        @twitter_result = TwitterResult.new
#
#        @twitter_result.screen_name = "#{status.user.screen_name}"
#        @twitter_result.tweet_id = "#{status.id_str}"
#        @twitter_result.tweet = "#{status.text}"
#        @twitter_result.source = "#{status.source}"
#        @twitter_result.geo = "#{status.geo}"
#        @twitter_result.tweet_length = "#{status.text}".length
#        @twitter_result.has_link = "#{status.text}".include? "http:\\"
#        @twitter_result.positive = "#{status.text}".include? ":)"
#        @twitter_result.negative = "#{status.text}".include? ":("
#        @twitter_result.spam = @spam
#        @twitter_result.tweet_created = "#{status.created_at}"
#        @twitter_result.has_question = "#{status.text}".include? "?"
#
#        if @twitter_result.save
#          puts @twitter_result.tweet.inspect
#        end
#
#      else
#        puts "Invalid language - '#{status.text.language.to_s}'"
#      end

#    end

  end

  def store_data

    today_date = Date.today.to_s
    
    @file1 = File.open("public/stream_data.json","r")
#    @file1 = File.open("public/stream_data_#{today_date}.json","r")

    @file1.each do |line|
      if line
        line.match(/(.*?)"text":"(.*?)"(.*?)/)
        @tweet = $2

        if @tweet.to_s.language.to_s == "english"
          @twitter_result = TwitterResult.new
          line = line + " "

          line.match(/(.*?)"screen_name":"(.*?)"(.*?)/)
          @twitter_result.screen_name = $2
          line.match(/(.*?)"id_str":"(.*?)"(.*?)/)
          @twitter_result.tweet_id = $2

          @twitter_result.tweet = @tweet
          line.match(/(.*?)"source":"(.*?)"(.*?)/)
          @twitter_result.source = $2
          line.match(/(.*?)"location":"(.*?)"(.*?)/)
          @twitter_result.geo = $2

          @twitter_result.tweet_length = @twitter_result.tweet.length
          @twitter_result.has_link = @twitter_result.tweet.include? 'http:\\'
          @twitter_result.positive = @twitter_result.tweet.include? ":)"
          @twitter_result.negative = @twitter_result.tweet.include? ":("

          @counter = badword_length(@twitter_result.tweet)
          if @counter.to_i > 0
            @spam = '%.2f' % ((@counter*100).to_f/@tweet.to_s.length)
          else
            @spam = 0
          end

          @twitter_result.spam = @spam
          line.match(/(.*?)"created_at":"(.*?)"(.*?)/)
          @twitter_result.tweet_created = $2
          @twitter_result.has_question = @twitter_result.tweet.include? "?"

          @twitter_result.save
        end

      end
    end
  end

  def add_keyword

    if request.post?

      @keyword = Keyword.new
      
      @keyword.keyword = params[:keyword].to_s.downcase

      if @keyword.save
        redirect_to root_path
      else
        redirect_to add_keyword_path
      end

    end

  end

  def keywords

    @keywords = Keyword.all

  end

end