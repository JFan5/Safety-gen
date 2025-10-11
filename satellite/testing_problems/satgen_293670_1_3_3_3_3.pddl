; params: satgen 293670 1 3 3 3 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	thermograph1 - mode
	spectrograph2 - mode
	image0 - mode
	GroundStation1 - direction
	GroundStation0 - direction
	GroundStation2 - direction
	Phenomenon3 - direction
	Star4 - direction
	Phenomenon5 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 spectrograph2)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 GroundStation1)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 GroundStation0)
	(supports instrument2 thermograph1)
	(supports instrument2 spectrograph2)
	(calibration_target instrument2 GroundStation2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon5)
)
(:goal (and
	(pointing satellite0 Star4)
	(have_image Phenomenon3 spectrograph2)
	(have_image Star4 image0)
	(have_image Phenomenon5 image0)
))

)
