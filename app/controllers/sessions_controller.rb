class SessionsController < ApplicationController
  def create
    user_id = request.env['omniauth.auth']['info']['email']
    credentials = request.env['omniauth.auth']['credentials']

    # Save the credentials to a file
    File.open('config/tokens.yaml', 'w') do |file|
      file.write(credentials.to_yaml)
    end

    # Redirect to calendar index
    redirect_to calendar_path, notice: 'Successfully authenticated with Google!'
  end
end
