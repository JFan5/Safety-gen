; params: satgen 195186 2 2 3 4 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	infrared0 - mode
	infrared1 - mode
	spectrograph2 - mode
	GroundStation1 - direction
	Star3 - direction
	Star2 - direction
	GroundStation0 - direction
	Planet4 - direction
	Star5 - direction
	Star6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 infrared1)
	(calibration_target instrument0 Star2)
	(supports instrument1 infrared1)
	(supports instrument1 infrared0)
	(supports instrument1 spectrograph2)
	(calibration_target instrument1 Star2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet4)
	(supports instrument2 infrared0)
	(calibration_target instrument2 GroundStation0)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star3)
)
(:goal (and
	(pointing satellite1 Star6)
	(have_image Planet4 infrared0)
	(have_image Star5 spectrograph2)
	(have_image Star6 infrared0)
	(have_image Phenomenon7 infrared1)
))

)
