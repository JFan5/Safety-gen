; params: satgen 317013 2 3 3 5 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	satellite1 - satellite
	instrument3 - instrument
	spectrograph0 - mode
	image2 - mode
	image1 - mode
	GroundStation1 - direction
	GroundStation3 - direction
	Star0 - direction
	GroundStation4 - direction
	GroundStation2 - direction
	Star5 - direction
	Phenomenon6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 Star0)
	(supports instrument1 image1)
	(supports instrument1 image2)
	(calibration_target instrument1 GroundStation2)
	(supports instrument2 image1)
	(calibration_target instrument2 GroundStation4)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
	(supports instrument3 image2)
	(supports instrument3 spectrograph0)
	(supports instrument3 image1)
	(calibration_target instrument3 GroundStation2)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation3)
)
(:goal (and
	(pointing satellite0 Phenomenon6)
	(have_image Star5 image2)
	(have_image Phenomenon6 spectrograph0)
	(have_image Phenomenon7 image2)
))

)
