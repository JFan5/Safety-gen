; params: satgen 793443 1 2 2 6 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph0 - mode
	spectrograph1 - mode
	Star0 - direction
	Star2 - direction
	Star3 - direction
	Star4 - direction
	Star5 - direction
	Star1 - direction
	Phenomenon6 - direction
	Planet7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet7)
)
(:goal (and
	(pointing satellite0 Planet8)
	(have_image Phenomenon6 thermograph0)
	(have_image Planet7 thermograph0)
	(have_image Planet8 spectrograph1)
))

)
