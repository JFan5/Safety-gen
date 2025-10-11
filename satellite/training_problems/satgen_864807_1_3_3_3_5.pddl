; params: satgen 864807 1 3 3 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph2 - mode
	thermograph0 - mode
	spectrograph1 - mode
	Star0 - direction
	Star2 - direction
	GroundStation1 - direction
	Phenomenon3 - direction
	Planet4 - direction
	Phenomenon5 - direction
	Star6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 thermograph0)
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon3)
)
(:goal (and
	(have_image Phenomenon3 thermograph0)
	(have_image Planet4 thermograph0)
	(have_image Phenomenon5 thermograph0)
	(have_image Star6 spectrograph1)
	(have_image Phenomenon7 spectrograph2)
))

)
