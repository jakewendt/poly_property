require 'test_helper'

class WidgetTest < ActiveSupport::TestCase

	def create_widget(options=['color', 'red'])
		widget = Widget.create( name: 'something' )
		options.each_slice(2) do |k,v|
			widget.properties.create( key: k, value: v )
		end
		widget.index
		Sunspot.commit
		widget
	end

	test "should find by property with single value" do
		create_widget
		search = Widget.search{ dynamic( :properties ){ with( :color,  'red' ) } }
		assert_equal search.results.length, 1
	end

	test "should find by property with multiple values" do
		create_widget(['color','red','color','yellow','color','green'])
		search = Widget.search{ dynamic( :properties ){ with( :color,  'yellow' ) } }
		assert_equal search.results.length, 1
	end



	test "should facet on property key" do
		create_widget(['color','red','color','yellow','color','green'])
		search = Widget.search{ facet(:property_keys) }
		assert search.facet(:property_keys).rows.collect(&:value).include?('color')
	end

	test "should facet on color" do
		create_widget(['color','red','color','yellow','color','green'])
		search = Widget.search{ dynamic( :properties ){ facet(:color) } }
		assert_equal search.facets.length, 1
		assert_equal search.facets.first.name, :"properties:color"
		assert_equal search.facets.first.rows.length, 3
		assert search.facets.first.rows.collect(&:value).include? 'red'
		assert search.facets.first.rows.collect(&:value).include? 'yellow'
		assert search.facets.first.rows.collect(&:value).include? 'green'
		assert_equal search.facets.first.rows.collect(&:count).uniq, [1]
	end


end
__END__
Widget should facet on color: [<Sunspot::Search::FacetRow:"green" (1)>, <Sunspot::Search::FacetRow:"red" (1)>, <Sunspot::Search::FacetRow:"yellow" (1)>]



	task :test_search => :environment do
		search = Widget.search do
			dynamic :properties do
				#  loop over all given keys and facet them
				Widget.search{ facet :property_keys 
						}.facet(:property_keys).rows.collect(&:value).each do |kvp_facet|
					puts "faceting on #{kvp_facet}"
					facet( kvp_facet )
				end

				with( :color,  'yellow' )
			end
		end
		puts search.inspect
		puts search.results.inspect
		search.results.each do |widget|
			puts widget.name
#			puts widget.properties.inspect
		end

