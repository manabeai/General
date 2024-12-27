class TweetsController < ApplicationController
  def index
    @tweets = Tweet.includes(:user).decorate
  end
end
