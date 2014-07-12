class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable,
       :omniauthable

  has_many :assignments
  has_many :roles,
    through: :assignments

  has_many :votes,
    inverse_of: :user

  has_many :posts,
    dependent: :nullify,
    inverse_of: :user

  def self.new_with_session(params, session)
    # Filter out email and username from params since we will get those from the session
    user_params = params.except('email', 'username')

    # Get google auth data
    if google_data = session['devise.google_data']
      user_params['email'] = google_data['email']
    end
    new(user_params)
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    scope = self.where(conditions)
    scope = scope.where(["username = :value OR email = :value", { :value => login.downcase }]) if login
    return scope.first
  end

  def update_with_password(params, *options)
    # Ignore current password
    params.delete(:current_password)

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    # Update user info
    result = update_attributes(params, *options)

    # Cleanup password attributes
    clean_up_passwords

    # Return the result
    return result
  end
end
