; params: satgen 814109 2 3 3 3 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	satellite1 - satellite
	instrument3 - instrument
	spectrograph1 - mode
	thermograph2 - mode
	infrared0 - mode
	Star2 - direction
	Star1 - direction
	GroundStation0 - direction
	Planet3 - direction
	Star4 - direction
	Planet5 - direction
	Star6 - direction
	Planet7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 thermograph2)
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star2)
	(supports instrument1 spectrograph1)
	(supports instrument1 thermograph2)
	(calibration_target instrument1 GroundStation0)
	(supports instrument2 infrared0)
	(supports instrument2 thermograph2)
	(calibration_target instrument2 Star1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet3)
	(supports instrument3 thermograph2)
	(supports instrument3 infrared0)
	(supports instrument3 spectrograph1)
	(calibration_target instrument3 GroundStation0)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star4)
)
(:goal (and
	(pointing satellite0 Planet5)
	(have_image Planet3 spectrograph1)
	(have_image Star4 spectrograph1)
	(have_image Planet5 thermograph2)
	(have_image Star6 thermograph2)
	(have_image Planet7 spectrograph1)
	(have_image Planet8 spectrograph1)
))

)
