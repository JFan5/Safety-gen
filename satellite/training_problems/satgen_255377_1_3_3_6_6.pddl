; params: satgen 255377 1 3 3 6 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph1 - mode
	thermograph0 - mode
	image2 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	Star3 - direction
	GroundStation4 - direction
	GroundStation5 - direction
	Star2 - direction
	Star6 - direction
	Planet7 - direction
	Planet8 - direction
	Star9 - direction
	Phenomenon10 - direction
	Star11 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 image2)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star2)
	(calibration_target instrument0 GroundStation5)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
)
(:goal (and
	(pointing satellite0 Phenomenon10)
	(have_image Star6 spectrograph1)
	(have_image Planet7 image2)
	(have_image Planet8 image2)
	(have_image Star9 image2)
	(have_image Phenomenon10 thermograph0)
	(have_image Star11 spectrograph1)
))

)
