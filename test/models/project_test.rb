require 'test_helper'
class ProjectTest < ActiveSupport::TestCase
  test 'project cannot be blank' do
    project = Project.new
    assert_not project.save
  end
end
