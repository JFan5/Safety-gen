; params: satgen 259322 1 1 4 6 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared1 - mode
	spectrograph2 - mode
	infrared0 - mode
	infrared3 - mode
	GroundStation0 - direction
	Star2 - direction
	GroundStation3 - direction
	GroundStation5 - direction
	Star4 - direction
	GroundStation1 - direction
	Star6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 infrared3)
	(supports instrument0 spectrograph2)
	(supports instrument0 infrared1)
	(calibration_target instrument0 GroundStation1)
	(calibration_target instrument0 Star4)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
)
(:goal (and
	(have_image Star6 infrared0)
	(have_image Star7 infrared3)
))

)
