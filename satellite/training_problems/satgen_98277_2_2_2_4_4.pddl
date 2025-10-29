; params: satgen 98277 2 2 2 4 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	thermograph0 - mode
	image1 - mode
	GroundStation1 - direction
	Star2 - direction
	GroundStation3 - direction
	GroundStation0 - direction
	Star4 - direction
	Phenomenon5 - direction
	Phenomenon6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 image1)
	(calibration_target instrument0 Star2)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 Star2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation1)
	(supports instrument2 image1)
	(supports instrument2 thermograph0)
	(calibration_target instrument2 GroundStation3)
	(supports instrument3 image1)
	(supports instrument3 thermograph0)
	(calibration_target instrument3 GroundStation0)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star4)
)
(:goal (and
	(pointing satellite0 Phenomenon5)
	(pointing satellite1 GroundStation1)
	(have_image Star4 image1)
	(have_image Phenomenon5 image1)
	(have_image Phenomenon6 image1)
	(have_image Star7 image1)
))

)
