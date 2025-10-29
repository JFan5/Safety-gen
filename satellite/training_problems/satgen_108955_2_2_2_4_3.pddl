; params: satgen 108955 2 2 2 4 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph0 - mode
	infrared1 - mode
	GroundStation0 - direction
	Star1 - direction
	GroundStation3 - direction
	Star2 - direction
	Phenomenon4 - direction
	Star5 - direction
	Phenomenon6 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 infrared1)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon6)
	(supports instrument1 spectrograph0)
	(supports instrument1 infrared1)
	(calibration_target instrument1 Star2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation3)
)
(:goal (and
	(pointing satellite1 GroundStation0)
	(have_image Phenomenon4 spectrograph0)
	(have_image Star5 infrared1)
	(have_image Phenomenon6 spectrograph0)
))

)
