# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( test.css )
Rails.application.config.assets.precompile += %w( landing.css )
Rails.application.config.assets.precompile += %w( bootstrap.min.css )
Rails.application.config.assets.precompile += %w( index.js )
Rails.application.config.assets.precompile += %w( likes.js )
Rails.application.config.assets.precompile += %w( pageshow.js )
Rails.application.config.assets.precompile += %w( element.js )


# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
