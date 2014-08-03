class User
  include Mongoid::Document
  authenticates_with_sorcery!

  field :username, type: String

  has_many :authentications, autosave: true
end
