; params: satgen 720580 2 1 3 4 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph2 - mode
	infrared1 - mode
	spectrograph0 - mode
	Star1 - direction
	Star3 - direction
	GroundStation2 - direction
	GroundStation0 - direction
	Star4 - direction
	Planet5 - direction
	Star6 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star6)
	(supports instrument1 spectrograph2)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star4)
)
(:goal (and
	(have_image Star4 infrared1)
	(have_image Planet5 infrared1)
	(have_image Star6 infrared1)
))

)
