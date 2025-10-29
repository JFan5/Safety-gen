; params: satgen 762564 1 2 3 4 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	thermograph0 - mode
	image2 - mode
	spectrograph1 - mode
	Star0 - direction
	Star1 - direction
	GroundStation3 - direction
	GroundStation2 - direction
	Phenomenon4 - direction
	Star5 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 GroundStation3)
	(supports instrument1 image2)
	(calibration_target instrument1 GroundStation2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star5)
)
(:goal (and
	(have_image Phenomenon4 spectrograph1)
	(have_image Star5 spectrograph1)
))

)
