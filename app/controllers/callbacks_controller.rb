class CallbacksController < Devise::OmniauthCallbacksController

  def amazon
    @employee = Employee.from_omniauth(request.env["omniauth.auth"])  #  retieved info can be found in hash
      sign_in_and_redirect @employee   # sign_in_and_redirect - a Devise method
    flash.notice = "Signed in!"
  end
end
i