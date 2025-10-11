; params: satgen 392691 1 1 4 3 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph2 - mode
	thermograph0 - mode
	infrared1 - mode
	spectrograph3 - mode
	Star0 - direction
	GroundStation2 - direction
	Star1 - direction
	Phenomenon3 - direction
	Phenomenon4 - direction
	Phenomenon5 - direction
	Star6 - direction
	Planet7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 spectrograph3)
	(supports instrument0 infrared1)
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star0)
)
(:goal (and
	(have_image Phenomenon3 thermograph0)
	(have_image Phenomenon4 spectrograph3)
	(have_image Phenomenon5 spectrograph3)
	(have_image Star6 thermograph0)
	(have_image Planet7 infrared1)
	(have_image Planet8 spectrograph3)
))

)
