require 'test_helper'
class ProjectsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  context "logged in" do
    setup do
      @user = User.create!(:email => 'us@test.com', :password => 'user123123', :password_confirmation => 'user123123', :first_name => "Colin", :last_name => "Shields")
      sign_in @user
    end

    should '#index' do
      get :index
      assert_response :success
    end

    should '#show' do
      project = Project.new(name: 'twig', description: 'what', organizer_id: @user.id, short_description: 'ha', :desc_implementation => 'imple', :desc_benefits => 'benefit', :desc_significance => 'significance', :desc_resources => "resource")
      project.save
      get :show, id: project.id
      assert_response :success
    end

    should "#create" do
      assert_difference('Project.count') do
        post :create, project: {name: 'twig', description: 'what', organizer_id: @user.id, short_description: 'ha', :desc_implementation => 'imple', :desc_benefits => 'benefit', :desc_significance => 'significance', :desc_resources => "resource"}
      end

      assert_redirected_to root_path
    end

    should '#edit' do
      project = Project.new(name: 'twig', description: 'what', organizer_id: @user.id, short_description: 'ha', :desc_implementation => 'imple', :desc_benefits => 'benefit', :desc_significance => 'significance', :desc_resources => "resource")
      project.save
      get :edit, id: project.id
      assert_response :success
    end

    should 'update page' do
      project = Project.new(name: 'twig', description: 'what', organizer_id: @user.id, short_description: 'ha', :desc_implementation => 'imple', :desc_benefits => 'benefit', :desc_significance => 'significance', :desc_resources => "resource")
      project.save
      project.name = 'branch'
      @attr = { name: "branch" }

      patch :update, id: project.id, project: @attr

      assert_response 302
      assert_redirected_to root_path
    end

    should 'status change' do
      project = Project.new(name: 'twig', description: 'what', organizer_id: @user.id, short_description: 'ha', :desc_implementation => 'imple', :desc_benefits => 'benefit', :desc_significance => 'significance', :desc_resources => "resource")
      project.save

      #TODO should make a request to see this change
      project.send('approve')

      assert_equal('approved', project.status)
    end
  end

  context 'not logged in' do
    should '#new' do
      get :new
      assert_redirected_to new_user_session_path
    end
  end
end
