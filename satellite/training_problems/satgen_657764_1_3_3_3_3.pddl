; params: satgen 657764 1 3 3 3 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	image0 - mode
	thermograph1 - mode
	image2 - mode
	Star1 - direction
	Star2 - direction
	GroundStation0 - direction
	Planet3 - direction
	Phenomenon4 - direction
	Phenomenon5 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 image2)
	(calibration_target instrument0 Star2)
	(supports instrument1 image0)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet3)
)
(:goal (and
	(have_image Planet3 image2)
	(have_image Phenomenon4 thermograph1)
	(have_image Phenomenon5 image2)
))

)
