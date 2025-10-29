; params: satgen 298352 2 2 2 5 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image0 - mode
	thermograph1 - mode
	GroundStation1 - direction
	Star3 - direction
	GroundStation4 - direction
	Star2 - direction
	GroundStation0 - direction
	Phenomenon5 - direction
	Phenomenon6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 thermograph1)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon6)
	(supports instrument1 thermograph1)
	(supports instrument1 image0)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation0)
)
(:goal (and
	(pointing satellite1 Planet7)
	(have_image Phenomenon5 thermograph1)
	(have_image Phenomenon6 thermograph1)
	(have_image Planet7 image0)
))

)
