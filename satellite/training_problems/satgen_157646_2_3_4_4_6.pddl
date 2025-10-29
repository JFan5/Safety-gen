; params: satgen 157646 2 3 4 4 6
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
	spectrograph1 - mode
	spectrograph2 - mode
	infrared0 - mode
	infrared3 - mode
	Star0 - direction
	GroundStation3 - direction
	Star1 - direction
	Star2 - direction
	Phenomenon4 - direction
	Phenomenon5 - direction
	Star6 - direction
	Star7 - direction
	Phenomenon8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 infrared3)
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star0)
	(supports instrument1 infrared0)
	(supports instrument1 spectrograph2)
	(calibration_target instrument1 Star1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon8)
	(supports instrument2 infrared0)
	(supports instrument2 spectrograph2)
	(supports instrument2 spectrograph1)
	(calibration_target instrument2 GroundStation3)
	(supports instrument3 infrared3)
	(calibration_target instrument3 Star1)
	(supports instrument4 infrared3)
	(supports instrument4 spectrograph1)
	(calibration_target instrument4 Star2)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star7)
)
(:goal (and
	(have_image Phenomenon4 infrared0)
	(have_image Phenomenon5 spectrograph2)
	(have_image Star6 spectrograph1)
	(have_image Star7 infrared3)
	(have_image Phenomenon8 infrared0)
	(have_image Star9 spectrograph2)
))

)
