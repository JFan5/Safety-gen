; params: satgen 119265 2 3 4 6 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	satellite1 - satellite
	instrument3 - instrument
	instrument4 - instrument
	thermograph2 - mode
	image1 - mode
	spectrograph3 - mode
	spectrograph0 - mode
	GroundStation0 - direction
	Star5 - direction
	Star2 - direction
	GroundStation1 - direction
	Star3 - direction
	Star4 - direction
	Phenomenon6 - direction
	Star7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 spectrograph3)
	(supports instrument0 thermograph2)
	(calibration_target instrument0 Star2)
	(supports instrument1 image1)
	(calibration_target instrument1 GroundStation1)
	(supports instrument2 image1)
	(supports instrument2 spectrograph0)
	(supports instrument2 thermograph2)
	(calibration_target instrument2 Star3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star8)
	(supports instrument3 thermograph2)
	(supports instrument3 spectrograph3)
	(supports instrument3 image1)
	(calibration_target instrument3 Star3)
	(supports instrument4 spectrograph3)
	(supports instrument4 thermograph2)
	(calibration_target instrument4 Star4)
	(calibration_target instrument4 Star3)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation0)
)
(:goal (and
	(have_image Phenomenon6 spectrograph3)
	(have_image Star7 spectrograph3)
	(have_image Star8 spectrograph3)
))

)
