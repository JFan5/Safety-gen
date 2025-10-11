; params: satgen 865601 2 1 4 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph2 - mode
	image0 - mode
	thermograph3 - mode
	infrared1 - mode
	GroundStation0 - direction
	GroundStation2 - direction
	Star1 - direction
	Phenomenon3 - direction
	Phenomenon4 - direction
	Phenomenon5 - direction
	Planet6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 thermograph3)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon5)
	(supports instrument1 thermograph2)
	(supports instrument1 infrared1)
	(calibration_target instrument1 Star1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon5)
)
(:goal (and
	(pointing satellite0 Star1)
	(pointing satellite1 Phenomenon5)
	(have_image Phenomenon3 image0)
	(have_image Phenomenon4 infrared1)
	(have_image Phenomenon5 infrared1)
	(have_image Planet6 image0)
	(have_image Planet7 infrared1)
))

)
