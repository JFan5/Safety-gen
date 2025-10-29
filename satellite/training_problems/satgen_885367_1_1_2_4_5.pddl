; params: satgen 885367 1 1 2 4 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph1 - mode
	infrared0 - mode
	Star0 - direction
	Star2 - direction
	GroundStation3 - direction
	Star1 - direction
	Star4 - direction
	Star5 - direction
	Planet6 - direction
	Phenomenon7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star0)
)
(:goal (and
	(pointing satellite0 GroundStation3)
	(have_image Star4 infrared0)
	(have_image Star5 infrared0)
	(have_image Planet6 spectrograph1)
	(have_image Phenomenon7 spectrograph1)
	(have_image Planet8 infrared0)
))

)
