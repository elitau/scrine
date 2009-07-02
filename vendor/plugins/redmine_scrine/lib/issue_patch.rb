require_dependency 'issue'
 
# Patches Redmine's Issues dynamically.  Adds a relationship 
# Issue +hm through+ to Roles
module IssuePatch
  def self.included(base) # :nodoc:
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)
 
    # Same as typing in the class 
    base.class_eval do
      unloadable # Send unloadable so it will not be unloaded in development
      has_many :issue_roles
      has_many :roles, :through => :issue_roles
      
    end
 
  end
  
  module ClassMethods
    
  end
  
  module InstanceMethods
    def hours_of_all_roles
      unless self.issue_roles.empty?
        return self.issue_roles.sum(:estimated_hours)
      end
    end
  end    
end
 
# Add module to Issue
Issue.send(:include, IssuePatch)