require 'generators/rails_react_scaffold/generator_helpers'

module RailsReactScaffold
  module Generators
    # Custom scaffolding generator
    class ViewsGenerator < Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers
      include RailsReactScaffold::Generators::GeneratorHelpers

      source_root File.expand_path('../templates', __FILE__)

      desc "Generates views for the model with the given NAME."

      def copy_view_files
        views_directory_path = File.join("app/views", controller_file_path)
        react_components_directory_path = File.join("app/javascript/components", controller_file_path)
        empty_directory views_directory_path

        view_files.each do |file_name|
          template "views/#{file_name}.html.erb", File.join(views_directory_path, "#{file_name}.html.erb")
        end
        
        component_files.each do |suffix|
          template "react_components/#{suffix}.js.erb", File.join(react_components_directory_path, "#{plural_name}_#{suffix}.js")
        end
      end
      
    end
  end
end