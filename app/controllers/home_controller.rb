class HomeController < ApplicationController

  # GET /
  def index
    @most_viewed = Production.order(updated_at: :desc).limit(5)
  end

  def spotlight
    @spotlights = Production.limit(3)
  end

  def admin
  end

end