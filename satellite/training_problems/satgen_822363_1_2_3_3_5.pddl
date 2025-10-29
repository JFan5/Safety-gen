; params: satgen 822363 1 2 3 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph0 - mode
	thermograph2 - mode
	spectrograph1 - mode
	GroundStation1 - direction
	Star2 - direction
	Star0 - direction
	Star3 - direction
	Phenomenon4 - direction
	Planet5 - direction
	Phenomenon6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 thermograph2)
	(supports instrument0 spectrograph1)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon4)
)
(:goal (and
	(have_image Star3 spectrograph1)
	(have_image Phenomenon4 spectrograph0)
	(have_image Planet5 thermograph2)
	(have_image Phenomenon6 spectrograph1)
	(have_image Phenomenon7 thermograph2)
))

)
