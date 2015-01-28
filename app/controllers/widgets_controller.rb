class WidgetsController < ApplicationController

	def index
		@search = Widget.search do
			dynamic( :properties ) do

				#  loop over all given keys and facet them
				Widget.search{ facet :property_keys 
						}.facet(:property_keys).rows.collect(&:value).each do |kvp_facet|

					facet( kvp_facet )

				end

#				with( :color,  'yellow' )
			end
		end
	end

	def show
		@widget = Widget.find(params[:id])
	end

end
