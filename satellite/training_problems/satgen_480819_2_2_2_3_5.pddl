; params: satgen 480819 2 2 2 3 5
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
	Star2 - direction
	GroundStation0 - direction
	GroundStation1 - direction
	Planet3 - direction
	Phenomenon4 - direction
	Star5 - direction
	Planet6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 image0)
	(calibration_target instrument0 GroundStation1)
	(supports instrument1 infrared1)
	(supports instrument1 image0)
	(calibration_target instrument1 Star2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star5)
	(supports instrument2 infrared1)
	(supports instrument2 image0)
	(calibration_target instrument2 GroundStation0)
	(supports instrument3 infrared1)
	(supports instrument3 image0)
	(calibration_target instrument3 GroundStation1)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star5)
)
(:goal (and
	(have_image Planet3 infrared1)
	(have_image Phenomenon4 image0)
	(have_image Star5 image0)
	(have_image Planet6 image0)
	(have_image Phenomenon7 infrared1)
))

)
