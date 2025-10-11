; params: satgen 302975 1 2 2 5 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	infrared0 - mode
	infrared1 - mode
	Star1 - direction
	Star2 - direction
	GroundStation4 - direction
	Star3 - direction
	GroundStation0 - direction
	Phenomenon5 - direction
	Planet6 - direction
	Phenomenon7 - direction
	Planet8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 infrared1)
	(calibration_target instrument0 Star3)
	(supports instrument1 infrared1)
	(supports instrument1 infrared0)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
)
(:goal (and
	(pointing satellite0 GroundStation0)
	(have_image Phenomenon5 infrared0)
	(have_image Planet6 infrared1)
	(have_image Phenomenon7 infrared1)
	(have_image Planet8 infrared1)
	(have_image Phenomenon9 infrared0)
))

)
