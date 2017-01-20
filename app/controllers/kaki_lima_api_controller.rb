class KakiLimaApiController < ApplicationController
  def index
    render json: KakiLima.limit(params[:limit]).offset(params[:offset]).as_json(except: [:created_at, :updated_at]) 
  end
end
