; params: satgen 690737 1 1 4 7 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph3 - mode
	spectrograph0 - mode
	spectrograph2 - mode
	infrared1 - mode
	Star1 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	GroundStation4 - direction
	GroundStation5 - direction
	GroundStation6 - direction
	GroundStation0 - direction
	Planet7 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
	Planet10 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 spectrograph2)
	(supports instrument0 spectrograph0)
	(supports instrument0 spectrograph3)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation5)
)
(:goal (and
	(have_image Planet7 infrared1)
	(have_image Phenomenon8 infrared1)
	(have_image Phenomenon9 spectrograph2)
	(have_image Planet10 spectrograph3)
))

)
