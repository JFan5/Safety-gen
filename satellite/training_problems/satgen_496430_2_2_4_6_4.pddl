; params: satgen 496430 2 2 4 6 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	spectrograph1 - mode
	image3 - mode
	thermograph2 - mode
	thermograph0 - mode
	GroundStation1 - direction
	GroundStation2 - direction
	Star3 - direction
	Star4 - direction
	Star5 - direction
	GroundStation0 - direction
	Phenomenon6 - direction
	Planet7 - direction
	Star8 - direction
	Planet9 - direction
)
(:init
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon6)
	(supports instrument1 spectrograph1)
	(supports instrument1 image3)
	(supports instrument1 thermograph2)
	(calibration_target instrument1 Star4)
	(supports instrument2 thermograph0)
	(supports instrument2 image3)
	(supports instrument2 thermograph2)
	(calibration_target instrument2 GroundStation0)
	(calibration_target instrument2 Star5)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation2)
)
(:goal (and
	(pointing satellite0 Planet9)
	(have_image Phenomenon6 thermograph2)
	(have_image Planet7 spectrograph1)
	(have_image Star8 spectrograph1)
	(have_image Planet9 image3)
))

)
