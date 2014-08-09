class User
  include Mongoid::Document
  authenticates_with_sorcery!

  field :username, type: String
  field :register_at, type: DateTime
  field :age, type: Integer

  has_many :authentications, autosave: true
end
