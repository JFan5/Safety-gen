; params: satgen 350603 1 2 3 8 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	image0 - mode
	infrared1 - mode
	infrared2 - mode
	GroundStation0 - direction
	Star1 - direction
	Star3 - direction
	Star4 - direction
	Star6 - direction
	GroundStation2 - direction
	Star5 - direction
	Star7 - direction
	Planet8 - direction
	Phenomenon9 - direction
	Star10 - direction
	Planet11 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 image0)
	(supports instrument0 infrared2)
	(calibration_target instrument0 Star5)
	(calibration_target instrument0 GroundStation2)
	(supports instrument1 infrared1)
	(calibration_target instrument1 Star7)
	(calibration_target instrument1 Star5)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon9)
)
(:goal (and
	(pointing satellite0 Star10)
	(have_image Planet8 infrared1)
	(have_image Phenomenon9 infrared2)
	(have_image Star10 infrared2)
	(have_image Planet11 infrared2)
))

)
