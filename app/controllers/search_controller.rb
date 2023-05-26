class SearchController < ApplicationController
  def index
    @members = AirbenderFacade.get_members(params[:nation])
  end
end