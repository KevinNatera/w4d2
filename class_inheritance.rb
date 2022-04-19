require 'byebug'


class Employee
  attr_reader :salary
  def initialize(name,title,salary,boss)
    @name = name
    @title = title 
    @salary = salary 
    @boss = boss 
  end

  def bonus(multiplier)
    @salary * multiplier
  end

end



class Manager < Employee

  def initialize(name,title,salary,boss)
    super(name,title,salary,boss)
    @employees = []
  end


  def bonus(multiplier)
    sum = 0
    @employees.each do |employee|
        sum += employee.salary
    end
    sum * multiplier
  end

  def hire(*employee)
      employee.each do |person|
        @employees << person if !@employees.include?(person)
      end
  end

end

ned = Manager.new("ned","founder",1000000,nil)

darren = Manager.new("darren","TA Manager",78000,ned)

shawna = Employee.new("shawna","TA",12000,darren)

david = Employee.new("david","TA",10000,darren)

ned.hire(darren,shawna,david)
darren.hire(shawna,david)


p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)