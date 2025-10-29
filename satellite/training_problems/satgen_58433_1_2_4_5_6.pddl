; params: satgen 58433 1 2 4 5 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	spectrograph1 - mode
	image3 - mode
	spectrograph2 - mode
	infrared0 - mode
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	GroundStation0 - direction
	GroundStation4 - direction
	Planet5 - direction
	Phenomenon6 - direction
	Phenomenon7 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
	Phenomenon10 - direction
)
(:init
	(supports instrument0 infrared0)
	(calibration_target instrument0 GroundStation0)
	(supports instrument1 infrared0)
	(supports instrument1 image3)
	(supports instrument1 spectrograph2)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 GroundStation4)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon7)
)
(:goal (and
	(have_image Planet5 image3)
	(have_image Phenomenon6 spectrograph1)
	(have_image Phenomenon7 infrared0)
	(have_image Phenomenon8 image3)
	(have_image Phenomenon9 spectrograph2)
	(have_image Phenomenon10 spectrograph1)
))

)
