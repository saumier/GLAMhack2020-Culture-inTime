class SearchController < ApplicationController

  def index
    if params[:start]
      date_range = [DateTime.parse(params[:start])..DateTime.parse(params[:end])]
      if params[:query]
        @productions = Production
                       .where(date_of_first_performance: date_range)
                       .where('lower(label) LIKE :search OR lower(locality) LIKE :search OR lower(location_label) LIKE :search OR lower(country) LIKE :search', search: "%#{params[:query].downcase}%")
                       .order(:date_of_first_performance)
                       .paginate(page: params[:page])
      else
        @productions = Production
                       .where(date_of_first_performance: date_range)
                       .order(:date_of_first_performance)
                       .paginate(page: params[:page])
      end
    elsif params[:query]
      @productions = Production
                     .where('lower(label) LIKE :search OR lower(locality) LIKE :search OR lower(location_label) LIKE :search OR lower(country) LIKE :search', search: "%#{params[:query].downcase}%")
                     .order(:date_of_first_performance)
                     .paginate(page: params[:page])
    else
      @productions = Production
                     .order(:date_of_first_performance)
                     .limit(1000)
                     .paginate(page: params[:page])
    end
  end
end
