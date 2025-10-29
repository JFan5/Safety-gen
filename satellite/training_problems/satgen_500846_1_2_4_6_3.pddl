; params: satgen 500846 1 2 4 6 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image2 - mode
	spectrograph0 - mode
	thermograph1 - mode
	image3 - mode
	Star0 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	GroundStation5 - direction
	Star4 - direction
	Planet6 - direction
	Star7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 image3)
	(supports instrument0 thermograph1)
	(supports instrument0 spectrograph0)
	(supports instrument0 image2)
	(calibration_target instrument0 Star4)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation3)
)
(:goal (and
	(have_image Planet6 image2)
	(have_image Star7 image3)
	(have_image Star8 spectrograph0)
))

)
