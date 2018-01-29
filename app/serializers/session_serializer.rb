class SessionSerializer < ActiveModel::Serializer
  attributes :username, :token
end