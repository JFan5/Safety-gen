; params: satgen 135752 2 1 4 4 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image1 - mode
	spectrograph0 - mode
	image3 - mode
	infrared2 - mode
	Star0 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	Star4 - direction
	Planet5 - direction
	Planet6 - direction
	Planet7 - direction
	Planet8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 image1)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
	(supports instrument1 infrared2)
	(supports instrument1 image3)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 GroundStation3)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet5)
)
(:goal (and
	(pointing satellite0 GroundStation1)
	(have_image Star4 spectrograph0)
	(have_image Planet5 image3)
	(have_image Planet6 infrared2)
	(have_image Planet7 image1)
	(have_image Planet8 infrared2)
	(have_image Star9 image3)
))

)
