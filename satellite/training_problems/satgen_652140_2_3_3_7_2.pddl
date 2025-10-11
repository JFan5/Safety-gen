; params: satgen 652140 2 3 3 7 2
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
	infrared0 - mode
	thermograph2 - mode
	GroundStation4 - direction
	Star6 - direction
	GroundStation3 - direction
	GroundStation2 - direction
	GroundStation5 - direction
	GroundStation1 - direction
	GroundStation0 - direction
	Planet7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 infrared0)
	(calibration_target instrument0 GroundStation3)
	(calibration_target instrument0 GroundStation1)
	(supports instrument1 infrared0)
	(calibration_target instrument1 GroundStation2)
	(supports instrument2 infrared0)
	(supports instrument2 thermograph2)
	(calibration_target instrument2 GroundStation5)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation4)
	(supports instrument3 spectrograph1)
	(calibration_target instrument3 GroundStation0)
	(calibration_target instrument3 GroundStation1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet7)
)
(:goal (and
	(have_image Planet7 thermograph2)
	(have_image Planet8 infrared0)
))

)
