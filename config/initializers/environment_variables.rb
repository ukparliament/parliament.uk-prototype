module EnvironmentVariables
  class Application < Rails::Application
    config.before_configuration do
      env_file = Rails.root.join("config", 'environment_variables.yml').to_s

      if File.exists?(env_file)
        YAML.load_file(env_file).each do |key, value|
          ENV[key.to_s] = value
        end
      end
    end
  end
end