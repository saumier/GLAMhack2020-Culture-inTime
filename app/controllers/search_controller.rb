class SearchController < ApplicationController

  def index
    @productions = Production.where("lower(label) LIKE ?", "%#{params[:query].downcase}%")
  end

end