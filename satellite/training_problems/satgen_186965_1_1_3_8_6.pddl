; params: satgen 186965 1 1 3 8 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph2 - mode
	image0 - mode
	spectrograph1 - mode
	GroundStation0 - direction
	Star1 - direction
	GroundStation3 - direction
	GroundStation4 - direction
	Star6 - direction
	GroundStation7 - direction
	GroundStation2 - direction
	GroundStation5 - direction
	Phenomenon8 - direction
	Star9 - direction
	Star10 - direction
	Planet11 - direction
	Phenomenon12 - direction
	Planet13 - direction
)
(:init
	(supports instrument0 spectrograph2)
	(supports instrument0 image0)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 GroundStation5)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
)
(:goal (and
	(have_image Phenomenon8 spectrograph2)
	(have_image Star9 spectrograph2)
	(have_image Star10 spectrograph1)
	(have_image Planet11 spectrograph1)
	(have_image Phenomenon12 spectrograph1)
	(have_image Planet13 spectrograph1)
))

)
