class AdminController < ApplicationController

  def index
  end

  # GET /admin/build_cache?source=
  def build_cache
    source = params[:source]
    if source == "canada"
      loader = LoadProductions.new
      loader.canada
    elsif source == "swiss"
      loader = LoadProductions.new
      loader.swiss
    end
    redirect_to admin_path
  end
end
