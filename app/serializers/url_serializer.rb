class UrlSerializer < ActiveModel::Serializer
  attributes :original, :short, :title, :clicks
end
