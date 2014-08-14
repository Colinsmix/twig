require 'test_helper'
class ProjectsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  context "logged in" do
    setup do
      user = User.create!(:email => 'us...@test.com', :password => 'user123123', :password_confirmation => 'user123123')
      sign_in user
    end

    should 'should get index' do
      get :index
      assert_response :success
    end

    should 'show' do
      project = Project.new( name: 'twig', description: 'what', organizer: 'john', short_description: 'ha').save
      get :show, id: Project.first.id
      assert_response :success
    end
  end

  test 'redirect to login page to create new project' do
    get :new
    assert_redirected_to new_user_session_path
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, project: { name: 'twig', description: 'what', organizer: 'john', short_description: 'ha' }
    end

    assert_redirected_to root_path
  end

  test 'edit page' do
    project = Project.new( name: 'twig', description: 'what', organizer: 'john', short_description: 'ha')
    project.save
    get :edit, id: project.id
    assert_response :success
  end

  test 'update page' do
    project = Project.new( name: 'twig', description: 'what', organizer: 'john', short_description: 'ha')
    project.save
    project.name = 'branch'
    @attr = { name: "branch" }

    patch :update, id: project.id, project: @attr

    assert_response 302
    assert_redirected_to root_path
  end

  test 'status change' do
    project = Project.new( name: 'twig', description: 'what', organizer: 'john', short_description: 'ha')
    project.save

    #TODO should make a request to see this change
    project.send('approve')

    assert_equal('approved', project.status)
  end
end
