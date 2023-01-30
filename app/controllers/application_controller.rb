class ApplicationController < ActionController::Base
  include JsonWebToken
  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :null_session
  before_action :authenticate_request

  private

  def authenticate_request
    header = request.headers['Authorization']

    header = header.split.last if header

    decoded = jwt_decode(header)

    @current_user = Account.find(decoded[:account_id])
  end
end
