class CalculatorController < ApplicationController
  def index

  end

  def show
    if rate = Tax.where('vehicle_id = 1 and min < ? and max >= ? and region_id = ?', params[:power], params[:power], params[:region]).first
      render :json => (rate.rate * params[:power].to_i).to_i
    else
      render :json => ('?????').to_json
    end
  end
end

