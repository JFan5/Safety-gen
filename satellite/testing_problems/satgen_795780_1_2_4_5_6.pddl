; params: satgen 795780 1 2 4 5 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	infrared3 - mode
	thermograph0 - mode
	infrared2 - mode
	thermograph1 - mode
	Star0 - direction
	GroundStation2 - direction
	Star3 - direction
	Star1 - direction
	Star4 - direction
	Phenomenon5 - direction
	Planet6 - direction
	Phenomenon7 - direction
	Planet8 - direction
	Star9 - direction
	Star10 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 Star1)
	(supports instrument1 infrared3)
	(supports instrument1 thermograph0)
	(supports instrument1 infrared2)
	(calibration_target instrument1 Star4)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star9)
)
(:goal (and
	(pointing satellite0 Planet6)
	(have_image Phenomenon5 infrared2)
	(have_image Planet6 infrared3)
	(have_image Phenomenon7 infrared2)
	(have_image Planet8 infrared3)
	(have_image Star9 infrared3)
	(have_image Star10 thermograph1)
))

)
