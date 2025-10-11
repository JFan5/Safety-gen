; params: satgen 177587 1 1 3 7 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph2 - mode
	infrared0 - mode
	thermograph1 - mode
	GroundStation0 - direction
	GroundStation2 - direction
	Star4 - direction
	Star5 - direction
	GroundStation6 - direction
	GroundStation3 - direction
	Star1 - direction
	Phenomenon7 - direction
	Phenomenon8 - direction
	Planet9 - direction
	Phenomenon10 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 thermograph2)
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star1)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet9)
)
(:goal (and
	(pointing satellite0 Star1)
	(have_image Phenomenon7 thermograph1)
	(have_image Phenomenon8 infrared0)
	(have_image Planet9 thermograph1)
	(have_image Phenomenon10 thermograph1)
))

)
