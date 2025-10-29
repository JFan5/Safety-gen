; params: satgen 913133 2 1 4 6 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image3 - mode
	spectrograph1 - mode
	thermograph2 - mode
	thermograph0 - mode
	GroundStation1 - direction
	Star3 - direction
	GroundStation4 - direction
	GroundStation5 - direction
	GroundStation2 - direction
	GroundStation0 - direction
	Planet6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 thermograph2)
	(calibration_target instrument0 GroundStation5)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
	(supports instrument1 spectrograph1)
	(supports instrument1 thermograph0)
	(supports instrument1 image3)
	(calibration_target instrument1 GroundStation0)
	(calibration_target instrument1 GroundStation2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation0)
)
(:goal (and
	(have_image Planet6 spectrograph1)
	(have_image Star7 thermograph2)
))

)
