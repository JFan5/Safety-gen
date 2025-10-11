; params: satgen 753920 1 3 3 7 5
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
	Star1 - direction
	GroundStation4 - direction
	GroundStation5 - direction
	GroundStation2 - direction
	Star3 - direction
	Star6 - direction
	Planet7 - direction
	Planet8 - direction
	Phenomenon9 - direction
	Star10 - direction
	Phenomenon11 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star6)
	(calibration_target instrument0 GroundStation2)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 Star3)
	(supports instrument2 image2)
	(supports instrument2 spectrograph0)
	(supports instrument2 spectrograph1)
	(calibration_target instrument2 Star6)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
)
(:goal (and
	(pointing satellite0 Phenomenon9)
	(have_image Planet7 spectrograph1)
	(have_image Planet8 spectrograph1)
	(have_image Phenomenon9 spectrograph1)
	(have_image Star10 spectrograph0)
	(have_image Phenomenon11 image2)
))

)
