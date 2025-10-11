; params: satgen 827747 2 1 4 4 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared0 - mode
	thermograph2 - mode
	infrared3 - mode
	spectrograph1 - mode
	GroundStation0 - direction
	Star1 - direction
	Star3 - direction
	Star2 - direction
	Planet4 - direction
	Phenomenon5 - direction
	Phenomenon6 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet4)
	(supports instrument1 spectrograph1)
	(supports instrument1 infrared3)
	(supports instrument1 thermograph2)
	(supports instrument1 infrared0)
	(calibration_target instrument1 Star2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star3)
)
(:goal (and
	(have_image Planet4 thermograph2)
	(have_image Phenomenon5 spectrograph1)
	(have_image Phenomenon6 infrared0)
))

)
