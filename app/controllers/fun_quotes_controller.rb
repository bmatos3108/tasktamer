class FunQuotesController < ApplicationController
  def index
    @quote = random_quote
  end

  private

  def random_quote
    quotes = [
      "Do not take life too seriously. You will never get out of it alive.",
      "Be yourself; everyone else is already taken.",
      "In three words I can sum up everything I've learned about life: it goes on.",
      "To be yourself in a world that is constantly trying to make you something else is the greatest accomplishment."
    ]
    quotes.sample
  end
end
