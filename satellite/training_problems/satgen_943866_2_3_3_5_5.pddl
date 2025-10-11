; params: satgen 943866 2 3 3 5 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	image0 - mode
	infrared1 - mode
	infrared2 - mode
	Star0 - direction
	Star1 - direction
	Star2 - direction
	Star4 - direction
	Star3 - direction
	Star5 - direction
	Phenomenon6 - direction
	Planet7 - direction
	Planet8 - direction
	Planet9 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 infrared2)
	(supports instrument0 image0)
	(calibration_target instrument0 Star4)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
	(supports instrument1 infrared2)
	(calibration_target instrument1 Star4)
	(supports instrument2 infrared2)
	(supports instrument2 image0)
	(supports instrument2 infrared1)
	(calibration_target instrument2 Star3)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star5)
)
(:goal (and
	(pointing satellite0 Star2)
	(pointing satellite1 Planet7)
	(have_image Star5 image0)
	(have_image Phenomenon6 infrared1)
	(have_image Planet7 infrared1)
	(have_image Planet8 infrared2)
	(have_image Planet9 image0)
))

)
