; params: satgen 280301 2 2 3 3 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	thermograph2 - mode
	infrared0 - mode
	spectrograph1 - mode
	GroundStation1 - direction
	Star2 - direction
	GroundStation0 - direction
	Phenomenon3 - direction
	Phenomenon4 - direction
	Phenomenon5 - direction
	Star6 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 thermograph2)
	(calibration_target instrument0 GroundStation0)
	(supports instrument1 infrared0)
	(supports instrument1 thermograph2)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star6)
	(supports instrument2 spectrograph1)
	(supports instrument2 infrared0)
	(calibration_target instrument2 GroundStation0)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon3)
)
(:goal (and
	(pointing satellite0 Phenomenon5)
	(pointing satellite1 Phenomenon3)
	(have_image Phenomenon3 thermograph2)
	(have_image Phenomenon4 thermograph2)
	(have_image Phenomenon5 spectrograph1)
	(have_image Star6 infrared0)
))

)
