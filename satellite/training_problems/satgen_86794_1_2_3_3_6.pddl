; params: satgen 86794 1 2 3 3 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph0 - mode
	image1 - mode
	spectrograph2 - mode
	GroundStation1 - direction
	Star2 - direction
	Star0 - direction
	Planet3 - direction
	Planet4 - direction
	Phenomenon5 - direction
	Star6 - direction
	Phenomenon7 - direction
	Phenomenon8 - direction
)
(:init
	(supports instrument0 spectrograph2)
	(supports instrument0 spectrograph0)
	(supports instrument0 image1)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
)
(:goal (and
	(have_image Planet3 spectrograph2)
	(have_image Planet4 spectrograph0)
	(have_image Phenomenon5 spectrograph0)
	(have_image Star6 image1)
	(have_image Phenomenon7 spectrograph0)
	(have_image Phenomenon8 image1)
))

)
