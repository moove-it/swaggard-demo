# @attr [integer] id
# @attr [string] name
class UserSerializer < ActiveModel::Serializer

  attributes :id
  attributes :name

end