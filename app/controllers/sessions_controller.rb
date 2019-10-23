class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_or_create_by(slack_id: auth_hash.info.user_id) do |new_user|
      fill_user_info(new_user)
    end

    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

  def info_params
    auth_hash.info
  end

  def profile_params
    auth_hash.extra.user_info.user.profile
  end

  def fill_user_info(user)
    user.nickname = info_params.nickname
    user.name = info_params.name
    user.team_name = info_params.team
    user.team_id = info_params.team_id
    user.image_url_32 = profile_params.image_32
    user.image_url_72 = profile_params.image_72
    user.image_url_192 = profile_params.image_192
  end
end
