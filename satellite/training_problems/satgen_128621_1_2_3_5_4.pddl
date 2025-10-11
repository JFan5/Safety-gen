; params: satgen 128621 1 2 3 5 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	thermograph2 - mode
	infrared1 - mode
	infrared0 - mode
	GroundStation0 - direction
	Star1 - direction
	GroundStation4 - direction
	Star2 - direction
	Star3 - direction
	Star5 - direction
	Phenomenon6 - direction
	Planet7 - direction
	Phenomenon8 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 thermograph2)
	(calibration_target instrument0 Star2)
	(supports instrument1 infrared1)
	(supports instrument1 infrared0)
	(calibration_target instrument1 Star3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation4)
)
(:goal (and
	(have_image Star5 thermograph2)
	(have_image Phenomenon6 infrared0)
	(have_image Planet7 infrared1)
	(have_image Phenomenon8 infrared1)
))

)
