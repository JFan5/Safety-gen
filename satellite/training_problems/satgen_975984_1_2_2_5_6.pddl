; params: satgen 975984 1 2 2 5 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	thermograph1 - mode
	thermograph0 - mode
	GroundStation1 - direction
	Star2 - direction
	GroundStation4 - direction
	Star3 - direction
	Star0 - direction
	Planet5 - direction
	Phenomenon6 - direction
	Planet7 - direction
	Star8 - direction
	Phenomenon9 - direction
	Phenomenon10 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 Star3)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star8)
)
(:goal (and
	(have_image Planet5 thermograph1)
	(have_image Phenomenon6 thermograph0)
	(have_image Planet7 thermograph1)
	(have_image Star8 thermograph0)
	(have_image Phenomenon9 thermograph0)
	(have_image Phenomenon10 thermograph1)
))

)
