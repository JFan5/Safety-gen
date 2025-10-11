; params: satgen 435866 2 3 4 3 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	infrared0 - mode
	image2 - mode
	infrared3 - mode
	infrared1 - mode
	GroundStation0 - direction
	GroundStation2 - direction
	Star1 - direction
	Planet3 - direction
	Star4 - direction
	Phenomenon5 - direction
	Phenomenon6 - direction
	Star7 - direction
	Phenomenon8 - direction
)
(:init
	(supports instrument0 image2)
	(supports instrument0 infrared0)
	(supports instrument0 infrared3)
	(calibration_target instrument0 GroundStation2)
	(supports instrument1 infrared1)
	(calibration_target instrument1 Star1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
	(supports instrument2 image2)
	(supports instrument2 infrared0)
	(calibration_target instrument2 Star1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon5)
)
(:goal (and
	(pointing satellite0 GroundStation0)
	(pointing satellite1 Star7)
	(have_image Planet3 infrared1)
	(have_image Star4 infrared1)
	(have_image Phenomenon5 infrared0)
	(have_image Phenomenon6 image2)
	(have_image Star7 infrared1)
	(have_image Phenomenon8 infrared0)
))

)
