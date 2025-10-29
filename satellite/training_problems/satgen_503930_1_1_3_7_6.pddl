; params: satgen 503930 1 1 3 7 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image2 - mode
	image0 - mode
	spectrograph1 - mode
	GroundStation0 - direction
	Star1 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	GroundStation4 - direction
	GroundStation5 - direction
	GroundStation6 - direction
	Planet7 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
	Star10 - direction
	Phenomenon11 - direction
	Star12 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 image2)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 GroundStation6)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
)
(:goal (and
	(pointing satellite0 Star1)
	(have_image Planet7 image2)
	(have_image Phenomenon8 image0)
	(have_image Phenomenon9 spectrograph1)
	(have_image Star10 image0)
	(have_image Phenomenon11 spectrograph1)
	(have_image Star12 spectrograph1)
))

)
