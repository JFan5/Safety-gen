; params: satgen 157031 2 3 4 5 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	instrument3 - instrument
	image3 - mode
	infrared0 - mode
	infrared2 - mode
	infrared1 - mode
	GroundStation0 - direction
	Star2 - direction
	GroundStation1 - direction
	GroundStation3 - direction
	Star4 - direction
	Planet5 - direction
	Phenomenon6 - direction
	Phenomenon7 - direction
	Phenomenon8 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 infrared1)
	(supports instrument0 infrared2)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
	(supports instrument1 image3)
	(calibration_target instrument1 Star4)
	(supports instrument2 image3)
	(supports instrument2 infrared2)
	(calibration_target instrument2 GroundStation3)
	(supports instrument3 infrared0)
	(supports instrument3 infrared2)
	(supports instrument3 image3)
	(calibration_target instrument3 Star4)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation0)
)
(:goal (and
	(pointing satellite1 GroundStation0)
	(have_image Planet5 infrared2)
	(have_image Phenomenon6 infrared1)
	(have_image Phenomenon7 image3)
	(have_image Phenomenon8 infrared1)
))

)
