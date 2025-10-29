; params: satgen 504703 1 3 2 8 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	image0 - mode
	infrared1 - mode
	Star0 - direction
	Star1 - direction
	GroundStation4 - direction
	GroundStation5 - direction
	GroundStation7 - direction
	Star6 - direction
	Star2 - direction
	Star3 - direction
	Star8 - direction
	Phenomenon9 - direction
	Planet10 - direction
	Star11 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 infrared1)
	(calibration_target instrument0 Star6)
	(supports instrument1 image0)
	(calibration_target instrument1 Star3)
	(calibration_target instrument1 Star2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
)
(:goal (and
	(pointing satellite0 Star11)
	(have_image Star8 image0)
	(have_image Phenomenon9 infrared1)
	(have_image Planet10 image0)
	(have_image Star11 infrared1)
))

)
