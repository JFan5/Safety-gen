; params: satgen 933765 2 2 2 4 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	thermograph0 - mode
	infrared1 - mode
	Star1 - direction
	Star3 - direction
	GroundStation0 - direction
	Star2 - direction
	Phenomenon4 - direction
	Planet5 - direction
	Star6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 thermograph0)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon4)
	(supports instrument1 thermograph0)
	(supports instrument1 infrared1)
	(calibration_target instrument1 Star2)
	(supports instrument2 thermograph0)
	(supports instrument2 infrared1)
	(calibration_target instrument2 Star2)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star3)
)
(:goal (and
	(pointing satellite0 Star2)
	(pointing satellite1 Star6)
	(have_image Phenomenon4 infrared1)
	(have_image Planet5 thermograph0)
	(have_image Star6 infrared1)
	(have_image Phenomenon7 thermograph0)
))

)
