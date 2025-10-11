; params: satgen 552440 1 2 3 4 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph1 - mode
	thermograph0 - mode
	image2 - mode
	Star0 - direction
	Star1 - direction
	Star3 - direction
	GroundStation2 - direction
	Phenomenon4 - direction
	Phenomenon5 - direction
	Star6 - direction
	Star7 - direction
	Phenomenon8 - direction
)
(:init
	(supports instrument0 image2)
	(supports instrument0 thermograph0)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star7)
)
(:goal (and
	(have_image Phenomenon4 image2)
	(have_image Phenomenon5 spectrograph1)
	(have_image Star6 thermograph0)
	(have_image Star7 thermograph0)
	(have_image Phenomenon8 thermograph0)
))

)
