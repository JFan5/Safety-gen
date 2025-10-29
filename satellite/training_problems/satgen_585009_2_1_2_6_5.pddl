; params: satgen 585009 2 1 2 6 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image0 - mode
	image1 - mode
	Star0 - direction
	Star1 - direction
	Star3 - direction
	GroundStation5 - direction
	Star4 - direction
	GroundStation2 - direction
	Planet6 - direction
	Star7 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
	Planet10 - direction
)
(:init
	(supports instrument0 image1)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
	(supports instrument1 image1)
	(supports instrument1 image0)
	(calibration_target instrument1 GroundStation2)
	(calibration_target instrument1 Star4)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet6)
)
(:goal (and
	(pointing satellite1 GroundStation2)
	(have_image Planet6 image1)
	(have_image Star7 image1)
	(have_image Phenomenon8 image1)
	(have_image Phenomenon9 image0)
	(have_image Planet10 image0)
))

)
