; params: satgen 109288 1 2 3 3 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	infrared1 - mode
	thermograph2 - mode
	spectrograph0 - mode
	Star0 - direction
	Star2 - direction
	GroundStation1 - direction
	Star3 - direction
	Star4 - direction
	Star5 - direction
	Star6 - direction
	Star7 - direction
	Phenomenon8 - direction
)
(:init
	(supports instrument0 infrared1)
	(calibration_target instrument0 Star2)
	(supports instrument1 thermograph2)
	(supports instrument1 infrared1)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 GroundStation1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star5)
)
(:goal (and
	(pointing satellite0 Star7)
	(have_image Star3 infrared1)
	(have_image Star4 infrared1)
	(have_image Star5 thermograph2)
	(have_image Star6 infrared1)
	(have_image Star7 thermograph2)
	(have_image Phenomenon8 thermograph2)
))

)
