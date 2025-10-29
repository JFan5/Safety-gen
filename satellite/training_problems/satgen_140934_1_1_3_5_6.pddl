; params: satgen 140934 1 1 3 5 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image0 - mode
	thermograph1 - mode
	image2 - mode
	Star0 - direction
	GroundStation2 - direction
	Star3 - direction
	Star4 - direction
	Star1 - direction
	Star5 - direction
	Star6 - direction
	Planet7 - direction
	Star8 - direction
	Planet9 - direction
	Phenomenon10 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 image0)
	(supports instrument0 image2)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet7)
)
(:goal (and
	(have_image Star5 thermograph1)
	(have_image Star6 thermograph1)
	(have_image Planet7 image2)
	(have_image Star8 image0)
	(have_image Planet9 image0)
	(have_image Phenomenon10 image0)
))

)
