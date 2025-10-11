; params: satgen 948137 1 1 4 8 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared2 - mode
	spectrograph0 - mode
	thermograph3 - mode
	image1 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	Star5 - direction
	GroundStation6 - direction
	Star7 - direction
	Star4 - direction
	Star8 - direction
	Phenomenon9 - direction
	Planet10 - direction
	Star11 - direction
	Planet12 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 image1)
	(supports instrument0 thermograph3)
	(supports instrument0 infrared2)
	(calibration_target instrument0 Star4)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation3)
)
(:goal (and
	(pointing satellite0 GroundStation0)
	(have_image Star8 thermograph3)
	(have_image Phenomenon9 infrared2)
	(have_image Planet10 image1)
	(have_image Star11 thermograph3)
	(have_image Planet12 infrared2)
))

)
