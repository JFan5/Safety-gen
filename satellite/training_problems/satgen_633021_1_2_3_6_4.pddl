; params: satgen 633021 1 2 3 6 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	thermograph0 - mode
	spectrograph1 - mode
	thermograph2 - mode
	Star0 - direction
	GroundStation2 - direction
	Star4 - direction
	GroundStation5 - direction
	Star1 - direction
	GroundStation3 - direction
	Star6 - direction
	Phenomenon7 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 spectrograph1)
	(supports instrument0 thermograph2)
	(calibration_target instrument0 Star1)
	(supports instrument1 thermograph2)
	(supports instrument1 thermograph0)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 GroundStation3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon9)
)
(:goal (and
	(pointing satellite0 Star6)
	(have_image Star6 spectrograph1)
	(have_image Phenomenon7 thermograph2)
	(have_image Phenomenon8 thermograph0)
	(have_image Phenomenon9 spectrograph1)
))

)
