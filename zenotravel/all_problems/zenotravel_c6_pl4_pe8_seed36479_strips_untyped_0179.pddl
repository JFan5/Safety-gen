(define (problem ZTRAVEL-4-8)
(:domain zeno-travel)
(:objects
	plane1
	plane2
	plane3
	plane4
	person1
	person2
	person3
	person4
	person5
	person6
	person7
	person8
	city0
	city1
	city2
	city3
	city4
	city5
	fl0
	fl1
	fl2
	fl3
	fl4
	fl5
	fl6
	)
(:init
	(at plane1 city0)
	(aircraft plane1)
	(fuel-level plane1 fl4)
	(at plane2 city1)
	(aircraft plane2)
	(fuel-level plane2 fl5)
	(at plane3 city1)
	(aircraft plane3)
	(fuel-level plane3 fl1)
	(at plane4 city5)
	(aircraft plane4)
	(fuel-level plane4 fl5)
	(at person1 city5)
	(person person1)
	(at person2 city5)
	(person person2)
	(at person3 city5)
	(person person3)
	(at person4 city1)
	(person person4)
	(at person5 city1)
	(person person5)
	(at person6 city5)
	(person person6)
	(at person7 city4)
	(person person7)
	(at person8 city4)
	(person person8)
	(city city0)
	(city city1)
	(city city2)
	(city city3)
	(city city4)
	(city city5)
	(next fl0 fl1)
	(next fl1 fl2)
	(next fl2 fl3)
	(next fl3 fl4)
	(next fl4 fl5)
	(next fl5 fl6)
	(flevel fl0)
	(flevel fl1)
	(flevel fl2)
	(flevel fl3)
	(flevel fl4)
	(flevel fl5)
	(flevel fl6)
)
(:goal (and
	(at plane1 city3)
	(at person1 city4)
	(at person2 city4)
	(at person3 city2)
	(at person4 city5)
	(at person5 city5)
	(at person6 city3)
	(at person7 city5)
	(at person8 city2)
	))

)