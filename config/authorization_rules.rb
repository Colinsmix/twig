authorization do
  role :admin do
    has_permission_on :projects, :to => [:manage]
  end

  role :guest do
    has_permission_on :projects, :to => [:read, :create]
  end
end


privileges do
  # default privilege hierarchies to facilitate RESTful Rails apps
  privilege :manage, :includes => [:create, :read, :update, :delete]
  privilege :create, :includes => :new
  privilege :read, :includes => [:index, :show]
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end
