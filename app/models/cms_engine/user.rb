module CmsEngine
  class User < ApplicationRecord
    devise :database_authenticatable, :registerable,
           :rememberable, :validatable, :trackable
  end
end
