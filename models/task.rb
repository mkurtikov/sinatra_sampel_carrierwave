class Task
  include Mongoid::Document

  field :task,    type: Float
  field :params,  type: Float

  mount_uploader :image, ImageUploader
end
