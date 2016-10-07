class TaskSerializer < BaseSerializer
  attributes :id, :image, :params

  def image
    object.image.url
  end
end
