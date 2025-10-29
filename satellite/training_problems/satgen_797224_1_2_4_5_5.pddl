; params: satgen 797224 1 2 4 5 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph1 - mode
	thermograph0 - mode
	spectrograph2 - mode
	thermograph3 - mode
	GroundStation0 - direction
	Star1 - direction
	Star2 - direction
	Star3 - direction
	Star4 - direction
	Phenomenon5 - direction
	Planet6 - direction
	Planet7 - direction
	Star8 - direction
	Planet9 - direction
)
(:init
	(supports instrument0 spectrograph2)
	(supports instrument0 thermograph3)
	(supports instrument0 thermograph0)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 Star4)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet6)
)
(:goal (and
	(pointing satellite0 Planet9)
	(have_image Phenomenon5 thermograph1)
	(have_image Planet6 thermograph0)
	(have_image Planet7 spectrograph2)
	(have_image Star8 thermograph1)
	(have_image Planet9 thermograph1)
))

)
