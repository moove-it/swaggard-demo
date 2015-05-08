# @attr [integer] id
# @attr [string] title
# @attr [string] body
class PostSerializer < ActiveModel::Serializer

  attributes :id
  attributes :title
  attributes :body

end