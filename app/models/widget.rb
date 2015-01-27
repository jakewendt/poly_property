class Widget < ActiveRecord::Base
	has_many :properties

	searchable do

		string :property_keys, :multiple => true do
			properties.collect(&:key)
		end

		#	:multiple => true works, so need to use arrays
		dynamic_string :properties, :multiple => true do
			#	loop over properties and build a hash.
			properties.inject({}) do |hash, property|
				if( hash.has_key?( property.key.to_sym ) )
					hash[property.key.to_sym].push( property.value )
				else
					hash.merge!(property.key.to_sym => [property.value])
				end
				hash
			end
		end

		#	Can I also do ...
		#	dynamic_integer :properties do
		#		...
		#	end
		#	... for select properties that would be better indexed as integers?
		#
		#	No.  Looks like I would need a different name for each block.
		#	

	end
end
__END__


How to identify dynamic fields to facet on
https://github.com/sunspot/sunspot/issues/606


Could have a taken_at attribute on the properties, but can't index them.

