; params: satgen 359455 2 3 3 3 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	instrument3 - instrument
	image0 - mode
	image2 - mode
	infrared1 - mode
	GroundStation2 - direction
	GroundStation0 - direction
	GroundStation1 - direction
	Star3 - direction
	Planet4 - direction
	Star5 - direction
	Star6 - direction
	Phenomenon7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 image2)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star5)
	(supports instrument1 image0)
	(supports instrument1 image2)
	(supports instrument1 infrared1)
	(calibration_target instrument1 GroundStation0)
	(supports instrument2 infrared1)
	(supports instrument2 image0)
	(supports instrument2 image2)
	(calibration_target instrument2 GroundStation0)
	(supports instrument3 image2)
	(supports instrument3 image0)
	(supports instrument3 infrared1)
	(calibration_target instrument3 GroundStation1)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet8)
)
(:goal (and
	(pointing satellite1 Planet4)
	(have_image Star3 image0)
	(have_image Planet4 image0)
	(have_image Star5 image0)
	(have_image Star6 image0)
	(have_image Phenomenon7 infrared1)
	(have_image Planet8 image2)
))

)
