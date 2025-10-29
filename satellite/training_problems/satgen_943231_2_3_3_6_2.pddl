; params: satgen 943231 2 3 3 6 2
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
	image1 - mode
	image2 - mode
	thermograph0 - mode
	Star1 - direction
	Star5 - direction
	Star3 - direction
	Star4 - direction
	GroundStation2 - direction
	GroundStation0 - direction
	Planet6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 image2)
	(supports instrument0 image1)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star5)
	(supports instrument1 thermograph0)
	(supports instrument1 image1)
	(supports instrument1 image2)
	(calibration_target instrument1 Star4)
	(supports instrument2 image1)
	(supports instrument2 image2)
	(supports instrument2 thermograph0)
	(calibration_target instrument2 Star3)
	(calibration_target instrument2 Star5)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star5)
	(supports instrument3 image1)
	(supports instrument3 image2)
	(calibration_target instrument3 Star4)
	(supports instrument4 image1)
	(calibration_target instrument4 GroundStation0)
	(calibration_target instrument4 GroundStation2)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star7)
)
(:goal (and
	(pointing satellite0 Star7)
	(have_image Planet6 image1)
	(have_image Star7 image1)
))

)
