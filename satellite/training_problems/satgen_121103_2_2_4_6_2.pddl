; params: satgen 121103 2 2 4 6 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	infrared3 - mode
	infrared1 - mode
	image0 - mode
	infrared2 - mode
	GroundStation0 - direction
	GroundStation5 - direction
	Star3 - direction
	Star2 - direction
	Star1 - direction
	Star4 - direction
	Star6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 infrared3)
	(supports instrument0 infrared1)
	(calibration_target instrument0 Star4)
	(calibration_target instrument0 Star2)
	(supports instrument1 infrared2)
	(supports instrument1 infrared3)
	(supports instrument1 image0)
	(calibration_target instrument1 GroundStation5)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
	(supports instrument2 infrared1)
	(supports instrument2 image0)
	(calibration_target instrument2 Star2)
	(calibration_target instrument2 Star3)
	(supports instrument3 infrared3)
	(supports instrument3 image0)
	(supports instrument3 infrared1)
	(calibration_target instrument3 Star4)
	(calibration_target instrument3 Star1)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star3)
)
(:goal (and
	(pointing satellite0 Star1)
	(have_image Star6 infrared1)
	(have_image Phenomenon7 infrared2)
))

)
