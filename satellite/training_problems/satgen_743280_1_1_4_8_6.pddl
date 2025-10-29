; params: satgen 743280 1 1 4 8 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared2 - mode
	thermograph0 - mode
	thermograph3 - mode
	thermograph1 - mode
	Star0 - direction
	Star1 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	Star4 - direction
	Star6 - direction
	Star7 - direction
	Star5 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
	Star10 - direction
	Phenomenon11 - direction
	Star12 - direction
	Phenomenon13 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 thermograph3)
	(supports instrument0 thermograph1)
	(supports instrument0 infrared2)
	(calibration_target instrument0 Star5)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star6)
)
(:goal (and
	(have_image Phenomenon8 thermograph1)
	(have_image Phenomenon9 infrared2)
	(have_image Star10 thermograph3)
	(have_image Phenomenon11 thermograph3)
	(have_image Star12 thermograph1)
	(have_image Phenomenon13 infrared2)
))

)
