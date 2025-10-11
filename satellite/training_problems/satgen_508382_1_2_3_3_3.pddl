; params: satgen 508382 1 2 3 3 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	image0 - mode
	infrared2 - mode
	infrared1 - mode
	GroundStation0 - direction
	GroundStation2 - direction
	Star1 - direction
	Planet3 - direction
	Planet4 - direction
	Phenomenon5 - direction
)
(:init
	(supports instrument0 infrared2)
	(calibration_target instrument0 GroundStation2)
	(supports instrument1 image0)
	(supports instrument1 infrared1)
	(supports instrument1 infrared2)
	(calibration_target instrument1 Star1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet3)
)
(:goal (and
	(have_image Planet3 infrared2)
	(have_image Planet4 image0)
	(have_image Phenomenon5 infrared1)
))

)
