; params: satgen 76940 2 1 4 6 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared1 - mode
	infrared3 - mode
	infrared2 - mode
	spectrograph0 - mode
	GroundStation0 - direction
	Star1 - direction
	GroundStation4 - direction
	Star2 - direction
	GroundStation5 - direction
	GroundStation3 - direction
	Star6 - direction
	Star7 - direction
	Planet8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation4)
	(supports instrument1 infrared3)
	(supports instrument1 infrared1)
	(calibration_target instrument1 GroundStation3)
	(calibration_target instrument1 GroundStation5)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation4)
)
(:goal (and
	(pointing satellite1 Star1)
	(have_image Star6 infrared1)
	(have_image Star7 spectrograph0)
	(have_image Planet8 infrared1)
	(have_image Star9 infrared3)
))

)
