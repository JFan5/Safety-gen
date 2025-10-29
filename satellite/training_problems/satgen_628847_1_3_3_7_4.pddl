; params: satgen 628847 1 3 3 7 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image0 - mode
	infrared2 - mode
	thermograph1 - mode
	Star0 - direction
	Star1 - direction
	Star2 - direction
	Star3 - direction
	Star5 - direction
	GroundStation6 - direction
	GroundStation4 - direction
	Planet7 - direction
	Star8 - direction
	Star9 - direction
	Phenomenon10 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 infrared2)
	(supports instrument0 image0)
	(calibration_target instrument0 GroundStation4)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon10)
)
(:goal (and
	(have_image Planet7 image0)
	(have_image Star8 infrared2)
	(have_image Star9 thermograph1)
	(have_image Phenomenon10 infrared2)
))

)
