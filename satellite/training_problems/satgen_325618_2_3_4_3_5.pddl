; params: satgen 325618 2 3 4 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	thermograph0 - mode
	image3 - mode
	spectrograph2 - mode
	image1 - mode
	GroundStation2 - direction
	GroundStation0 - direction
	GroundStation1 - direction
	Planet3 - direction
	Phenomenon4 - direction
	Planet5 - direction
	Star6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 spectrograph2)
	(supports instrument0 image1)
	(supports instrument0 image3)
	(calibration_target instrument0 GroundStation0)
	(supports instrument1 thermograph0)
	(supports instrument1 image1)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star6)
	(supports instrument2 spectrograph2)
	(supports instrument2 image1)
	(calibration_target instrument2 GroundStation1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet3)
)
(:goal (and
	(pointing satellite0 Star7)
	(pointing satellite1 GroundStation0)
	(have_image Planet3 image1)
	(have_image Phenomenon4 image1)
	(have_image Planet5 spectrograph2)
	(have_image Star6 spectrograph2)
	(have_image Star7 image3)
))

)
