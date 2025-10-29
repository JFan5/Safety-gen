; params: satgen 171434 1 2 2 7 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph1 - mode
	thermograph0 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	Star4 - direction
	Star5 - direction
	Star6 - direction
	Star3 - direction
	Phenomenon7 - direction
	Star8 - direction
	Phenomenon9 - direction
	Star10 - direction
	Phenomenon11 - direction
	Planet12 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
)
(:goal (and
	(have_image Phenomenon7 spectrograph1)
	(have_image Star8 thermograph0)
	(have_image Phenomenon9 thermograph0)
	(have_image Star10 spectrograph1)
	(have_image Phenomenon11 thermograph0)
	(have_image Planet12 spectrograph1)
))

)
