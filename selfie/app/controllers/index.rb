get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  @photos = Photo.all

  erb :index
end

post '/login' do 
  email = params["correo"]
  pass = params["password"]

  if User.authenticate(email, pass)
    user = User.authenticate(email, pass)
    redirect to("/profile/#{user.id}")
  else
    @error = 1
    erb :index
  end

end

get '/user/new' do 
  erb :new_user
end

post '/user/new' do
  name = params["nombre"]
  email = params["correo"]
  pass = params["password"]

  user = User.new(name: name, email: email)

  if user.validate
    user.password = pass
    user.save!
    id = user.id
    redirect to("/profile/#{id}")
  else
    @error
    erb :new_user
  end

end

get '/profile/:id' do
  @user = User.find(params["id"])
  @profile_photo = User.avatar_photos(@user.id)
  @album = User.album_photos(@user.id)

  if @album.empty?
    @album = 0
  else
    @album = 1
    @album_photos = User.album_photos(@user.id)
  end

  if @profile_photo.empty?
    @profile_photo = 0
  else
    @profile_photo = 1
    @photo = User.avatar_photos(@user.id).last
  end

  erb :profile
end

post '/upload/profile' do
  id = params["id"]
  user = User.find(id)
  photo = Photo.new(params[:photo])
  photo.save!
  photo.tipo = "avatar"

  user.photos << photo

  redirect to("/profile/#{id}")

end

post '/upload/album' do
  id = params["id"]
  user = User.find(id)
  photo = Photo.new(params[:photo])
  photo.save!
  photo.tipo = "album"

  user.photos << photo

  redirect to("/profile/#{id}")

end

get '/gallery/:id' do
  user_id = params["id"]
  @photos_profile = User.avatar_photos(user_id) 
  @photos_album = User.album_photos(user_id)

  erb :gallery
end








