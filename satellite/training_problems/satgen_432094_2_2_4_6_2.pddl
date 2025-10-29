; params: satgen 432094 2 2 4 6 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	infrared1 - mode
	infrared0 - mode
	image3 - mode
	thermograph2 - mode
	GroundStation2 - direction
	Star3 - direction
	Star1 - direction
	GroundStation0 - direction
	Star4 - direction
	GroundStation5 - direction
	Star6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 image3)
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star1)
	(supports instrument1 infrared0)
	(supports instrument1 infrared1)
	(supports instrument1 thermograph2)
	(calibration_target instrument1 GroundStation0)
	(calibration_target instrument1 GroundStation5)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
	(supports instrument2 thermograph2)
	(supports instrument2 infrared1)
	(supports instrument2 infrared0)
	(calibration_target instrument2 Star4)
	(calibration_target instrument2 GroundStation0)
	(supports instrument3 infrared1)
	(calibration_target instrument3 GroundStation5)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star7)
)
(:goal (and
	(have_image Star6 thermograph2)
	(have_image Star7 infrared1)
))

)
