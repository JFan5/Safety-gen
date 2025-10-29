; params: satgen 304919 1 2 4 5 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph1 - mode
	infrared2 - mode
	thermograph0 - mode
	infrared3 - mode
	Star0 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation4 - direction
	Star3 - direction
	Phenomenon5 - direction
	Planet6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 infrared3)
	(supports instrument0 thermograph0)
	(supports instrument0 infrared2)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
)
(:goal (and
	(have_image Phenomenon5 spectrograph1)
	(have_image Planet6 thermograph0)
	(have_image Star7 infrared2)
))

)
