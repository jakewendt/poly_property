class Widget < ActiveRecord::Base
	has_many :properties

	searchable do

		string :property_keys, :multiple => true do
				properties.collect(&:key)
		end

		dynamic_string :properties do
				properties.inject({}) do |hash, pair|
						hash.merge(pair.key.to_sym => pair.value)
				end
		end

		#	Can I also do ...
		#	dynamic_integer :properties do
		#		...
		#	end
		#	... for select properties that would be better indexed as integers?

	end
end
__END__


How to identify dynamic fields to facet on
https://github.com/sunspot/sunspot/issues/606


