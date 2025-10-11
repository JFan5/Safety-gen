; params: satgen 331752 1 2 3 8 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared0 - mode
	spectrograph2 - mode
	spectrograph1 - mode
	Star0 - direction
	GroundStation1 - direction
	Star2 - direction
	Star3 - direction
	Star4 - direction
	GroundStation6 - direction
	GroundStation7 - direction
	Star5 - direction
	Star8 - direction
	Star9 - direction
	Planet10 - direction
	Star11 - direction
	Star12 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 spectrograph1)
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 Star5)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star9)
)
(:goal (and
	(have_image Star8 spectrograph1)
	(have_image Star9 spectrograph1)
	(have_image Planet10 spectrograph2)
	(have_image Star11 infrared0)
	(have_image Star12 spectrograph1)
))

)
