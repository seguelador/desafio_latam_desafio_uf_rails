class Request < ApplicationRecord
  # Scopes
  scope :requests_by_user, -> (name) { where(user: name)}

end
