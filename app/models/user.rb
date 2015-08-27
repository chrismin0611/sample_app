class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  def up
  create_table :products do |t|
    t.string :email
    t.text :description
 	t.timestamps null: false
    end
  end
end
