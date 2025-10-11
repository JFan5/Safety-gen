; params: satgen 687020 1 3 4 8 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	spectrograph3 - mode
	thermograph1 - mode
	infrared0 - mode
	infrared2 - mode
	Star0 - direction
	Star1 - direction
	Star3 - direction
	Star4 - direction
	GroundStation5 - direction
	GroundStation6 - direction
	GroundStation2 - direction
	GroundStation7 - direction
	Phenomenon8 - direction
	Star9 - direction
	Star10 - direction
	Planet11 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 infrared0)
	(supports instrument0 thermograph1)
	(supports instrument0 spectrograph3)
	(calibration_target instrument0 GroundStation2)
	(supports instrument1 infrared2)
	(calibration_target instrument1 GroundStation7)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star9)
)
(:goal (and
	(pointing satellite0 Phenomenon8)
	(have_image Phenomenon8 thermograph1)
	(have_image Star9 spectrograph3)
	(have_image Star10 infrared2)
	(have_image Planet11 infrared2)
))

)
