; params: satgen 356584 1 3 4 8 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image0 - mode
	thermograph3 - mode
	infrared1 - mode
	thermograph2 - mode
	GroundStation0 - direction
	Star1 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	GroundStation5 - direction
	Star7 - direction
	Star4 - direction
	GroundStation6 - direction
	Planet8 - direction
	Star9 - direction
	Planet10 - direction
)
(:init
	(supports instrument0 thermograph3)
	(supports instrument0 infrared1)
	(supports instrument0 image0)
	(supports instrument0 thermograph2)
	(calibration_target instrument0 GroundStation6)
	(calibration_target instrument0 Star4)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
)
(:goal (and
	(pointing satellite0 GroundStation6)
	(have_image Planet8 thermograph2)
	(have_image Star9 infrared1)
	(have_image Planet10 thermograph2)
))

)
