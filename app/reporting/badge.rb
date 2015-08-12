class Badge < Prawn::Document

  def initialize(registrants)
    super()
    @registrants = registrants
    # will need this for last page logic (see below)
    @count = @registrants.length
    @column = 1                   # will need one and two for two column layouts
    registrants.map do |r|
      @count -= 1
      # output the badge
      header
      badge_content(r)
      footer
      # do not start_new_page if @count == 0 (no more badges left to print)
      if @count > 0
        start_new_page
      end
    end
  end

  def header
    # don't use the badge content for the header. Standard header
    # image ->
    y_position = cursor - 10
    font :Helvetica, :size => 30 do |font|
      text '2016 NCLB Conference'
    end
  end

  def badge_content(r)
    font :Helvetica, :size => 20 do |font|
      text r.lastname + ", " + r.firstname
      text r.businessname
    end
  end

  def footer
    font :Helvetica do |font|
      text 'Chicago'
      text 'February 22-24, 2016'
    end
  end

end
