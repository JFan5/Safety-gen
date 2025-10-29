; params: satgen 578938 1 1 3 8 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph2 - mode
	spectrograph0 - mode
	spectrograph1 - mode
	Star0 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	Star4 - direction
	Star5 - direction
	GroundStation7 - direction
	Star6 - direction
	Phenomenon8 - direction
	Planet9 - direction
	Star10 - direction
	Planet11 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 spectrograph1)
	(supports instrument0 thermograph2)
	(calibration_target instrument0 Star6)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation7)
)
(:goal (and
	(pointing satellite0 GroundStation7)
	(have_image Phenomenon8 spectrograph0)
	(have_image Planet9 spectrograph0)
	(have_image Star10 spectrograph1)
	(have_image Planet11 thermograph2)
))

)
