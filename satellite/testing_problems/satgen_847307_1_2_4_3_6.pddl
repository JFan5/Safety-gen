; params: satgen 847307 1 2 4 3 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph0 - mode
	thermograph3 - mode
	image1 - mode
	infrared2 - mode
	Star0 - direction
	Star1 - direction
	Star2 - direction
	Planet3 - direction
	Planet4 - direction
	Phenomenon5 - direction
	Planet6 - direction
	Planet7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 spectrograph0)
	(supports instrument0 image1)
	(supports instrument0 thermograph3)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet8)
)
(:goal (and
	(pointing satellite0 Phenomenon5)
	(have_image Planet3 spectrograph0)
	(have_image Planet4 image1)
	(have_image Phenomenon5 spectrograph0)
	(have_image Planet6 infrared2)
	(have_image Planet7 thermograph3)
	(have_image Planet8 spectrograph0)
))

)
