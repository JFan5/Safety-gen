; params: satgen 800284 1 3 4 7 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image3 - mode
	thermograph1 - mode
	thermograph2 - mode
	spectrograph0 - mode
	GroundStation1 - direction
	Star2 - direction
	Star3 - direction
	Star5 - direction
	Star6 - direction
	GroundStation4 - direction
	GroundStation0 - direction
	Star7 - direction
	Phenomenon8 - direction
	Planet9 - direction
	Star10 - direction
	Phenomenon11 - direction
)
(:init
	(supports instrument0 thermograph2)
	(supports instrument0 spectrograph0)
	(supports instrument0 thermograph1)
	(supports instrument0 image3)
	(calibration_target instrument0 GroundStation0)
	(calibration_target instrument0 GroundStation4)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star5)
)
(:goal (and
	(pointing satellite0 Phenomenon11)
	(have_image Star7 image3)
	(have_image Phenomenon8 thermograph2)
	(have_image Planet9 thermograph1)
	(have_image Star10 thermograph1)
	(have_image Phenomenon11 thermograph1)
))

)
