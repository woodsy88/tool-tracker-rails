class Tool < ApplicationRecord
  belongs_to :user
  belongs_to :topic


  def self.featured_tools
    limit(5)
  end

  def self.recent
    order("created_at Desc")
  end
end
