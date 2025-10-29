; params: satgen 661673 1 2 2 6 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared1 - mode
	infrared0 - mode
	GroundStation1 - direction
	Star2 - direction
	GroundStation3 - direction
	Star4 - direction
	Star5 - direction
	Star0 - direction
	Planet6 - direction
	Phenomenon7 - direction
	Planet8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
)
(:goal (and
	(pointing satellite0 Planet6)
	(have_image Planet6 infrared1)
	(have_image Phenomenon7 infrared0)
	(have_image Planet8 infrared0)
	(have_image Phenomenon9 infrared0)
))

)
