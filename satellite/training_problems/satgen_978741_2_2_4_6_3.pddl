; params: satgen 978741 2 2 4 6 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	image2 - mode
	spectrograph1 - mode
	image0 - mode
	thermograph3 - mode
	GroundStation0 - direction
	GroundStation3 - direction
	Star4 - direction
	Star2 - direction
	Star1 - direction
	Star5 - direction
	Planet6 - direction
	Star7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 spectrograph1)
	(supports instrument0 thermograph3)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
	(supports instrument1 thermograph3)
	(supports instrument1 spectrograph1)
	(supports instrument1 image0)
	(calibration_target instrument1 Star2)
	(calibration_target instrument1 Star1)
	(supports instrument2 image2)
	(supports instrument2 image0)
	(calibration_target instrument2 Star5)
	(calibration_target instrument2 Star1)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet6)
)
(:goal (and
	(have_image Planet6 spectrograph1)
	(have_image Star7 spectrograph1)
	(have_image Planet8 thermograph3)
))

)
