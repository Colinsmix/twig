require 'test_helper'
class ProjectsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test 'should get index' do
    get :index
    assert_response :success
  end

  context 'viewing a single project' do
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
end
