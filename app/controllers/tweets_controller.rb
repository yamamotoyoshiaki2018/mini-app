class TweetsController < ApplicationController
  before_action :move_to_index, except: :index
 def index
    @tweets = Tweet.order("created_at DESC").page(params[:page]).per(6)
  end

  def new
  end

  def create
    Tweet.create(tweet_params)

  end

  private
  def tweet_params
    params.permit(:name, :text)
  end

  def move_to_index
      redirect_to action: :index unless user_signed_in?
  end
end
