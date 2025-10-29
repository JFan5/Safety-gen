; params: satgen 792649 2 2 4 4 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	thermograph3 - mode
	spectrograph1 - mode
	image0 - mode
	infrared2 - mode
	GroundStation1 - direction
	GroundStation2 - direction
	Star0 - direction
	GroundStation3 - direction
	Phenomenon4 - direction
	Star5 - direction
	Phenomenon6 - direction
	Star7 - direction
	Star8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 infrared2)
	(calibration_target instrument0 GroundStation3)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 GroundStation3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon4)
	(supports instrument2 spectrograph1)
	(supports instrument2 image0)
	(supports instrument2 thermograph3)
	(calibration_target instrument2 Star0)
	(supports instrument3 infrared2)
	(calibration_target instrument3 GroundStation3)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation2)
)
(:goal (and
	(pointing satellite1 Phenomenon4)
	(have_image Phenomenon4 image0)
	(have_image Star5 infrared2)
	(have_image Phenomenon6 spectrograph1)
	(have_image Star7 image0)
	(have_image Star8 image0)
	(have_image Phenomenon9 thermograph3)
))

)
