require 'redmine'
# require_dependency 'issues_controller_patch'
# require_dependency 'issue_patch'
# require File.expand_path("#{File.dirname(__FILE__)}/lib/issue_controller_patch")

Redmine::Plugin.register :redmine_scrine do
  name 'Scrine'
  author 'Eduard Litau'
  description 'Scrum Extension for Redmine'
  version '0.0.1'

  menu :project_menu, :sprints, {:controller => 'sprints', :action => 'index'}, :before => :activity, :caption => 'Sprint List'
end
