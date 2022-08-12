class OptionSerializer < ActiveModel::Serializer
  belongs_to :question

  attributes :id, :title
end