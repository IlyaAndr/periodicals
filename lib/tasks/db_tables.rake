namespace :db do
	desc 'Prints all tables in database'
	task tables: :environment do
		puts "***** Database structure: *****"
		ActiveRecord::Base.connection.tables.each do |table|
			puts table.upcase
			puts ActiveRecord::Base.connection.columns(table).map{|c|"#{c.name}: #{c.type}"}.join(' | ')
		end
	end
end