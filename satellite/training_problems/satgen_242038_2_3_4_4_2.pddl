; params: satgen 242038 2 3 4 4 2
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
	thermograph3 - mode
	image1 - mode
	thermograph2 - mode
	image0 - mode
	Star1 - direction
	GroundStation3 - direction
	Star2 - direction
	GroundStation0 - direction
	Star4 - direction
	Star5 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 image1)
	(calibration_target instrument0 GroundStation0)
	(supports instrument1 thermograph3)
	(supports instrument1 image1)
	(supports instrument1 thermograph2)
	(calibration_target instrument1 GroundStation0)
	(supports instrument2 thermograph2)
	(supports instrument2 image0)
	(calibration_target instrument2 Star2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation3)
	(supports instrument3 image1)
	(supports instrument3 thermograph3)
	(supports instrument3 image0)
	(calibration_target instrument3 Star2)
	(supports instrument4 thermograph2)
	(supports instrument4 image1)
	(supports instrument4 image0)
	(calibration_target instrument4 Star2)
	(supports instrument5 thermograph3)
	(supports instrument5 image1)
	(calibration_target instrument5 GroundStation0)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(on_board instrument5 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star4)
)
(:goal (and
	(have_image Star4 thermograph2)
	(have_image Star5 image1)
))

)
