class CharitiesController < ApplicationController
  def index
    city_id = params['city_id']
    @charities = if city_id.nil?
                   Charity.verified.page params[:page]
                 else
                   Charity.verified.where('city_id = ?', params['city_id']).page params[:page]
                 end
  end
end
