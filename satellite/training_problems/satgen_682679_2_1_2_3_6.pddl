; params: satgen 682679 2 1 2 3 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared1 - mode
	thermograph0 - mode
	GroundStation2 - direction
	Star0 - direction
	Star1 - direction
	Phenomenon3 - direction
	Planet4 - direction
	Planet5 - direction
	Phenomenon6 - direction
	Star7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
	(supports instrument1 thermograph0)
	(supports instrument1 infrared1)
	(calibration_target instrument1 Star1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet8)
)
(:goal (and
	(have_image Phenomenon3 thermograph0)
	(have_image Planet4 thermograph0)
	(have_image Planet5 infrared1)
	(have_image Phenomenon6 infrared1)
	(have_image Star7 infrared1)
	(have_image Planet8 infrared1)
))

)
