class UsersController < ApplicationController

  before_filter :authenticate_user!

  require 'json'


end