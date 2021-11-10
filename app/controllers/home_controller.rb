class HomeController < ApplicationController

  # GET /
  def index
    @most_viewed = Production.order(updated_at: :desc).limit(5)
    @newly_added_spotlights = Spotlight.order(updated_at: :desc).limit(4)
  end

end