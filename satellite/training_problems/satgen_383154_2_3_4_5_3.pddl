; params: satgen 383154 2 3 4 5 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph0 - mode
	infrared1 - mode
	infrared2 - mode
	spectrograph3 - mode
	GroundStation1 - direction
	Star3 - direction
	Star4 - direction
	GroundStation0 - direction
	Star2 - direction
	Planet5 - direction
	Star6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 infrared1)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star7)
	(supports instrument1 infrared2)
	(supports instrument1 spectrograph0)
	(supports instrument1 spectrograph3)
	(calibration_target instrument1 Star2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star4)
)
(:goal (and
	(pointing satellite1 GroundStation0)
	(have_image Planet5 infrared1)
	(have_image Star6 spectrograph3)
	(have_image Star7 infrared1)
))

)
