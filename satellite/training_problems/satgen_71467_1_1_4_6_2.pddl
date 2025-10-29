; params: satgen 71467 1 1 4 6 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph1 - mode
	image2 - mode
	spectrograph3 - mode
	image0 - mode
	Star1 - direction
	Star3 - direction
	Star4 - direction
	GroundStation5 - direction
	GroundStation0 - direction
	GroundStation2 - direction
	Planet6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 image2)
	(supports instrument0 spectrograph3)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 GroundStation2)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation5)
)
(:goal (and
	(have_image Planet6 thermograph1)
	(have_image Planet7 thermograph1)
))

)
