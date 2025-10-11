; params: satgen 39355 2 1 4 5 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared0 - mode
	thermograph3 - mode
	spectrograph1 - mode
	infrared2 - mode
	Star0 - direction
	GroundStation2 - direction
	Star3 - direction
	GroundStation4 - direction
	Star1 - direction
	Phenomenon5 - direction
	Phenomenon6 - direction
	Star7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 spectrograph1)
	(supports instrument0 infrared0)
	(calibration_target instrument0 GroundStation4)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation4)
	(supports instrument1 thermograph3)
	(calibration_target instrument1 Star1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon6)
)
(:goal (and
	(pointing satellite0 Phenomenon5)
	(pointing satellite1 Phenomenon5)
	(have_image Phenomenon5 infrared2)
	(have_image Phenomenon6 thermograph3)
	(have_image Star7 infrared0)
	(have_image Planet8 infrared2)
))

)
