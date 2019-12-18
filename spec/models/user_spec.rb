require 'rails_helper'

RSpec.describe User, type: :model do
  
  subject { described_class.create(first_name: "name", last_name: 'ln', email: 'me@me.com', password: 'password', password_confirmation: 'password')}

  describe 'Validations' do

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
      subject.email = subject.email.upcase
      expect(subject).to be_valid
    end
        
    it 'is not valid without a password' do
      subject.password = nil
      expect(subject).not_to be_valid
    end

    it 'cannot be created without a password' do
      new_user = described_class.create(first_name: "name", last_name: 'ln', email: 'me@me.com', password: nil, password_confirmation: 'passw')
      expect(new_user).not_to be_valid
    end
    
    it 'cannot be created without a password confirmation' do
      new_user = described_class.create(first_name: "name", last_name: 'ln', email: 'me@me.com', password: 'password', password_confirmation: nil)
      expect(new_user).not_to be_valid
    end

    it 'cannot be created if password is less than 8 characters' do
      new_user = described_class.create(first_name: "name", last_name: 'ln', email: 'me@me.com', password: 'passwor', password_confirmation: 'passwor')
      expect(new_user).not_to be_valid
    end

    it 'is not valid if password_confirmation does not match password field' do
      subject.password_confirmation = 'xdpassword'
      expect(subject).not_to be_valid
    end

    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid if email matches an email in the database, regardless of case' do
      user1 = described_class.create(first_name: 'a', last_name: 'b', email: 'abc@def.com', password: 'password', password_confirmation: 'password')
      user2 = described_class.create(first_name: 'b', last_name: 'c', email: 'abc@def.com', password: 'password1', password_confirmation: 'password1')
      user3 = described_class.create(first_name: 'c', last_name: 'd', email: 'aBc@def.com', password: 'password2', password_confirmation: 'password2')
      expect(user1).to be_valid
      expect(user2).not_to be_valid
      expect(user3).not_to be_valid
    end

    it 'is not valid without a first name' do
      subject.first_name = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a last name' do
      subject.last_name = nil
      expect(subject).not_to be_valid
    end
  end

  describe '.authenticate_with_credentials' do

    before :each do    
      @subject1 = described_class.create(first_name: 'a', last_name: 'b', email: 'abc@def.com', password: 'password', password_confirmation: 'password')
      @subject2 = described_class.create(first_name: 'b', last_name: 'c', email: ' abcdef@def.com ', password: 'password1', password_confirmation: 'password1')
    end

    
    it 'returns user if successfully authenticated' do
      # user1 = described_class.create(first_name: 'a', last_name: 'b', email: 'abc@def.com', password: 'password', password_confirmation: 'password')
      # user2 = described_class.create(first_name: 'b', last_name: 'c', email: ' abcdef@def.com ', password: 'password1', password_confirmation: 'password1')
      expect(User.authenticate_with_credentials(@subject1.email, @subject1.password) == User.find_by(email: @subject1.email)).to be true
      expect(User.authenticate_with_credentials(@subject2.email, @subject2.password) == User.find_by(email: @subject2.email.strip)).to be true
      expect(User.authenticate_with_credentials(@subject1.email, @subject2.password) == User.find_by(email: @subject1.email)).to be false
    end

    it 'successfully authenticates if user enters email with wrong case' do
      @subject1.email = @subject1.email.upcase
      expect(User.authenticate_with_credentials(@subject1.email, @subject1.password) == User.find_by(email: @subject1.email.downcase)).to be true
    end

    it 'successfully authenticates if user enters email with white space' do
      expect(User.authenticate_with_credentials(@subject2.email, @subject2.password) == User.find_by(email: @subject2.email.strip)).to be true
    end

    it 'returns nil if not successfully authenticated' do
      expect(User.authenticate_with_credentials(@subject1.email, @subject2.password)).to be nil
    end


  end


end
