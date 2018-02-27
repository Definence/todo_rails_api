class TasksSerializer < ActiveModel::Serializer
  attributes :id, :title, :priority, :active
end