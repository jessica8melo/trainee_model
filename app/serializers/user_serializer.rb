class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :is_admin, :email, :authentication_token, :profile_picture_url

  has_many :carts

  def profile_picture_url
    if object.profile_picture.attached?
      rails_blob_path(object.profile_picture, only_path: true)
    end
  end
end
