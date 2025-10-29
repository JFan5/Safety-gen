; params: satgen 8144 2 1 4 7 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared2 - mode
	image3 - mode
	infrared1 - mode
	infrared0 - mode
	Star0 - direction
	Star1 - direction
	Star4 - direction
	GroundStation5 - direction
	GroundStation6 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	Star7 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
	Phenomenon10 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 infrared2)
	(calibration_target instrument0 GroundStation6)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation3)
	(supports instrument1 image3)
	(supports instrument1 infrared1)
	(calibration_target instrument1 GroundStation3)
	(calibration_target instrument1 GroundStation2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star4)
)
(:goal (and
	(have_image Star7 image3)
	(have_image Phenomenon8 infrared2)
	(have_image Phenomenon9 image3)
	(have_image Phenomenon10 infrared0)
))

)
