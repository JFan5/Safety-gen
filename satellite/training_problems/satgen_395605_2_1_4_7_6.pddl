; params: satgen 395605 2 1 4 7 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image3 - mode
	image1 - mode
	thermograph0 - mode
	infrared2 - mode
	GroundStation0 - direction
	Star1 - direction
	GroundStation2 - direction
	GroundStation4 - direction
	GroundStation5 - direction
	Star3 - direction
	GroundStation6 - direction
	Phenomenon7 - direction
	Planet8 - direction
	Phenomenon9 - direction
	Phenomenon10 - direction
	Phenomenon11 - direction
	Star12 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 thermograph0)
	(supports instrument0 image1)
	(supports instrument0 image3)
	(calibration_target instrument0 GroundStation5)
	(calibration_target instrument0 GroundStation4)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet8)
	(supports instrument1 infrared2)
	(calibration_target instrument1 GroundStation6)
	(calibration_target instrument1 Star3)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation5)
)
(:goal (and
	(pointing satellite1 GroundStation0)
	(have_image Phenomenon7 image1)
	(have_image Planet8 image1)
	(have_image Phenomenon9 infrared2)
	(have_image Phenomenon10 image3)
	(have_image Phenomenon11 image3)
	(have_image Star12 infrared2)
))

)
