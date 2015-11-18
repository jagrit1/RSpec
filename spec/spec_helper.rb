require 'rspec'
require './application'

	Rspec.configure do |config|
		config.color = true
		config.tty = true
		config.formatter = :documentation
	end