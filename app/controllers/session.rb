# View all sessions
get '/sessions' do
  @sessions = Session.all
  erb :'session/all'
end

# Create a session
get '/session/new' do
  if current_user
    erb :'session/new'
  else
    set_error("You must be logged in to create a session!")
    redirect('/login')
  end
end

post '/session/new' do
  user_session = current_user.sessions.create(params[:session])
  p params

  if request.xhr?
    return user_session.name
  else
    redirect to("/session/#{user_session.id}")
  end
end

# View a session
get '/session/:id' do
  @session = Session.find_by(id: params[:id])
  @reservations = Reservation.where(session_id: @session.id)
  if @session
    erb :'session/index'
  else
    redirect('/sessions')
  end
end

# Delete a session
delete '/session/:id' do
  @session = Session.find_by(id: params[:id])
  @session.destroy
  redirect("/sessions")
end
