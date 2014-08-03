authorization do
  role :admin do
    has_permission_on :projects, :to => [:index]
  end
end
