; params: satgen 36131 1 1 4 5 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph0 - mode
	image3 - mode
	thermograph1 - mode
	image2 - mode
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	Star4 - direction
	Star0 - direction
	Star5 - direction
	Planet6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 image3)
	(supports instrument0 thermograph1)
	(supports instrument0 image2)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star5)
)
(:goal (and
	(pointing satellite0 GroundStation2)
	(have_image Star5 thermograph1)
	(have_image Planet6 image2)
	(have_image Planet7 image2)
))

)
