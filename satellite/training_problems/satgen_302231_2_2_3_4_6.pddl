; params: satgen 302231 2 2 3 4 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph2 - mode
	thermograph0 - mode
	image1 - mode
	GroundStation1 - direction
	Star3 - direction
	GroundStation0 - direction
	GroundStation2 - direction
	Phenomenon4 - direction
	Star5 - direction
	Planet6 - direction
	Planet7 - direction
	Phenomenon8 - direction
	Planet9 - direction
)
(:init
	(supports instrument0 spectrograph2)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
	(supports instrument1 image1)
	(supports instrument1 spectrograph2)
	(calibration_target instrument1 GroundStation2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon4)
)
(:goal (and
	(have_image Phenomenon4 thermograph0)
	(have_image Star5 thermograph0)
	(have_image Planet6 image1)
	(have_image Planet7 image1)
	(have_image Phenomenon8 spectrograph2)
	(have_image Planet9 image1)
))

)
