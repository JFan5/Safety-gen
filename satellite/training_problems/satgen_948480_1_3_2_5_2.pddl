; params: satgen 948480 1 3 2 5 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	thermograph0 - mode
	spectrograph1 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	GroundStation4 - direction
	GroundStation3 - direction
	GroundStation2 - direction
	Phenomenon5 - direction
	Star6 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 GroundStation2)
	(supports instrument1 spectrograph1)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 GroundStation3)
	(supports instrument2 thermograph0)
	(calibration_target instrument2 GroundStation2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation4)
)
(:goal (and
	(pointing satellite0 GroundStation4)
	(have_image Phenomenon5 thermograph0)
	(have_image Star6 spectrograph1)
))

)
