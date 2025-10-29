; params: satgen 38976 1 3 3 5 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	image2 - mode
	spectrograph0 - mode
	spectrograph1 - mode
	Star0 - direction
	GroundStation2 - direction
	Star3 - direction
	Star1 - direction
	GroundStation4 - direction
	Phenomenon5 - direction
	Planet6 - direction
	Planet7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 image2)
	(calibration_target instrument0 GroundStation4)
	(supports instrument1 spectrograph0)
	(supports instrument1 spectrograph1)
	(supports instrument1 image2)
	(calibration_target instrument1 Star1)
	(supports instrument2 image2)
	(calibration_target instrument2 GroundStation4)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet7)
)
(:goal (and
	(have_image Phenomenon5 image2)
	(have_image Planet6 spectrograph0)
	(have_image Planet7 spectrograph0)
	(have_image Planet8 spectrograph1)
))

)
