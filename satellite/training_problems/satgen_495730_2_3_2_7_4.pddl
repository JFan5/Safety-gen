; params: satgen 495730 2 3 2 7 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	instrument4 - instrument
	infrared1 - mode
	infrared0 - mode
	GroundStation4 - direction
	Star5 - direction
	GroundStation1 - direction
	Star3 - direction
	GroundStation2 - direction
	Star6 - direction
	Star0 - direction
	Star7 - direction
	Phenomenon8 - direction
	Star9 - direction
	Phenomenon10 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 infrared1)
	(calibration_target instrument0 GroundStation1)
	(supports instrument1 infrared1)
	(calibration_target instrument1 Star0)
	(calibration_target instrument1 Star6)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
	(supports instrument2 infrared1)
	(supports instrument2 infrared0)
	(calibration_target instrument2 Star3)
	(supports instrument3 infrared0)
	(calibration_target instrument3 GroundStation2)
	(supports instrument4 infrared1)
	(supports instrument4 infrared0)
	(calibration_target instrument4 Star0)
	(calibration_target instrument4 Star6)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star6)
)
(:goal (and
	(pointing satellite0 Phenomenon10)
	(have_image Star7 infrared1)
	(have_image Phenomenon8 infrared0)
	(have_image Star9 infrared1)
	(have_image Phenomenon10 infrared1)
))

)
