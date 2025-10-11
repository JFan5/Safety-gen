; params: satgen 559600 2 3 2 8 5
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
	infrared1 - mode
	image0 - mode
	Star2 - direction
	Star3 - direction
	Star5 - direction
	GroundStation7 - direction
	Star0 - direction
	GroundStation1 - direction
	Star4 - direction
	Star6 - direction
	Planet8 - direction
	Planet9 - direction
	Star10 - direction
	Phenomenon11 - direction
	Planet12 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 image0)
	(calibration_target instrument0 Star0)
	(calibration_target instrument0 Star4)
	(supports instrument1 infrared1)
	(calibration_target instrument1 Star0)
	(supports instrument2 infrared1)
	(supports instrument2 image0)
	(calibration_target instrument2 Star6)
	(calibration_target instrument2 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star5)
	(supports instrument3 infrared1)
	(supports instrument3 image0)
	(calibration_target instrument3 GroundStation1)
	(supports instrument4 image0)
	(supports instrument4 infrared1)
	(calibration_target instrument4 Star6)
	(calibration_target instrument4 Star4)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet9)
)
(:goal (and
	(have_image Planet8 infrared1)
	(have_image Planet9 infrared1)
	(have_image Star10 image0)
	(have_image Phenomenon11 infrared1)
	(have_image Planet12 image0)
))

)
