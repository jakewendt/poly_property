# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


widget = Widget.create( name: 'Apple' )
widget.properties.create( key: 'color', value: 'red' )
widget.properties.create( key: 'shape', value: 'round' )
widget.properties.create( key: 'weight', value: '0.25' )

widget = Widget.create( name: 'Orange' )

widget = Widget.create( name: 'Banana' )


widget = Widget.create( name: 'Book' )

widget = Widget.create( name: 'Magazine' )

widget = Widget.create( name: 'Bird' )

widget = Widget.create( name: 'Coffee' )

