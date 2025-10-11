; params: satgen 284853 1 3 4 3 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph1 - mode
	infrared2 - mode
	spectrograph3 - mode
	spectrograph0 - mode
	Star0 - direction
	GroundStation2 - direction
	Star1 - direction
	Star3 - direction
	Phenomenon4 - direction
	Phenomenon5 - direction
	Planet6 - direction
	Phenomenon7 - direction
	Phenomenon8 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 spectrograph0)
	(supports instrument0 spectrograph3)
	(supports instrument0 infrared2)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star0)
)
(:goal (and
	(have_image Star3 thermograph1)
	(have_image Phenomenon4 infrared2)
	(have_image Phenomenon5 spectrograph0)
	(have_image Planet6 spectrograph3)
	(have_image Phenomenon7 infrared2)
	(have_image Phenomenon8 thermograph1)
))

)
