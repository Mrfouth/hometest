module CommonHelper

  def validate_add_friends?
    validate_add_friends_params
    validate_emails
  end

  def validate_add_friends_params
    if params[:friends].blank? || params[:friends].length != 2
      error!({ error: "unexpected error", detail: "parameter error" }, 433)
    end
  end

  def validate_emails
    params[:friends].each do |email|
       validate_email(email)
    end
  end

  def validate_email email
    error!({ error: "unexpected error", detail: "email format error" }, 433) if (email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i).nil?
  end
end
