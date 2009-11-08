car = Car.new(:cadillac)
person = Person.new(:age => 32)
person.take_role(:driver)

# set available contexts
person.contexts = [Forest.new, Road.new, Tree.new]

# get the car out!
person.grab_car
# change context
forest = person.drive_car_in_forest
# change context
road = person.drive_car_on_road
# change context 
accident = person.drive_car_into_tree
# causes accident!

# driver tries to take role of mechanic
person.take_role(:mechanic)
# not enough experience
person.repair_car

# not enough experience in this role!
person.take_role(:car_mechanic)
# can't repair it
person.repair_car

# change context
mechanic_workshop = person.push_car_to_mechanic

mechanic = mechanic_workshop.get_person.take_role(:car_mechanic)
mechanic.grab_car_from(person)
mechanic.repair_car

