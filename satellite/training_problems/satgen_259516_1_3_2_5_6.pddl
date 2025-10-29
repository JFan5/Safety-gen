; params: satgen 259516 1 3 2 5 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph0 - mode
	infrared1 - mode
	Star0 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	Star4 - direction
	Star1 - direction
	Phenomenon5 - direction
	Planet6 - direction
	Phenomenon7 - direction
	Phenomenon8 - direction
	Star9 - direction
	Star10 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
)
(:goal (and
	(have_image Phenomenon5 infrared1)
	(have_image Planet6 infrared1)
	(have_image Phenomenon7 infrared1)
	(have_image Phenomenon8 infrared1)
	(have_image Star9 thermograph0)
	(have_image Star10 thermograph0)
))

)
