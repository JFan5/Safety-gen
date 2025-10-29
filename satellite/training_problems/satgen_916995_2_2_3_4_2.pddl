; params: satgen 916995 2 2 3 4 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	spectrograph2 - mode
	thermograph1 - mode
	thermograph0 - mode
	Star0 - direction
	Star3 - direction
	Star1 - direction
	GroundStation2 - direction
	Planet4 - direction
	Star5 - direction
)
(:init
	(supports instrument0 thermograph0)
	(calibration_target instrument0 GroundStation2)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 Star1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star5)
	(supports instrument2 thermograph0)
	(supports instrument2 spectrograph2)
	(supports instrument2 thermograph1)
	(calibration_target instrument2 GroundStation2)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet4)
)
(:goal (and
	(pointing satellite0 Star5)
	(have_image Planet4 thermograph1)
	(have_image Star5 thermograph0)
))

)
