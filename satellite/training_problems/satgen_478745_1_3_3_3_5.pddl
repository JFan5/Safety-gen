; params: satgen 478745 1 3 3 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	spectrograph2 - mode
	image0 - mode
	image1 - mode
	Star0 - direction
	GroundStation2 - direction
	GroundStation1 - direction
	Planet3 - direction
	Star4 - direction
	Star5 - direction
	Planet6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 image0)
	(calibration_target instrument0 GroundStation1)
	(supports instrument1 spectrograph2)
	(calibration_target instrument1 GroundStation1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
)
(:goal (and
	(have_image Planet3 image0)
	(have_image Star4 spectrograph2)
	(have_image Star5 image0)
	(have_image Planet6 image1)
	(have_image Phenomenon7 image1)
))

)
