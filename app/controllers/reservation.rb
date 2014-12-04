# Get all reservations for a session (queue)
get '/session/:id/reservations' do
  @session = Session.find_by(id: params[:id])
  @reservations = Reservation.where(session_id: @session.id)
  erb :'reservation/all'
end

# Create a reservation for a session
get '/session/:id/reservation/new' do
  @session = Session.find_by(id: params[:id])
  if current_user
    erb :'reservation/new'
  else
    redirect('/login')
  end
end

post '/session/:id/reservation/new' do
  user_session = Session.find_by(id: params[:id])
  params[:reservation][:user_id] = session[:user_id]
  reservation = user_session.reservations.create(params[:reservation])

  if reservation.save
    redirect("/session/#{user_session.id}/reservations")
  else
    session[:error] = reservation.errors.messages
    redirect("/session/#{user_session.id}/reservation/new")
  end
end


# Edit a reservation
get '/session/:session_id/reservation/:id/edit' do
  @session = Session.find_by(id: params[:session_id])
  @reservation = Reservation.find_by(id: params[:id])
  if @reservation.user == current_user
    erb :'reservation/edit'
  else
    redirect("/session/#{@session.id}/reservations")
  end
end

put '/session/:session_id/reservation/:id/edit' do
  session = Session.find_by(id: params[:session_id])
  reservation = Reservation.find_by(id: params[:id])
  if reservation.update(params[:reservation])
    redirect("/session/#{session.id}/reservations")
  else
    session[:error] = reservation.errors.messages
    redirect("/session/#{session.id}/reservation/#{reservation.id}/edit")
  end
end


# Delete a reservation
delete '/session/:session_id/reservation/:id' do
  @session = Session.find_by(id: params[:session_id])
  @reservation = Reservation.find_by(id: params[:id])
  @reservation.destroy
  redirect("/session/#{@session.id}")
end
