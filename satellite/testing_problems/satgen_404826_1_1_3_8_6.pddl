; params: satgen 404826 1 1 3 8 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph1 - mode
	thermograph0 - mode
	spectrograph2 - mode
	Star1 - direction
	Star2 - direction
	GroundStation3 - direction
	GroundStation4 - direction
	GroundStation5 - direction
	Star7 - direction
	GroundStation6 - direction
	GroundStation0 - direction
	Planet8 - direction
	Phenomenon9 - direction
	Star10 - direction
	Star11 - direction
	Phenomenon12 - direction
	Planet13 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 thermograph0)
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 GroundStation0)
	(calibration_target instrument0 GroundStation6)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
)
(:goal (and
	(have_image Planet8 thermograph1)
	(have_image Phenomenon9 thermograph0)
	(have_image Star10 thermograph0)
	(have_image Star11 thermograph1)
	(have_image Phenomenon12 thermograph0)
	(have_image Planet13 spectrograph2)
))

)
