module V1
  class DocumentationController < ApplicationController
    include ActionController::MimeResponds

    def openapi
      yaml = File.read("#{Rails.root}/app/documentation/v1/openapi.yaml")
      respond_to do |format|
        format.yaml { render plain: yaml, content_type: 'text/yaml' }
        format.any { render json: YAML.load(yaml).to_json }
      end
    end
  end
end
