class Tool < ApplicationRecord
  belongs_to :user
  belongs_to :topic
end
