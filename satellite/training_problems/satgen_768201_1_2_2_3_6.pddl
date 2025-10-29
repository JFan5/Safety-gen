; params: satgen 768201 1 2 2 3 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared0 - mode
	infrared1 - mode
	Star1 - direction
	Star2 - direction
	Star0 - direction
	Phenomenon3 - direction
	Planet4 - direction
	Star5 - direction
	Planet6 - direction
	Planet7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 infrared1)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet6)
)
(:goal (and
	(have_image Phenomenon3 infrared1)
	(have_image Planet4 infrared1)
	(have_image Star5 infrared0)
	(have_image Planet6 infrared1)
	(have_image Planet7 infrared1)
	(have_image Planet8 infrared1)
))

)
