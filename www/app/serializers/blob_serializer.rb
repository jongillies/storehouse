class BlobSerializer < ActiveModel::Serializer
  attributes :id, :checksum, :data
end
