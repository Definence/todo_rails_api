class SessionSerializer < ActiveModel::Serializer
  attributes :username, :token
  # attributes :id, :email, :username, :firstname, :lastname, :token
end