class UrlSerializer < ActiveModel::Serializer
  attributes :id, :original, :short, :title, :clicks
end
