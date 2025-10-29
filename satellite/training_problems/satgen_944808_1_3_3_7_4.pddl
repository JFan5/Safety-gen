; params: satgen 944808 1 3 3 7 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared2 - mode
	thermograph0 - mode
	infrared1 - mode
	GroundStation0 - direction
	Star2 - direction
	Star3 - direction
	GroundStation4 - direction
	GroundStation6 - direction
	Star1 - direction
	Star5 - direction
	Star7 - direction
	Star8 - direction
	Star9 - direction
	Star10 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 thermograph0)
	(supports instrument0 infrared1)
	(calibration_target instrument0 Star5)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
)
(:goal (and
	(pointing satellite0 Star1)
	(have_image Star7 thermograph0)
	(have_image Star8 infrared1)
	(have_image Star9 thermograph0)
	(have_image Star10 thermograph0)
))

)
