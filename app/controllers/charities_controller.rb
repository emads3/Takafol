class CharitiesController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :dude_wheres_my_record

  def index
    city_id = params['city_id']
    @charities = if city_id.nil?
                   Charity.verified
                 else
                   Charity.verified.where('city_id = ?', params['city_id'])
                 end
  end

  def show
    @charity = Charity.find(params[:id])
    redirect_to(charities_path, notice: 'Charity not found') unless @charity.verified?
  end

  def dude_wheres_my_record
    redirect_to charities_path, notice: 'Charity not found'
  end
end
