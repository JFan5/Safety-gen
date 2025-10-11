; params: satgen 553047 1 3 4 3 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	thermograph0 - mode
	spectrograph2 - mode
	image3 - mode
	image1 - mode
	Star1 - direction
	GroundStation0 - direction
	GroundStation2 - direction
	Planet3 - direction
	Phenomenon4 - direction
)
(:init
	(supports instrument0 image3)
	(supports instrument0 spectrograph2)
	(supports instrument0 image1)
	(calibration_target instrument0 GroundStation0)
	(supports instrument1 spectrograph2)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 GroundStation0)
	(supports instrument2 image1)
	(calibration_target instrument2 GroundStation2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
)
(:goal (and
	(have_image Planet3 spectrograph2)
	(have_image Phenomenon4 image1)
))

)
