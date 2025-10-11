; params: satgen 768559 1 1 3 3 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph1 - mode
	thermograph0 - mode
	image2 - mode
	GroundStation0 - direction
	Star2 - direction
	GroundStation1 - direction
	Star3 - direction
	Phenomenon4 - direction
	Phenomenon5 - direction
	Phenomenon6 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 spectrograph1)
	(supports instrument0 image2)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
)
(:goal (and
	(pointing satellite0 Phenomenon6)
	(have_image Star3 spectrograph1)
	(have_image Phenomenon4 thermograph0)
	(have_image Phenomenon5 spectrograph1)
	(have_image Phenomenon6 image2)
))

)
