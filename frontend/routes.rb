ArchivesSpace::Application.routes.draw do

  match('/plugins/container_profiles/:id' => 'container_profiles#update', :via => [:post])
  match('/plugins/container_profiles/:id/delete' => 'container_profiles#delete', :via => [:post])
  
end
