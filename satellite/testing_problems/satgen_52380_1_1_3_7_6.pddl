; params: satgen 52380 1 1 3 7 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image1 - mode
	infrared2 - mode
	thermograph0 - mode
	GroundStation0 - direction
	Star1 - direction
	Star2 - direction
	Star3 - direction
	GroundStation4 - direction
	GroundStation6 - direction
	Star5 - direction
	Phenomenon7 - direction
	Star8 - direction
	Star9 - direction
	Planet10 - direction
	Phenomenon11 - direction
	Phenomenon12 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 thermograph0)
	(supports instrument0 image1)
	(calibration_target instrument0 Star5)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation4)
)
(:goal (and
	(pointing satellite0 Phenomenon7)
	(have_image Phenomenon7 thermograph0)
	(have_image Star8 thermograph0)
	(have_image Star9 thermograph0)
	(have_image Planet10 thermograph0)
	(have_image Phenomenon11 infrared2)
	(have_image Phenomenon12 infrared2)
))

)
