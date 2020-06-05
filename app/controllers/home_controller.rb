class HomeController < ApplicationController

  # GET /
  def index
    @most_viewed = Production.limit(5)
  end

end