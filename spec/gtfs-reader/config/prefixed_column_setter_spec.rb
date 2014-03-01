require 'spec_helper'

describe GtfsReader::Config::PrefixedColumnSetter do
  subject :setter do
    GtfsReader::Config::PrefixedColumnSetter.new definition, prefix
  end

  let(:prefix) { 'prefix' }
  let(:definition) { double 'definition' }

  it { expect( setter.respond_to? :anything ).to be_truthy }

  it do
    expect( definition ).to receive( :method_missing ).
      with('prefix_column', {a:1, b:2, alias: :column})

    setter.column a: 1, b: 2
  end
end
