class CallbacksController < Devise::OmniauthCallbacksController   #inherit from the devise Omniauth callbacks controllers 
   
  def all  #find or create an employee matching that hash 
    @employee = Employee.from_omniauth(request.env["omniauth.auth"])
    if @employee.persisted?
      sign_in_and_redirect @employee
        flash.notice = "Signed in!"
    else
      session["devise.employee_attributes"] = employee.attributes
        redirect_to new_employee_registration_url     
    end
    
  end
end
