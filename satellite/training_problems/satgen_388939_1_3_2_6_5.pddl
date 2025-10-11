; params: satgen 388939 1 3 2 6 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	infrared1 - mode
	thermograph0 - mode
	Star1 - direction
	GroundStation3 - direction
	Star5 - direction
	GroundStation4 - direction
	Star2 - direction
	Star0 - direction
	Star6 - direction
	Star7 - direction
	Planet8 - direction
	Planet9 - direction
	Phenomenon10 - direction
)
(:init
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star2)
	(calibration_target instrument0 GroundStation4)
	(supports instrument1 infrared1)
	(calibration_target instrument1 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon10)
)
(:goal (and
	(have_image Star6 thermograph0)
	(have_image Star7 thermograph0)
	(have_image Planet8 infrared1)
	(have_image Planet9 thermograph0)
	(have_image Phenomenon10 infrared1)
))

)
