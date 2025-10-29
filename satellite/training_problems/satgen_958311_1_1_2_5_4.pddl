; params: satgen 958311 1 1 2 5 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph1 - mode
	spectrograph0 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	Star2 - direction
	Star3 - direction
	Star4 - direction
	Planet5 - direction
	Star6 - direction
	Phenomenon7 - direction
	Phenomenon8 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 Star4)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
)
(:goal (and
	(pointing satellite0 Planet5)
	(have_image Planet5 spectrograph0)
	(have_image Star6 spectrograph0)
	(have_image Phenomenon7 thermograph1)
	(have_image Phenomenon8 spectrograph0)
))

)
