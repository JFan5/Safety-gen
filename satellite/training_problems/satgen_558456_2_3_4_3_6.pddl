; params: satgen 558456 2 3 4 3 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	thermograph3 - mode
	image0 - mode
	spectrograph1 - mode
	infrared2 - mode
	Star0 - direction
	GroundStation2 - direction
	Star1 - direction
	Star3 - direction
	Phenomenon4 - direction
	Star5 - direction
	Phenomenon6 - direction
	Star7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 image0)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon4)
	(supports instrument1 infrared2)
	(supports instrument1 thermograph3)
	(calibration_target instrument1 GroundStation2)
	(supports instrument2 thermograph3)
	(supports instrument2 image0)
	(supports instrument2 spectrograph1)
	(calibration_target instrument2 Star1)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star5)
)
(:goal (and
	(have_image Star3 infrared2)
	(have_image Phenomenon4 image0)
	(have_image Star5 infrared2)
	(have_image Phenomenon6 spectrograph1)
	(have_image Star7 image0)
	(have_image Star8 thermograph3)
))

)
