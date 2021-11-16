class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:show, :index]
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :Kanji_last_name, :Kanji_first_name, :Kana_first_name, :Kana_last_name,
                                             :birthday])
  end
end
