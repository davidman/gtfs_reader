FactoryGirl.define do
  factory :source, class: GtfsReader::Config::Source do
    sequence(:name) {|n| "Source #{n}" }

    initialize_with { new name }
  end
end
