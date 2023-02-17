require 'generators/rails_react_scaffold/generator_helpers'

module RailsReactScaffold
  module Generators
    # Custom scaffolding generator
    class ControllerGenerator < Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers
      include RailsReactScaffold::Generators::GeneratorHelpers

      source_root File.expand_path('../templates', __FILE__)

      desc "Generates views for the model with the given NAME."

      class_option :component_dir, type: :string, default: "app/javascript/components", desc: "Specify components directory"
      class_option :component_ext, type: :string, default: "js", desc: "Extension to use for generated React components. (e.g. js vs jsx)"
      class_option :ajax_engine, type: :string, default: "fetch", desc: "What you wan to use for your Ajax calls (fetch, jquery, axios)"
      class_option :json_engine, type: :string, default: "jbuilder", desc: "What you would like to use to render your JSON (jbuilder, rabl)"
      class_option :use_remount, type: :boolean, default: false, desc: "Use Remount for mounting components"
      class_option :use_webpacker, type: :boolean, default: false, desc: "Use Webpacker for JS Bundling"
      class_option :use_webpacker_chunks, type: :boolean, default: false, desc: "Use chunks with Webpacker for JS Bundling"
      class_option :use_cancan, type: :boolean, default: false, desc: "Use CanCan(Can) to load and authorize resources"

      def add_routes
        routes_string = "resources :#{plural_name}"
        route routes_string
      end

      def copy_controller_and_spec_files
        template "controller.rb", File.join("app/controllers", "#{controller_file_name}_controller.rb")
      end

      def copy_view_files
        views_directory_path = File.join("app/views", controller_file_path)
        react_components_directory_path = File.join(options['component_dir'], controller_file_path)
        empty_directory views_directory_path

        view_files.each do |file_name|
          template "views/#{file_name}.html.erb", File.join(views_directory_path, "#{file_name}.html.erb")
        end

        json_files.each do |file_name|
          template "views/#{file_name}.json.#{options[:json_engine]}", File.join(views_directory_path, "#{file_name}.json.#{options[:json_engine]}")
        end
        
        component_files.each do |suffix|
          extension = options[:component_ext]
          template "react_components/#{suffix}.js.erb", File.join(react_components_directory_path, "#{plural_name}_#{suffix}.#{extension}")
        end
      end
      
    end
  end
end