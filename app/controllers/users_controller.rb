class UsersController < ApplicationController
  before_filter :set_current_menu_item

  def index
    @users = User.all
  end

  #-------------------------------------------------------------------------------------------------
  def show
    @user = current_user
  end

  #-------------------------------------------------------------------------------------------------
  def edit_roles
    # Make sure current user could manage roles
    authorize! :manage_roles, :all

    # Find the user
    @user = User.find(params[:id])
  end

  #-------------------------------------------------------------------------------------------------
  def update_roles
    # Make sure current user could manage roles
    authorize! :manage_roles, :all

    # Find the user
    @user = User.find(params[:id])

    # Get params
    groups = Set.new((params[:groups] || []).map(&:to_sym))
    roles = Set.new((params[:roles] || []).map(&:to_sym))

    # Manage those roles
    @user.manage_roles(groups, roles, current_user)

    # Set flash message
    flash[:notice] = "Successfully updated user roles"

    # Go back to the user profile page
    redirect_to(user_profile_url(@user))
  end

  private

  def set_current_menu_item
    @current_menu_item = :users
  end

end
