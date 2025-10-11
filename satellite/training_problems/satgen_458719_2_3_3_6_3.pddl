; params: satgen 458719 2 3 3 6 3
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
	infrared0 - mode
	infrared1 - mode
	image2 - mode
	GroundStation0 - direction
	Star1 - direction
	Star2 - direction
	Star3 - direction
	Star5 - direction
	Star4 - direction
	Planet6 - direction
	Planet7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 image2)
	(calibration_target instrument0 Star5)
	(supports instrument1 infrared1)
	(calibration_target instrument1 Star5)
	(calibration_target instrument1 Star4)
	(supports instrument2 infrared0)
	(supports instrument2 image2)
	(supports instrument2 infrared1)
	(calibration_target instrument2 Star5)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet6)
	(supports instrument3 infrared1)
	(calibration_target instrument3 Star4)
	(supports instrument4 infrared1)
	(supports instrument4 image2)
	(calibration_target instrument4 Star4)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet7)
)
(:goal (and
	(pointing satellite1 Star2)
	(have_image Planet6 image2)
	(have_image Planet7 image2)
	(have_image Planet8 infrared1)
))

)
