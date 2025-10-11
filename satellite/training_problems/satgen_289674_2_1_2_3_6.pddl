; params: satgen 289674 2 1 2 3 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph1 - mode
	thermograph0 - mode
	Star0 - direction
	Star2 - direction
	GroundStation1 - direction
	Phenomenon3 - direction
	Star4 - direction
	Planet5 - direction
	Planet6 - direction
	Phenomenon7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
	(supports instrument1 thermograph0)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 GroundStation1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation1)
)
(:goal (and
	(have_image Phenomenon3 thermograph0)
	(have_image Star4 thermograph1)
	(have_image Planet5 thermograph1)
	(have_image Planet6 thermograph0)
	(have_image Phenomenon7 thermograph1)
	(have_image Star8 thermograph0)
))

)
