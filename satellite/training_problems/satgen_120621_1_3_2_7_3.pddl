; params: satgen 120621 1 3 2 7 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	infrared1 - mode
	spectrograph0 - mode
	GroundStation2 - direction
	Star3 - direction
	GroundStation6 - direction
	GroundStation4 - direction
	GroundStation1 - direction
	Star0 - direction
	Star5 - direction
	Star7 - direction
	Phenomenon8 - direction
	Planet9 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 GroundStation1)
	(calibration_target instrument0 GroundStation4)
	(supports instrument1 infrared1)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 Star5)
	(calibration_target instrument1 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star5)
)
(:goal (and
	(have_image Star7 spectrograph0)
	(have_image Phenomenon8 infrared1)
	(have_image Planet9 infrared1)
))

)
