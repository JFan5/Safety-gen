; params: satgen 968348 1 3 4 7 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared3 - mode
	infrared1 - mode
	thermograph2 - mode
	thermograph0 - mode
	Star2 - direction
	GroundStation3 - direction
	Star4 - direction
	Star5 - direction
	Star6 - direction
	Star0 - direction
	GroundStation1 - direction
	Star7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 infrared1)
	(supports instrument0 thermograph2)
	(supports instrument0 infrared3)
	(calibration_target instrument0 GroundStation1)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation1)
)
(:goal (and
	(have_image Star7 thermograph2)
	(have_image Star8 infrared1)
))

)
