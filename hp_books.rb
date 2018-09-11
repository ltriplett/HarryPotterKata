class HPBooks

  PRICE_FOR_1 = 8
  PRICE_FOR_SET_OF_2 = 16 * 0.95
  PRICE_FOR_SET_OF_3 = 24 * 0.9
  PRICE_FOR_SET_OF_4 = 32 * 0.8
  PRICE_FOR_SET_OF_5 = 40 * 0.75

  def buy_books(book_counts)
    return "Give me an array, dummy" if book_counts == nil
    return "Wat." if book_counts.is_a?(Integer)
    return "Yeah, nil won't work" if book_counts.include? nil
    return "How are you buying negative books?" if book_counts.min < 0

    set_prices = []

    while book_counts.reduce(0, :+) > 0
      number_of_books_in_set = 0
      book_counts.each_with_index do |x, i|

        if x > 0
          number_of_books_in_set += 1
          book_counts[i] -= 1
        end
      end
      set_prices << price_for_set_of(number_of_books_in_set)
    end
    set_prices.sum
  end

  private

  def price_for_set_of(number_of_books)
    case number_of_books
    when 1
      PRICE_FOR_1
    when 2
      PRICE_FOR_SET_OF_2
    when 3
      PRICE_FOR_SET_OF_3
    when 4
      PRICE_FOR_SET_OF_4
    when 5
      PRICE_FOR_SET_OF_5
    else
      return "You're dumb"
    end
  end
end