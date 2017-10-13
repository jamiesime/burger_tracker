



class Deal

  def initialize(info)
    @id = info['id'] if ['id']
    @name = info['name'] if ['name']
    @day_id = info['day_id']
    @eatery_id = info['eatery_id']
    @burger_id = info['burger_id']
  end

end
