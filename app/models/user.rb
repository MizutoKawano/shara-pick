class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


       
          name_word = /\A[ぁ-んァ-ン一-龥]+\z/
          email_word = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
          pass_word = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
          validates :family_name,         format: { with: /#{name_word}/, message: 'は漢字で入力して下さい。' }
          validates :last_name,           format: { with: /#{name_word}/, message: 'は漢字で入力して下さい。' }
         
          validates :email, uniqueness: true, format: { with: /#{email_word}/, message: 'は＠を入れてください。' }
        
        
      
        pass_word = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
      
        validates :password, length: { minimum: 6 }, format: { with: /#{pass_word}/, message: 'は英数字で入力して下さい。' }
       
end
