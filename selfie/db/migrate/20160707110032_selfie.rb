class Selfie < ActiveRecord::Migration
  def change

    create_table :photos do |t|
      t.belongs_to :user
      t.string :photo
      t.string :tipo
    end

    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
    end
  end
end
