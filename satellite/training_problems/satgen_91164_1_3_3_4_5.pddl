; params: satgen 91164 1 3 3 4 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	thermograph0 - mode
	spectrograph1 - mode
	spectrograph2 - mode
	GroundStation2 - direction
	Star3 - direction
	Star0 - direction
	Star1 - direction
	Phenomenon4 - direction
	Phenomenon5 - direction
	Planet6 - direction
	Star7 - direction
	Phenomenon8 - direction
)
(:init
	(supports instrument0 spectrograph2)
	(supports instrument0 thermograph0)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star0)
	(supports instrument1 spectrograph2)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 Star1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon4)
)
(:goal (and
	(pointing satellite0 Star7)
	(have_image Phenomenon4 spectrograph1)
	(have_image Phenomenon5 spectrograph2)
	(have_image Planet6 thermograph0)
	(have_image Star7 thermograph0)
	(have_image Phenomenon8 spectrograph2)
))

)
