; params: satgen 398143 1 3 3 7 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared2 - mode
	thermograph0 - mode
	infrared1 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	Star2 - direction
	Star4 - direction
	GroundStation5 - direction
	GroundStation6 - direction
	GroundStation3 - direction
	Planet7 - direction
	Planet8 - direction
	Phenomenon9 - direction
	Phenomenon10 - direction
	Star11 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 thermograph0)
	(supports instrument0 infrared2)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star11)
)
(:goal (and
	(have_image Planet7 infrared2)
	(have_image Planet8 infrared1)
	(have_image Phenomenon9 infrared2)
	(have_image Phenomenon10 infrared1)
	(have_image Star11 thermograph0)
))

)
