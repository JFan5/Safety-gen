; params: satgen 629025 1 1 3 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph0 - mode
	image1 - mode
	infrared2 - mode
	Star0 - direction
	GroundStation1 - direction
	Star2 - direction
	Phenomenon3 - direction
	Planet4 - direction
	Star5 - direction
	Planet6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 image1)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star5)
)
(:goal (and
	(have_image Phenomenon3 infrared2)
	(have_image Planet4 image1)
	(have_image Star5 thermograph0)
	(have_image Planet6 image1)
	(have_image Phenomenon7 thermograph0)
))

)
