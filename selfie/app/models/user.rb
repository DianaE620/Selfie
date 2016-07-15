class User < ActiveRecord::Base
  # Remember to create a migration!
  include BCrypt

  validates :name, presence: true
  validates :email, :name, uniqueness: true

  has_many :photos

  def self.avatar_photos(id)
    user = User.find(id)
    user.photos.where(tipo: "avatar")
  end

  def self.album_photos(id)
    user = User.find(id)
    user.photos.where(tipo: "album")
  end


  def password
    @password ||= Password.new(password_digest)
  end

  def password=(user_password)
    @password = Password.create(user_password)
    self.password_digest = @password
  end

  def self.authenticate(email, user_password)
    user = User.find_by(email: email)
      if user && (user.password == user_password)
        return user
      else
        nil
      end
  end


end
