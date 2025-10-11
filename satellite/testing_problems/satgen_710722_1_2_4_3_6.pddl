; params: satgen 710722 1 2 4 3 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	thermograph0 - mode
	spectrograph2 - mode
	image1 - mode
	thermograph3 - mode
	Star1 - direction
	GroundStation0 - direction
	Star2 - direction
	Star3 - direction
	Planet4 - direction
	Phenomenon5 - direction
	Planet6 - direction
	Phenomenon7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 thermograph3)
	(supports instrument0 spectrograph2)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 GroundStation0)
	(supports instrument1 image1)
	(supports instrument1 thermograph0)
	(supports instrument1 thermograph3)
	(calibration_target instrument1 Star2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet8)
)
(:goal (and
	(pointing satellite0 Phenomenon7)
	(have_image Star3 thermograph0)
	(have_image Planet4 image1)
	(have_image Phenomenon5 thermograph0)
	(have_image Planet6 spectrograph2)
	(have_image Phenomenon7 spectrograph2)
	(have_image Planet8 thermograph0)
))

)
