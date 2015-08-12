class ByDistrict < Prawn::Document

  def initialize(registrants)
    super()
    @registrants = registrants
    header("2016 NCLB Conference - Registrants - " + self.Class.name)
    body(@registrants)
    footer(self.filename)
  end

  def header(title)
    y_position = cursor - 10
    font :Helvetica, :size => 30 do |font|
      text title
    end
  end

  def body(registrants)
    registrants.each do |r|
      font :Helvetica, :size => 12 do |font|
        text r.lastname + "      " + r.firstname + "     " + r.organization
      end
    end
  end

  def footer(filename)
    font :Helvetica, :size => 10 do |font|
      text filename
    end
  end
end
