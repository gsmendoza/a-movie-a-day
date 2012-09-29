require 'spec_helper'

feature "Recommendations" do
  Steps "New recommendation" do
    Given "today's top recommendation from filmaster was never recommended before by a-movie-a-day", pending: true do
    end

    When "I view the recommendation feed", pending: true do
    end

    Then "I should see the recommendation", pending: true do
    end
  end
end
