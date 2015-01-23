FactoryGirl.define do

	factory :widget do |f|
		f.sequence(:name) { |n| "Name#{n}" }
		f.sequence(:description) { |n| "Desc#{n}" }
	end

end
