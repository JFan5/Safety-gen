; params: satgen 454530 2 2 4 5 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared2 - mode
	thermograph0 - mode
	infrared3 - mode
	thermograph1 - mode
	Star2 - direction
	GroundStation3 - direction
	Star4 - direction
	Star1 - direction
	GroundStation0 - direction
	Star5 - direction
	Planet6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 infrared3)
	(supports instrument0 infrared2)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
	(supports instrument1 thermograph1)
	(supports instrument1 thermograph0)
	(supports instrument1 infrared3)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star7)
)
(:goal (and
	(pointing satellite0 Star5)
	(pointing satellite1 Planet6)
	(have_image Star5 infrared3)
	(have_image Planet6 infrared2)
	(have_image Star7 infrared3)
))

)
