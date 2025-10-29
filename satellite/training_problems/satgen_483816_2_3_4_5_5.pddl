; params: satgen 483816 2 3 4 5 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	satellite1 - satellite
	instrument3 - instrument
	image2 - mode
	infrared1 - mode
	image3 - mode
	image0 - mode
	GroundStation0 - direction
	GroundStation4 - direction
	Star1 - direction
	Star3 - direction
	Star2 - direction
	Star5 - direction
	Planet6 - direction
	Planet7 - direction
	Phenomenon8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 image2)
	(calibration_target instrument0 Star1)
	(supports instrument1 image2)
	(supports instrument1 image3)
	(calibration_target instrument1 Star1)
	(supports instrument2 image3)
	(supports instrument2 infrared1)
	(supports instrument2 image2)
	(calibration_target instrument2 Star3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon8)
	(supports instrument3 image2)
	(supports instrument3 image0)
	(calibration_target instrument3 Star2)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star1)
)
(:goal (and
	(pointing satellite0 GroundStation4)
	(have_image Star5 image0)
	(have_image Planet6 image3)
	(have_image Planet7 image0)
	(have_image Phenomenon8 image0)
	(have_image Star9 image2)
))

)
