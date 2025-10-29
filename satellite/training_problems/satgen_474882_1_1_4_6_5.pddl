; params: satgen 474882 1 1 4 6 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared1 - mode
	spectrograph2 - mode
	spectrograph3 - mode
	infrared0 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation5 - direction
	Star3 - direction
	Star4 - direction
	Phenomenon6 - direction
	Phenomenon7 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
	Phenomenon10 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 spectrograph3)
	(supports instrument0 infrared0)
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 Star4)
	(calibration_target instrument0 Star3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation5)
)
(:goal (and
	(pointing satellite0 Phenomenon8)
	(have_image Phenomenon6 infrared0)
	(have_image Phenomenon7 spectrograph3)
	(have_image Phenomenon8 infrared1)
	(have_image Phenomenon9 infrared0)
	(have_image Phenomenon10 spectrograph2)
))

)
