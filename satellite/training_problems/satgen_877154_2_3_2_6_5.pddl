; params: satgen 877154 2 3 2 6 5
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
	image1 - mode
	infrared0 - mode
	Star0 - direction
	Star4 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	Star5 - direction
	Star3 - direction
	Planet6 - direction
	Star7 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
	Star10 - direction
)
(:init
	(supports instrument0 image1)
	(calibration_target instrument0 GroundStation1)
	(calibration_target instrument0 Star5)
	(supports instrument1 image1)
	(supports instrument1 infrared0)
	(calibration_target instrument1 Star3)
	(supports instrument2 image1)
	(calibration_target instrument2 GroundStation2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation1)
	(supports instrument3 infrared0)
	(supports instrument3 image1)
	(calibration_target instrument3 GroundStation2)
	(supports instrument4 image1)
	(calibration_target instrument4 Star5)
	(supports instrument5 infrared0)
	(supports instrument5 image1)
	(calibration_target instrument5 Star3)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(on_board instrument5 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation1)
)
(:goal (and
	(pointing satellite0 Star3)
	(have_image Planet6 infrared0)
	(have_image Star7 image1)
	(have_image Phenomenon8 image1)
	(have_image Phenomenon9 infrared0)
	(have_image Star10 infrared0)
))

)
