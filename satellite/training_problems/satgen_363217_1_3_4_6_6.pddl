; params: satgen 363217 1 3 4 6 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared1 - mode
	thermograph2 - mode
	infrared0 - mode
	spectrograph3 - mode
	GroundStation0 - direction
	Star2 - direction
	Star3 - direction
	GroundStation4 - direction
	GroundStation5 - direction
	Star1 - direction
	Planet6 - direction
	Planet7 - direction
	Phenomenon8 - direction
	Star9 - direction
	Phenomenon10 - direction
	Star11 - direction
)
(:init
	(supports instrument0 spectrograph3)
	(supports instrument0 infrared0)
	(supports instrument0 thermograph2)
	(supports instrument0 infrared1)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation4)
)
(:goal (and
	(pointing satellite0 Phenomenon8)
	(have_image Planet6 infrared1)
	(have_image Planet7 spectrograph3)
	(have_image Phenomenon8 infrared0)
	(have_image Star9 infrared0)
	(have_image Phenomenon10 infrared0)
	(have_image Star11 thermograph2)
))

)
