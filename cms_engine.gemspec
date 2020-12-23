$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "cms_engine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "cms_engine"
  spec.version     = CmsEngine::VERSION
  spec.authors     = %w[mdziardziel Haradd]
  spec.email       = %w[mdziardziel@gmail.com] #TODO
  spec.homepage    = "http://localhost" #TODO
  spec.summary     = "Summary of CmsEngine." #TODOD
  spec.description = "Description of CmsEngine." #TODO
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "Set to 'http://mygemserver.com'" #TODO
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency 'bootstrap', '~> 5.0.0.alpha3'
  spec.add_dependency 'devise'
  spec.add_dependency 'jquery-rails'
  spec.add_dependency 'paper_trail'
  spec.add_dependency "rails", "~> 5.2.4"
  spec.add_dependency 'rails-i18n'
  spec.add_dependency 'sqlite3' # required by devise
  spec.add_dependency 'jwt'
  spec.add_dependency 'active_model_serializers'
end
