; params: satgen 342812 2 3 2 4 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	satellite1 - satellite
	instrument3 - instrument
	instrument4 - instrument
	instrument5 - instrument
	image1 - mode
	image0 - mode
	Star2 - direction
	Star3 - direction
	GroundStation0 - direction
	GroundStation1 - direction
	Planet4 - direction
	Planet5 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 image0)
	(calibration_target instrument0 GroundStation0)
	(supports instrument1 image0)
	(supports instrument1 image1)
	(calibration_target instrument1 Star2)
	(supports instrument2 image1)
	(supports instrument2 image0)
	(calibration_target instrument2 GroundStation0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
	(supports instrument3 image1)
	(supports instrument3 image0)
	(calibration_target instrument3 Star3)
	(supports instrument4 image1)
	(supports instrument4 image0)
	(calibration_target instrument4 GroundStation0)
	(supports instrument5 image1)
	(calibration_target instrument5 GroundStation1)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(on_board instrument5 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star3)
)
(:goal (and
	(pointing satellite0 Planet4)
	(have_image Planet4 image1)
	(have_image Planet5 image0)
))

)
