; params: satgen 226374 1 3 4 8 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	infrared3 - mode
	image0 - mode
	infrared1 - mode
	spectrograph2 - mode
	GroundStation0 - direction
	Star3 - direction
	GroundStation5 - direction
	GroundStation6 - direction
	GroundStation4 - direction
	GroundStation2 - direction
	GroundStation1 - direction
	GroundStation7 - direction
	Planet8 - direction
	Planet9 - direction
	Star10 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 spectrograph2)
	(supports instrument0 infrared3)
	(calibration_target instrument0 GroundStation4)
	(supports instrument1 image0)
	(supports instrument1 infrared1)
	(calibration_target instrument1 GroundStation1)
	(calibration_target instrument1 GroundStation2)
	(supports instrument2 infrared1)
	(calibration_target instrument2 GroundStation7)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
)
(:goal (and
	(pointing satellite0 Planet8)
	(have_image Planet8 infrared3)
	(have_image Planet9 image0)
	(have_image Star10 infrared3)
))

)
