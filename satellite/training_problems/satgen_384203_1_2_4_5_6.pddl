; params: satgen 384203 1 2 4 5 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image3 - mode
	infrared2 - mode
	spectrograph0 - mode
	thermograph1 - mode
	Star1 - direction
	GroundStation2 - direction
	Star3 - direction
	GroundStation4 - direction
	Star0 - direction
	Star5 - direction
	Phenomenon6 - direction
	Star7 - direction
	Planet8 - direction
	Star9 - direction
	Star10 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 spectrograph0)
	(supports instrument0 thermograph1)
	(supports instrument0 image3)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon6)
)
(:goal (and
	(pointing satellite0 Star5)
	(have_image Star5 image3)
	(have_image Phenomenon6 infrared2)
	(have_image Star7 thermograph1)
	(have_image Planet8 infrared2)
	(have_image Star9 infrared2)
	(have_image Star10 spectrograph0)
))

)
