; params: satgen 645660 1 2 4 5 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph3 - mode
	infrared2 - mode
	image1 - mode
	thermograph0 - mode
	Star0 - direction
	Star1 - direction
	GroundStation3 - direction
	Star4 - direction
	GroundStation2 - direction
	Star5 - direction
	Phenomenon6 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 thermograph0)
	(supports instrument0 infrared2)
	(supports instrument0 spectrograph3)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
)
(:goal (and
	(have_image Star5 image1)
	(have_image Phenomenon6 spectrograph3)
))

)
