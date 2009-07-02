require_dependency "application"
require_dependency "issues_controller"

module IssuesControllerPatch
  module ClassMethods
  end
  
  module InstanceMethods
    def load_roles
      @roles = Role.all
    end
  end
  
  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
    
    receiver.class_eval do
      unloadable # Send unloadable so it will not be unloaded in development
      before_filter :load_roles #, :only => [:show, :edit, :reply]
    end
    
  end
end 

IssuesController.send(:include, IssuesControllerPatch)
