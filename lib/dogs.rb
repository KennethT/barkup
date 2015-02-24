class Dogs
  POOR      = (0..5).to_a.sample
  AVERAGE   = (6..10).to_a.sample
  EXCELLENT = (11..15).to_a.sample

  def initialize
    joe   = {
      :name => {:first => "Joe", :last=> "Smith"},
      :owner_quality => EXCELLENT
    }
    sarah = {
      :name => {:first => "Sarah", :last => "Darnum"},
      :owner_quality => AVERAGE
    }
    andrew = {
      :name => {:first => "Andrew", :last => "Beter"},
      :owner_quality => AVERAGE
    }

    @dogs = [
      {name: "Fido",     size: :large,  owner: joe},
      {name: "Yapper",   size: :small,  owner: joe},
      {name: "Bruiser",  size: :large,  owner: joe},
      {name: "Tank",     size: :huge,   owner: sarah},
      {name: "Beast",    size: :large,  owner: sarah},
      {name: "Harleigh", size: :medium, owner: andrew},
      {name: "Trixie",   size: :small,  owner: andrew}
    ]
  end


  # only edit below this line
  def small_dogs
    @dogs.select {|dog| dog[:size] == :small}
  end

  def huge_dog
    @dogs.select {|dog| dog[:size] == :huge}[0]
  end
  # alternate solution to number 2
  # def huge_dog
  #   @dogs.find {|dog| dog[:size] == :huge}
  # end

  def large_dog_names
    @dogs.select {|dog| dog[:size] == :large}.map {|dog| dog[:name]}
  end

  def joes_large_dogs
    @dogs.select {|dog| dog[:owner][:name][:first] == "Joe"}.select {|dog| dog[:size] == :large}.map {|dog| dog[:name]}
    # alternate solution
    # @dogs.select {|dog| dog[:owner][:name][:first] == "Joe" && dog[:size] == :large}.map {|dog| dog[:name]}
  end

  def sizes
    # sizes = []
    # @dogs.map do |dog|
    #   dog.map do |x,y|
    #     if x == :size && !(sizes.include?(y))
    #       sizes << y
    #     end
    #   end
    # end
    # sizes
    @dogs.map {|dog| dog[:size] }.uniq
  end

def owners
  # @dogs.map {|dog| dog[:owner] }.uniq.map {|owner| owner[:name][:first] + " " + owner[:name][:last] }
  @dogs.map {|dog| dog[:owner][:name].values.join(" ")}.uniq
end

def average_owners
  @dogs.map do |dog|
    if dog[:owner][:owner_quality] == AVERAGE
      dog[:owner][:name][:first] + " " + dog[:owner][:name][:last]
    end
  end.compact.uniq
end


end
