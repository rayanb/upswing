class Api::IndustriesController < ApplicationController

  def index
    render json: {industries: Industry.all}
  end

end