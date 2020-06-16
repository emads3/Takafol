class CharitiesController < ApplicationController
  def index
    city_id = params['city_id']
    @charities = if city_id.nil?
                   Charity.verified
                 else
                   Charity.verified.where('city_id = ?', params['city_id'])
                 end
  end
end
