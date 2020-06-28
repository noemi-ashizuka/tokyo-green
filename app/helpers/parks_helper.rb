module ParksHelper
  def checked(facility)
    @park.facilities.nil? ? false : @park.facilities.match(facility)
  end
end