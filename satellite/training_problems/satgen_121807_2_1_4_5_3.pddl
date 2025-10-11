; params: satgen 121807 2 1 4 5 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph0 - mode
	spectrograph2 - mode
	thermograph1 - mode
	image3 - mode
	Star0 - direction
	GroundStation2 - direction
	Star4 - direction
	Star1 - direction
	GroundStation3 - direction
	Star5 - direction
	Planet6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 image3)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
	(supports instrument1 spectrograph0)
	(supports instrument1 thermograph1)
	(supports instrument1 image3)
	(supports instrument1 spectrograph2)
	(calibration_target instrument1 GroundStation3)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet6)
)
(:goal (and
	(have_image Star5 spectrograph0)
	(have_image Planet6 image3)
	(have_image Star7 image3)
))

)
