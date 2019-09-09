require './lib/test.rb'

describe Test do
  it 'returns 0' do
    expect(subject.tester).to eq(0)
  end
end