; params: satgen 895225 2 3 4 3 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	satellite1 - satellite
	instrument3 - instrument
	instrument4 - instrument
	instrument5 - instrument
	image3 - mode
	image2 - mode
	image0 - mode
	infrared1 - mode
	Star0 - direction
	Star2 - direction
	GroundStation1 - direction
	Planet3 - direction
	Planet4 - direction
	Planet5 - direction
	Star6 - direction
	Star7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 image2)
	(calibration_target instrument0 GroundStation1)
	(supports instrument1 image3)
	(calibration_target instrument1 GroundStation1)
	(supports instrument2 image3)
	(supports instrument2 image0)
	(supports instrument2 infrared1)
	(calibration_target instrument2 Star2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star0)
	(supports instrument3 image0)
	(supports instrument3 infrared1)
	(calibration_target instrument3 GroundStation1)
	(supports instrument4 infrared1)
	(supports instrument4 image2)
	(supports instrument4 image0)
	(calibration_target instrument4 Star2)
	(supports instrument5 infrared1)
	(supports instrument5 image2)
	(supports instrument5 image0)
	(calibration_target instrument5 GroundStation1)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(on_board instrument5 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet4)
)
(:goal (and
	(pointing satellite1 Star6)
	(have_image Planet3 image3)
	(have_image Planet4 image0)
	(have_image Planet5 infrared1)
	(have_image Star6 infrared1)
	(have_image Star7 image2)
	(have_image Planet8 image3)
))

)
