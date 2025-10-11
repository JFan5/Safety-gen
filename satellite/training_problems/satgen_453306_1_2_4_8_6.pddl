; params: satgen 453306 1 2 4 8 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	infrared0 - mode
	spectrograph2 - mode
	infrared1 - mode
	image3 - mode
	Star0 - direction
	Star3 - direction
	Star4 - direction
	GroundStation5 - direction
	GroundStation7 - direction
	Star1 - direction
	Star2 - direction
	Star6 - direction
	Planet8 - direction
	Planet9 - direction
	Star10 - direction
	Planet11 - direction
	Star12 - direction
	Star13 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 image3)
	(calibration_target instrument0 Star2)
	(calibration_target instrument0 Star1)
	(supports instrument1 spectrograph2)
	(supports instrument1 infrared1)
	(supports instrument1 infrared0)
	(calibration_target instrument1 Star6)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star13)
)
(:goal (and
	(have_image Planet8 image3)
	(have_image Planet9 image3)
	(have_image Star10 image3)
	(have_image Planet11 infrared0)
	(have_image Star12 infrared1)
	(have_image Star13 infrared1)
))

)
