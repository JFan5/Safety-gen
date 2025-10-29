; params: satgen 777950 2 3 3 4 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	instrument3 - instrument
	infrared1 - mode
	thermograph2 - mode
	image0 - mode
	GroundStation2 - direction
	Star0 - direction
	Star3 - direction
	GroundStation1 - direction
	Planet4 - direction
	Planet5 - direction
	Star6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 thermograph2)
	(supports instrument0 infrared1)
	(supports instrument0 image0)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star7)
	(supports instrument1 image0)
	(supports instrument1 thermograph2)
	(calibration_target instrument1 Star3)
	(supports instrument2 infrared1)
	(supports instrument2 thermograph2)
	(calibration_target instrument2 Star3)
	(supports instrument3 infrared1)
	(supports instrument3 image0)
	(supports instrument3 thermograph2)
	(calibration_target instrument3 GroundStation1)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star7)
)
(:goal (and
	(have_image Planet4 image0)
	(have_image Planet5 image0)
	(have_image Star6 infrared1)
	(have_image Star7 thermograph2)
))

)
