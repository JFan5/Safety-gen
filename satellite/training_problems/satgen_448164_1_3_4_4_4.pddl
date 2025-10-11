; params: satgen 448164 1 3 4 4 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	thermograph0 - mode
	image3 - mode
	thermograph2 - mode
	infrared1 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	GroundStation3 - direction
	Star2 - direction
	Planet4 - direction
	Planet5 - direction
	Phenomenon6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 image3)
	(calibration_target instrument0 GroundStation3)
	(supports instrument1 thermograph2)
	(supports instrument1 infrared1)
	(calibration_target instrument1 Star2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
)
(:goal (and
	(have_image Planet4 thermograph0)
	(have_image Planet5 image3)
	(have_image Phenomenon6 thermograph2)
	(have_image Phenomenon7 thermograph2)
))

)
