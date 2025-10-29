; params: satgen 281011 1 3 2 6 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	infrared0 - mode
	thermograph1 - mode
	Star1 - direction
	GroundStation2 - direction
	GroundStation5 - direction
	Star4 - direction
	Star0 - direction
	Star3 - direction
	Star6 - direction
	Phenomenon7 - direction
	Planet8 - direction
	Phenomenon9 - direction
	Phenomenon10 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 Star0)
	(calibration_target instrument0 Star4)
	(supports instrument1 infrared0)
	(calibration_target instrument1 Star3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon9)
)
(:goal (and
	(have_image Star6 thermograph1)
	(have_image Phenomenon7 thermograph1)
	(have_image Planet8 thermograph1)
	(have_image Phenomenon9 thermograph1)
	(have_image Phenomenon10 thermograph1)
))

)
