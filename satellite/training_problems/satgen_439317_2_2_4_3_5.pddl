; params: satgen 439317 2 2 4 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	spectrograph1 - mode
	image3 - mode
	image0 - mode
	thermograph2 - mode
	GroundStation2 - direction
	Star0 - direction
	Star1 - direction
	Star3 - direction
	Star4 - direction
	Planet5 - direction
	Planet6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 image3)
	(calibration_target instrument0 GroundStation2)
	(supports instrument1 thermograph2)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
	(supports instrument2 image3)
	(supports instrument2 image0)
	(calibration_target instrument2 Star1)
	(supports instrument3 image0)
	(supports instrument3 image3)
	(calibration_target instrument3 Star1)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star0)
)
(:goal (and
	(pointing satellite1 Planet6)
	(have_image Star3 spectrograph1)
	(have_image Star4 thermograph2)
	(have_image Planet5 spectrograph1)
	(have_image Planet6 image3)
	(have_image Star7 spectrograph1)
))

)
