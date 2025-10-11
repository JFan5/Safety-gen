; params: satgen 460569 1 3 4 8 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	spectrograph2 - mode
	infrared0 - mode
	thermograph3 - mode
	image1 - mode
	Star0 - direction
	GroundStation4 - direction
	GroundStation5 - direction
	GroundStation6 - direction
	GroundStation7 - direction
	GroundStation3 - direction
	Star1 - direction
	Star2 - direction
	Star8 - direction
	Planet9 - direction
	Star10 - direction
)
(:init
	(supports instrument0 thermograph3)
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 GroundStation3)
	(supports instrument1 infrared0)
	(supports instrument1 spectrograph2)
	(supports instrument1 image1)
	(calibration_target instrument1 Star1)
	(supports instrument2 thermograph3)
	(supports instrument2 infrared0)
	(calibration_target instrument2 Star2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
)
(:goal (and
	(have_image Star8 spectrograph2)
	(have_image Planet9 spectrograph2)
	(have_image Star10 thermograph3)
))

)
