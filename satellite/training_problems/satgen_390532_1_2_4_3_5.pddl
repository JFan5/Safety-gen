; params: satgen 390532 1 2 4 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	spectrograph0 - mode
	infrared2 - mode
	image1 - mode
	image3 - mode
	Star2 - direction
	GroundStation0 - direction
	Star1 - direction
	Star3 - direction
	Planet4 - direction
	Phenomenon5 - direction
	Star6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 infrared2)
	(calibration_target instrument0 GroundStation0)
	(supports instrument1 image1)
	(supports instrument1 infrared2)
	(supports instrument1 image3)
	(calibration_target instrument1 Star1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
)
(:goal (and
	(have_image Star3 image1)
	(have_image Planet4 image1)
	(have_image Phenomenon5 spectrograph0)
	(have_image Star6 image3)
	(have_image Phenomenon7 image3)
))

)
