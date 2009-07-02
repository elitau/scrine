class IssueRole < ActiveRecord::Base
  belongs_to :issue
  belongs_to :role
end
