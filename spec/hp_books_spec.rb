require './hp_books.rb'

context HPBooks do

  it 'blows up when the user is dumb' do
    expect(subject.buy_books([-1, 0, 0, 0, 0])).to eq "How are you buying negative books?"
    expect(subject.buy_books([-100, -1, 0, 0, 0])).to eq "How are you buying negative books?"
    expect(subject.buy_books([nil, 1, 1, 1, 1])).to eq "Yeah, nil won't work"
    expect(subject.buy_books(nil)).to eq "Give me an array, dummy"
    expect(subject.buy_books(5)).to eq "Wat."
  end

  it 'can calculate the cost of no books' do
    expect(subject.buy_books([0, 0, 0, 0, 0])).to eq 0
  end

  it 'can calculate the cost of 1 book' do
    expect(subject.buy_books([1, 0, 0, 0, 0])).to eq HPBooks::PRICE_FOR_1
    expect(subject.buy_books([0, 0, 0, 1, 0])).to eq HPBooks::PRICE_FOR_1
  end

  it 'can calculate the cost of 2 books' do
    expect(subject.buy_books([2, 0, 0, 0, 0])).to eq (HPBooks::PRICE_FOR_1 * 2)
  end

  it 'can calculate the cost of a set of 2 books' do
    expect(subject.buy_books([1, 1, 0, 0, 0])).to eq HPBooks::PRICE_FOR_SET_OF_2
  end

  it 'can calculate the cost of a set of 3 books' do
    expect(subject.buy_books([1, 1, 1, 0, 0])).to eq HPBooks::PRICE_FOR_SET_OF_3
  end

  it 'can calculate the cost of a set of 4 books' do
    expect(subject.buy_books([1, 1, 1, 1, 0])).to eq HPBooks::PRICE_FOR_SET_OF_4
  end

  it 'can calculate the cost of a set of 5 books' do
    expect(subject.buy_books([1, 1, 1, 1, 1])).to eq HPBooks::PRICE_FOR_SET_OF_5
  end

  it 'can calculate the cost of two sets' do
    expect(subject.buy_books([0, 0, 2, 2, 1])).to eq HPBooks::PRICE_FOR_SET_OF_3 + HPBooks::PRICE_FOR_SET_OF_2
  end

  it 'can calculate the cost of a lot of sets' do
    expect(subject.buy_books([100, 100, 100, 90, 80])).to eq (10 * HPBooks::PRICE_FOR_SET_OF_3) + (10 * HPBooks::PRICE_FOR_SET_OF_4) + (80 * HPBooks::PRICE_FOR_SET_OF_5)
  end

  it 'can calculate books not in a set' do
    expect(subject.buy_books([2, 1, 1, 1, 1])).to eq (HPBooks::PRICE_FOR_SET_OF_5 + 8)
  end
end