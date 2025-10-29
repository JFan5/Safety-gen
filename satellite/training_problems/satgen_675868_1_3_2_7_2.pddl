; params: satgen 675868 1 3 2 7 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	image0 - mode
	infrared1 - mode
	Star1 - direction
	GroundStation2 - direction
	Star3 - direction
	GroundStation4 - direction
	Star6 - direction
	GroundStation5 - direction
	Star0 - direction
	Phenomenon7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 infrared1)
	(calibration_target instrument0 GroundStation5)
	(supports instrument1 infrared1)
	(supports instrument1 image0)
	(calibration_target instrument1 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
)
(:goal (and
	(have_image Phenomenon7 infrared1)
	(have_image Planet8 infrared1)
))

)
