; params: satgen 426763 2 2 2 7 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	infrared0 - mode
	thermograph1 - mode
	Star1 - direction
	GroundStation2 - direction
	Star5 - direction
	GroundStation6 - direction
	Star3 - direction
	Star0 - direction
	Star4 - direction
	Star7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 thermograph1)
	(calibration_target instrument0 Star0)
	(calibration_target instrument0 GroundStation6)
	(supports instrument1 infrared0)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 GroundStation6)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
	(supports instrument2 infrared0)
	(calibration_target instrument2 Star3)
	(supports instrument3 infrared0)
	(supports instrument3 thermograph1)
	(calibration_target instrument3 Star4)
	(calibration_target instrument3 Star0)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation2)
)
(:goal (and
	(pointing satellite0 Star5)
	(pointing satellite1 Star4)
	(have_image Star7 thermograph1)
	(have_image Star8 thermograph1)
))

)
