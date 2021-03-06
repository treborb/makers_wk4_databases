class BookmarkManager < Sinatra::Base
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'
  set :partial_template_engine, :erb

  enable :partial_underscores

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def tags(link)
      @tags = link.tags.map(&:name).join(', ')
    end
  end

  # start the server if ruby file executed directly
  # run! if app_file == $PROGRAM_NAME
end
