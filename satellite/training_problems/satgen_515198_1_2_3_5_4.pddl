; params: satgen 515198 1 2 3 5 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	image0 - mode
	thermograph1 - mode
	spectrograph2 - mode
	GroundStation1 - direction
	Star3 - direction
	GroundStation4 - direction
	Star0 - direction
	GroundStation2 - direction
	Planet5 - direction
	Planet6 - direction
	Planet7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 image0)
	(calibration_target instrument0 Star0)
	(supports instrument1 spectrograph2)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 GroundStation2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation1)
)
(:goal (and
	(have_image Planet5 thermograph1)
	(have_image Planet6 image0)
	(have_image Planet7 thermograph1)
	(have_image Planet8 thermograph1)
))

)
