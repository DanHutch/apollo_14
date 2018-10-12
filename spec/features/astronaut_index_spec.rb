require 'rails_helper'

describe "Astronaut_index" do
  it "user_can_see_all_astronauts" do

    neil = Astronaut.create(name: 'Neil Armstrong', age: 37, job: "commander")

    dan = Astronaut.create(name: "Danny Hutch", age: 31, job: "Certified BadAss")

    ian = Astronaut.create(name: "Ian Douglas", age: 45, job: "Mission Control")

    dione = Astronaut.create(name: "Dione Wilson", age: 26, job: "Chief Engineer")

    buzz = Astronaut.create(name: "Buzz Aldrin", age: 100, job: "Buzzer")

    moon = Mission.create(title: "Moon Mission", time_in_space: 40, astronauts: [dan, buzz, neil])

    visit '/astronauts'

    within ".stats_box" do
      expect(page).to have_content("Average Age: #{Astronaut.avg_age}")
    end

    within ".astronauts" do

      expect(all('.naut_card')[0]).to have_content("#{neil.name}")
      expect(all('.naut_card')[0]).to have_content("#{neil.age}")
      expect(all('.naut_card')[0]).to have_content("#{neil.job}")
      expect(all('.naut_card')[0]).to have_content("#{neil.missions}")


      expect(all('.naut_card')[1]).to have_content("#{dan.name}")
      expect(all('.naut_card')[1]).to have_content("#{dan.age}")
      expect(all('.naut_card')[1]).to have_content("#{dan.job}")

      expect(all('.naut_card')[2]).to have_content("#{ian.name}")
      expect(all('.naut_card')[2]).to have_content("#{ian.age}")
      expect(all('.naut_card')[2]).to have_content("#{ian.job}")

      expect(all('.naut_card')[3]).to have_content("#{dione.name}")
      expect(all('.naut_card')[3]).to have_content("#{dione.age}")
      expect(all('.naut_card')[3]).to have_content("#{dione.job}")

      expect(all('.naut_card')[4]).to have_content("#{buzz.name}")
      expect(all('.naut_card')[4]).to have_content("#{buzz.age}")
      expect(all('.naut_card')[4]).to have_content("#{buzz.job}")

    end
  end
end
