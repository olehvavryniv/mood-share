class HomeController < ApplicationController
  before_action :authenticate_user

  def index; end

  private

  def authenticate_path
    auth_slack_sign_in_path
  end
end
