module CmsEngine
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    # before_action :set_paper_trail_whodunnit # adds author to versions

  end
end
