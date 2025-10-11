; params: satgen 84187 2 3 3 4 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	image2 - mode
	image0 - mode
	infrared1 - mode
	Star0 - direction
	GroundStation2 - direction
	GroundStation1 - direction
	GroundStation3 - direction
	Star4 - direction
	Planet5 - direction
	Planet6 - direction
	Star7 - direction
	Star8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 image2)
	(supports instrument0 infrared1)
	(supports instrument0 image0)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star7)
	(supports instrument1 image2)
	(calibration_target instrument1 GroundStation1)
	(supports instrument2 image0)
	(supports instrument2 infrared1)
	(supports instrument2 image2)
	(calibration_target instrument2 GroundStation3)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation1)
)
(:goal (and
	(pointing satellite0 Star7)
	(pointing satellite1 GroundStation2)
	(have_image Star4 infrared1)
	(have_image Planet5 image0)
	(have_image Planet6 image2)
	(have_image Star7 image2)
	(have_image Star8 image2)
	(have_image Star9 image2)
))

)
