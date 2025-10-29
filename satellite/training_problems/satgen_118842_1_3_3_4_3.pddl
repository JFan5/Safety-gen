; params: satgen 118842 1 3 3 4 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph1 - mode
	infrared0 - mode
	thermograph2 - mode
	GroundStation0 - direction
	Star2 - direction
	GroundStation3 - direction
	Star1 - direction
	Star4 - direction
	Star5 - direction
	Phenomenon6 - direction
)
(:init
	(supports instrument0 thermograph2)
	(supports instrument0 infrared0)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation3)
)
(:goal (and
	(have_image Star4 infrared0)
	(have_image Star5 spectrograph1)
	(have_image Phenomenon6 thermograph2)
))

)
