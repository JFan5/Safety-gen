; params: satgen 646061 1 2 3 4 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	spectrograph0 - mode
	spectrograph1 - mode
	thermograph2 - mode
	GroundStation2 - direction
	Star3 - direction
	Star0 - direction
	Star1 - direction
	Star4 - direction
	Phenomenon5 - direction
	Phenomenon6 - direction
	Planet7 - direction
	Star8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 Star0)
	(supports instrument1 spectrograph0)
	(supports instrument1 spectrograph1)
	(supports instrument1 thermograph2)
	(calibration_target instrument1 Star1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star0)
)
(:goal (and
	(have_image Star4 spectrograph0)
	(have_image Phenomenon5 thermograph2)
	(have_image Phenomenon6 spectrograph0)
	(have_image Planet7 thermograph2)
	(have_image Star8 spectrograph1)
	(have_image Phenomenon9 thermograph2)
))

)
