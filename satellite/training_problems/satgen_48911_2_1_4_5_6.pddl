; params: satgen 48911 2 1 4 5 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph0 - mode
	thermograph3 - mode
	thermograph1 - mode
	thermograph2 - mode
	Star0 - direction
	GroundStation1 - direction
	GroundStation3 - direction
	Star4 - direction
	GroundStation2 - direction
	Star5 - direction
	Planet6 - direction
	Star7 - direction
	Star8 - direction
	Star9 - direction
	Star10 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 thermograph3)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation3)
	(supports instrument1 thermograph1)
	(supports instrument1 spectrograph0)
	(supports instrument1 thermograph2)
	(calibration_target instrument1 GroundStation2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star7)
)
(:goal (and
	(have_image Star5 thermograph3)
	(have_image Planet6 thermograph2)
	(have_image Star7 spectrograph0)
	(have_image Star8 spectrograph0)
	(have_image Star9 thermograph1)
	(have_image Star10 thermograph3)
))

)
