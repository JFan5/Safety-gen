; params: satgen 801405 1 3 4 8 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	image0 - mode
	image1 - mode
	infrared2 - mode
	infrared3 - mode
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation4 - direction
	GroundStation5 - direction
	GroundStation7 - direction
	Star6 - direction
	Star0 - direction
	Star3 - direction
	Planet8 - direction
	Phenomenon9 - direction
	Planet10 - direction
	Star11 - direction
	Star12 - direction
	Phenomenon13 - direction
)
(:init
	(supports instrument0 infrared3)
	(calibration_target instrument0 Star0)
	(calibration_target instrument0 Star6)
	(supports instrument1 image1)
	(supports instrument1 infrared2)
	(supports instrument1 infrared3)
	(supports instrument1 image0)
	(calibration_target instrument1 Star3)
	(calibration_target instrument1 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star12)
)
(:goal (and
	(pointing satellite0 Planet8)
	(have_image Planet8 infrared2)
	(have_image Phenomenon9 image0)
	(have_image Planet10 image0)
	(have_image Star11 infrared2)
	(have_image Star12 infrared3)
	(have_image Phenomenon13 image1)
))

)
