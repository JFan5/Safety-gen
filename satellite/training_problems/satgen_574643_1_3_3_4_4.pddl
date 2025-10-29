; params: satgen 574643 1 3 3 4 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	spectrograph1 - mode
	thermograph2 - mode
	image0 - mode
	GroundStation0 - direction
	Star1 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	Star4 - direction
	Phenomenon5 - direction
	Star6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 spectrograph1)
	(supports instrument0 thermograph2)
	(calibration_target instrument0 GroundStation2)
	(supports instrument1 thermograph2)
	(supports instrument1 image0)
	(calibration_target instrument1 GroundStation3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
)
(:goal (and
	(pointing satellite0 GroundStation0)
	(have_image Star4 thermograph2)
	(have_image Phenomenon5 image0)
	(have_image Star6 thermograph2)
	(have_image Star7 thermograph2)
))

)
