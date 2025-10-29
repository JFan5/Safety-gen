; params: satgen 373359 1 2 2 3 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	thermograph0 - mode
	infrared1 - mode
	GroundStation0 - direction
	Star1 - direction
	Star2 - direction
	Planet3 - direction
	Phenomenon4 - direction
	Star5 - direction
	Planet6 - direction
	Star7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star2)
	(supports instrument1 thermograph0)
	(supports instrument1 infrared1)
	(calibration_target instrument1 Star2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
)
(:goal (and
	(have_image Planet3 thermograph0)
	(have_image Phenomenon4 infrared1)
	(have_image Star5 infrared1)
	(have_image Planet6 infrared1)
	(have_image Star7 thermograph0)
	(have_image Star8 infrared1)
))

)
