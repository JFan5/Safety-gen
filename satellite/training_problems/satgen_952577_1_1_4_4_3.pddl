; params: satgen 952577 1 1 4 4 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph1 - mode
	spectrograph3 - mode
	thermograph2 - mode
	image0 - mode
	Star0 - direction
	Star1 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	Phenomenon4 - direction
	Phenomenon5 - direction
	Star6 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 image0)
	(supports instrument0 thermograph2)
	(supports instrument0 spectrograph3)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon4)
)
(:goal (and
	(pointing satellite0 Star0)
	(have_image Phenomenon4 spectrograph3)
	(have_image Phenomenon5 spectrograph3)
	(have_image Star6 spectrograph3)
))

)
