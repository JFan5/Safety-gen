; params: satgen 780209 1 2 4 3 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	spectrograph2 - mode
	thermograph1 - mode
	infrared3 - mode
	spectrograph0 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	Star2 - direction
	Planet3 - direction
	Star4 - direction
	Star5 - direction
	Planet6 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 thermograph1)
	(supports instrument0 infrared3)
	(calibration_target instrument0 GroundStation1)
	(supports instrument1 spectrograph2)
	(supports instrument1 spectrograph0)
	(supports instrument1 infrared3)
	(calibration_target instrument1 Star2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
)
(:goal (and
	(have_image Planet3 thermograph1)
	(have_image Star4 spectrograph0)
	(have_image Star5 spectrograph0)
	(have_image Planet6 infrared3)
))

)
