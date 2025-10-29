; params: satgen 408090 2 3 4 7 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	instrument3 - instrument
	infrared0 - mode
	image3 - mode
	spectrograph2 - mode
	spectrograph1 - mode
	GroundStation1 - direction
	Star3 - direction
	GroundStation5 - direction
	Star0 - direction
	Star4 - direction
	Star6 - direction
	GroundStation2 - direction
	Planet7 - direction
	Phenomenon8 - direction
	Star9 - direction
	Star10 - direction
	Planet11 - direction
)
(:init
	(supports instrument0 image3)
	(supports instrument0 infrared0)
	(calibration_target instrument0 GroundStation5)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet11)
	(supports instrument1 spectrograph1)
	(supports instrument1 infrared0)
	(supports instrument1 image3)
	(calibration_target instrument1 Star0)
	(supports instrument2 image3)
	(supports instrument2 infrared0)
	(supports instrument2 spectrograph2)
	(calibration_target instrument2 Star4)
	(supports instrument3 infrared0)
	(supports instrument3 image3)
	(calibration_target instrument3 GroundStation2)
	(calibration_target instrument3 Star6)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet11)
)
(:goal (and
	(pointing satellite0 Planet7)
	(pointing satellite1 Planet11)
	(have_image Planet7 spectrograph1)
	(have_image Phenomenon8 spectrograph2)
	(have_image Star9 spectrograph2)
	(have_image Star10 spectrograph2)
	(have_image Planet11 spectrograph1)
))

)
