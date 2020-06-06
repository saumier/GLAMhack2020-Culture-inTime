class SearchController < ApplicationController

  def index
    @productions = Production.where('lower(label) LIKE :search OR lower(locality) LIKE :search OR lower(country) LIKE :search', search: "%#{params[:query].downcase}%")
  end
end
