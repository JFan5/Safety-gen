; params: satgen 905090 1 3 3 8 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared1 - mode
	image0 - mode
	infrared2 - mode
	Star0 - direction
	GroundStation2 - direction
	Star3 - direction
	GroundStation4 - direction
	GroundStation5 - direction
	Star6 - direction
	GroundStation7 - direction
	GroundStation1 - direction
	Planet8 - direction
	Phenomenon9 - direction
	Planet10 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 infrared2)
	(supports instrument0 image0)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet10)
)
(:goal (and
	(have_image Planet8 image0)
	(have_image Phenomenon9 infrared2)
	(have_image Planet10 image0)
))

)
