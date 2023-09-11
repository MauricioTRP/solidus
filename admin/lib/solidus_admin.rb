# frozen_string_literal: true

require 'solidus_core'
require 'solidus_backend'
require 'solidus_admin/version'

require 'importmap-rails'
require 'tailwindcss-rails'
require 'turbo-rails'
require 'stimulus-rails'

module SolidusAdmin
  autoload :VERSION, "solidus_admin/version"
  autoload :ImportmapReloader, "solidus_admin/importmap_reloader"
  autoload :MainNavItem, "solidus_admin/main_nav_item"
  autoload :Preview, "solidus_admin/preview"
  autoload :Configuration, "solidus_admin/configuration"
  autoload :Config, "solidus_admin/configuration"
  autoload :Engine, "solidus_admin/engine"

  require "solidus_admin/engine"

  singleton_class.attr_accessor :importmap

  self.importmap = Importmap::Map.new
end
