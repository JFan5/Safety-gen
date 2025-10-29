; params: satgen 259438 2 2 2 4 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	image0 - mode
	infrared1 - mode
	Star0 - direction
	GroundStation2 - direction
	Star3 - direction
	Star1 - direction
	Planet4 - direction
	Phenomenon5 - direction
	Star6 - direction
	Phenomenon7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 infrared1)
	(calibration_target instrument0 Star1)
	(supports instrument1 infrared1)
	(supports instrument1 image0)
	(calibration_target instrument1 GroundStation2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
	(supports instrument2 image0)
	(supports instrument2 infrared1)
	(calibration_target instrument2 Star3)
	(supports instrument3 image0)
	(supports instrument3 infrared1)
	(calibration_target instrument3 Star1)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon5)
)
(:goal (and
	(have_image Planet4 infrared1)
	(have_image Phenomenon5 image0)
	(have_image Star6 image0)
	(have_image Phenomenon7 infrared1)
	(have_image Planet8 image0)
))

)
