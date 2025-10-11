; params: satgen 359735 1 2 3 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph2 - mode
	image1 - mode
	spectrograph0 - mode
	GroundStation1 - direction
	Star2 - direction
	GroundStation0 - direction
	Planet3 - direction
	Planet4 - direction
	Phenomenon5 - direction
	Planet6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 spectrograph0)
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
)
(:goal (and
	(pointing satellite0 Planet6)
	(have_image Planet3 image1)
	(have_image Planet4 image1)
	(have_image Phenomenon5 spectrograph0)
	(have_image Planet6 spectrograph2)
	(have_image Star7 image1)
))

)
