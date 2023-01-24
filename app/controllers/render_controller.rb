class RenderController < ApplicationController
  skip_before_action :authenticate_request
  def index
    render json: { "key": "value" }, status: :ok
  end
end
