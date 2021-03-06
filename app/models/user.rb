class User < ActiveRecord::Base

    before_save {self.email = emal.downcase}  
    has_many :microposts
    attr_accessor :password
    attr_accessible :name, :email, :password, :password_confirmation


    validates_presence_of :name, :email, :password

    validates_length_of :password, :within => 6..40
    validates_length_of :name, :maximum => 50
    validates_length_of :email, :maximum => 255
    

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates_format_of :email, :with => VALID_EMAIL_REGEX
    validates_uniqueness_of :email, :case_sensitive => false
    validates_confirmation_of :password

    
    before_save :encrypt_password
    # Return true if the user's password matches the submitted password.
    def has_password?(submitted_password)
        # Compare encrypted_password with the encrypted version of
        # submitted_password.
        encrypted_password == encrypt(submitted_password)
    end

    def self.authenticate(email, submitted_password)
        user = find_by_email(email)
        return nil if user.nil?
        return user if user.has_password?(submitted_password)
    end

    private
        
        def encrypt_password
            self.salt = make_salt if new_record?
            self.encrypted_password = encrypt(password)
        end
        def encrypt(string)
            string
        end
        def make_salt
            secure_hash("#{Time.now.utc}--#{password}")
        end
        def secure_hash(string)
            Digest::SHA2.hexdigest(string)
        end
end
