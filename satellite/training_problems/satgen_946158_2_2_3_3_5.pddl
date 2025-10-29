; params: satgen 946158 2 2 3 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image1 - mode
	spectrograph2 - mode
	thermograph0 - mode
	GroundStation0 - direction
	GroundStation2 - direction
	GroundStation1 - direction
	Planet3 - direction
	Planet4 - direction
	Phenomenon5 - direction
	Planet6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 spectrograph2)
	(supports instrument0 image1)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet4)
	(supports instrument1 spectrograph2)
	(supports instrument1 image1)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 GroundStation1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon5)
)
(:goal (and
	(have_image Planet3 spectrograph2)
	(have_image Planet4 spectrograph2)
	(have_image Phenomenon5 spectrograph2)
	(have_image Planet6 spectrograph2)
	(have_image Phenomenon7 image1)
))

)
