class TaskSerializer < ActiveModel::Serializer
	attributes :title, :description, :priority, :active, :due_date, :id
end