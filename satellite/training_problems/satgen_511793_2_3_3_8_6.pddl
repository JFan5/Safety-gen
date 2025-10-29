; params: satgen 511793 2 3 3 8 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	satellite1 - satellite
	instrument3 - instrument
	infrared2 - mode
	spectrograph0 - mode
	spectrograph1 - mode
	Star0 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	Star6 - direction
	Star3 - direction
	GroundStation5 - direction
	GroundStation7 - direction
	GroundStation4 - direction
	Phenomenon8 - direction
	Star9 - direction
	Phenomenon10 - direction
	Star11 - direction
	Planet12 - direction
	Phenomenon13 - direction
)
(:init
	(supports instrument0 infrared2)
	(calibration_target instrument0 Star3)
	(supports instrument1 infrared2)
	(supports instrument1 spectrograph0)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 GroundStation5)
	(supports instrument2 infrared2)
	(supports instrument2 spectrograph1)
	(supports instrument2 spectrograph0)
	(calibration_target instrument2 GroundStation7)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation7)
	(supports instrument3 infrared2)
	(calibration_target instrument3 GroundStation4)
	(calibration_target instrument3 GroundStation7)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star6)
)
(:goal (and
	(have_image Phenomenon8 spectrograph0)
	(have_image Star9 infrared2)
	(have_image Phenomenon10 infrared2)
	(have_image Star11 infrared2)
	(have_image Planet12 infrared2)
	(have_image Phenomenon13 infrared2)
))

)
