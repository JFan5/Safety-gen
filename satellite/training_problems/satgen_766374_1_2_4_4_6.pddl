; params: satgen 766374 1 2 4 4 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	thermograph0 - mode
	thermograph2 - mode
	image1 - mode
	spectrograph3 - mode
	Star2 - direction
	Star3 - direction
	GroundStation0 - direction
	Star1 - direction
	Star4 - direction
	Star5 - direction
	Planet6 - direction
	Star7 - direction
	Star8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 spectrograph3)
	(supports instrument0 image1)
	(calibration_target instrument0 GroundStation0)
	(supports instrument1 thermograph0)
	(supports instrument1 image1)
	(supports instrument1 thermograph2)
	(calibration_target instrument1 Star1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
)
(:goal (and
	(pointing satellite0 Planet6)
	(have_image Star4 image1)
	(have_image Star5 thermograph2)
	(have_image Planet6 image1)
	(have_image Star7 spectrograph3)
	(have_image Star8 image1)
	(have_image Phenomenon9 spectrograph3)
))

)
