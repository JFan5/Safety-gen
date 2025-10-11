; params: satgen 328861 2 2 4 6 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	infrared3 - mode
	spectrograph0 - mode
	image1 - mode
	spectrograph2 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	GroundStation3 - direction
	GroundStation2 - direction
	GroundStation5 - direction
	GroundStation4 - direction
	Phenomenon6 - direction
	Star7 - direction
	Planet8 - direction
	Star9 - direction
	Phenomenon10 - direction
	Planet11 - direction
)
(:init
	(supports instrument0 infrared3)
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
	(supports instrument1 spectrograph0)
	(supports instrument1 infrared3)
	(supports instrument1 image1)
	(calibration_target instrument1 GroundStation5)
	(calibration_target instrument1 GroundStation2)
	(supports instrument2 infrared3)
	(calibration_target instrument2 GroundStation4)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation0)
)
(:goal (and
	(pointing satellite0 GroundStation4)
	(pointing satellite1 GroundStation3)
	(have_image Phenomenon6 infrared3)
	(have_image Star7 spectrograph0)
	(have_image Planet8 infrared3)
	(have_image Star9 spectrograph0)
	(have_image Phenomenon10 spectrograph2)
	(have_image Planet11 spectrograph2)
))

)
