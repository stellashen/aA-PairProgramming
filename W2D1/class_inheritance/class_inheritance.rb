class Employee
  attr_reader :salary

  def initialize(name, title, salary, boss)
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

  def initialize(name, title, salary, boss, employees = [])
    super(name, title, salary, boss)
    @employees = employees
  end

  def bonus(multiplier)
    total_salary = 0
    @employees.each { |employee| total_salary += employee.salary }
    total_salary * multiplier
  end
end
