; params: satgen 900668 2 2 4 8 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph0 - mode
	spectrograph1 - mode
	image2 - mode
	infrared3 - mode
	Star1 - direction
	GroundStation2 - direction
	Star3 - direction
	GroundStation6 - direction
	Star7 - direction
	Star5 - direction
	GroundStation4 - direction
	GroundStation0 - direction
	Star8 - direction
	Planet9 - direction
	Phenomenon10 - direction
	Phenomenon11 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 image2)
	(calibration_target instrument0 Star5)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star7)
	(supports instrument1 image2)
	(supports instrument1 infrared3)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 GroundStation0)
	(calibration_target instrument1 GroundStation4)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet9)
)
(:goal (and
	(have_image Star8 spectrograph1)
	(have_image Planet9 infrared3)
	(have_image Phenomenon10 spectrograph0)
	(have_image Phenomenon11 infrared3)
))

)
