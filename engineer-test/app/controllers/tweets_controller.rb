class TweetsController < ApplicationController
  def index
    @tweet = Tweet.new

    @tweets = Tweet.all.order('created_at DESC')
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.save

    @tag_array = @tweet.body.scan(/#\w+\b/)

    unless @tag_array == []
      @tag_array.each do |tag|
        @tag = Tag.find_or_initialize_by(name: tag)
        @tag.save
        @tweet.tags << @tag
      end
    end

    redirect_to tweets_path
    flash[:notice] = 'Thanks for posting!'
  end

  def destroy
    Tweet.destroy(params[:id])
    redirect_to tweet_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
