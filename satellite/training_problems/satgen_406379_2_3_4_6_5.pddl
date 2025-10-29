; params: satgen 406379 2 3 4 6 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	instrument4 - instrument
	image1 - mode
	spectrograph3 - mode
	spectrograph2 - mode
	thermograph0 - mode
	Star3 - direction
	Star2 - direction
	GroundStation1 - direction
	GroundStation5 - direction
	GroundStation0 - direction
	Star4 - direction
	Planet6 - direction
	Planet7 - direction
	Star8 - direction
	Star9 - direction
	Star10 - direction
)
(:init
	(supports instrument0 spectrograph2)
	(supports instrument0 spectrograph3)
	(supports instrument0 image1)
	(calibration_target instrument0 Star3)
	(supports instrument1 image1)
	(supports instrument1 spectrograph3)
	(calibration_target instrument1 GroundStation1)
	(calibration_target instrument1 Star2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star8)
	(supports instrument2 spectrograph2)
	(supports instrument2 spectrograph3)
	(supports instrument2 thermograph0)
	(calibration_target instrument2 GroundStation5)
	(calibration_target instrument2 GroundStation1)
	(supports instrument3 thermograph0)
	(supports instrument3 spectrograph3)
	(supports instrument3 spectrograph2)
	(calibration_target instrument3 GroundStation0)
	(calibration_target instrument3 Star4)
	(supports instrument4 spectrograph3)
	(supports instrument4 thermograph0)
	(supports instrument4 image1)
	(calibration_target instrument4 Star4)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation5)
)
(:goal (and
	(have_image Planet6 spectrograph2)
	(have_image Planet7 image1)
	(have_image Star8 image1)
	(have_image Star9 spectrograph3)
	(have_image Star10 image1)
))

)
