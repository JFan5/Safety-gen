; params: satgen 305040 1 1 2 8 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph1 - mode
	infrared0 - mode
	Star0 - direction
	GroundStation1 - direction
	GroundStation3 - direction
	GroundStation4 - direction
	GroundStation5 - direction
	Star6 - direction
	Star7 - direction
	Star2 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation5)
)
(:goal (and
	(have_image Phenomenon8 spectrograph1)
	(have_image Phenomenon9 spectrograph1)
))

)
