namespace :app do

	task :test_create => :environment do
		apple = Widget.create( name: 'apple' )
		apple.properties.create( key: 'color', value: 'red' )
		apple.properties.create( key: 'color', value: 'green' )
		apple.properties.create( key: 'color', value: 'yellow' )
		apple.properties.create( key: 'color', value: 'white' )

		banana = Widget.create( name: 'banana' )
		banana.properties.create( key: 'color', value: 'yellow' )

		orange = Widget.create( name: 'orange' )
		orange.properties.create( key: 'color', value: 'orange' )
	end

	task :test_search => :environment do
		search = Widget.search do
			dynamic :properties do
				#  loop over all given keys and facet them
				Widget.search{ facet :property_keys 
						}.facet(:property_keys).rows.collect(&:value).each do |kvp_facet|
					puts "faceting on #{kvp_facet}"
					facet( kvp_facet )
				end
			end
		end
		puts search.inspect
	end	#	task :test_search => :environment do

end	#	namespace :app do
