; params: satgen 959351 2 2 4 8 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared3 - mode
	infrared1 - mode
	infrared2 - mode
	thermograph0 - mode
	GroundStation1 - direction
	Star2 - direction
	Star3 - direction
	Star5 - direction
	Star7 - direction
	Star0 - direction
	Star6 - direction
	Star4 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
	Star10 - direction
	Star11 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 infrared2)
	(calibration_target instrument0 Star6)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon9)
	(supports instrument1 infrared3)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 Star4)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon8)
)
(:goal (and
	(have_image Phenomenon8 infrared1)
	(have_image Phenomenon9 infrared3)
	(have_image Star10 infrared2)
	(have_image Star11 thermograph0)
))

)
