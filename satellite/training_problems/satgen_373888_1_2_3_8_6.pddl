; params: satgen 373888 1 2 3 8 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	image2 - mode
	thermograph0 - mode
	infrared1 - mode
	Star0 - direction
	Star1 - direction
	GroundStation4 - direction
	Star5 - direction
	GroundStation6 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	GroundStation7 - direction
	Planet8 - direction
	Planet9 - direction
	Star10 - direction
	Star11 - direction
	Phenomenon12 - direction
	Star13 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 infrared1)
	(supports instrument0 image2)
	(calibration_target instrument0 GroundStation3)
	(calibration_target instrument0 GroundStation2)
	(supports instrument1 infrared1)
	(calibration_target instrument1 GroundStation7)
	(calibration_target instrument1 GroundStation3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
)
(:goal (and
	(pointing satellite0 GroundStation4)
	(have_image Planet8 infrared1)
	(have_image Planet9 image2)
	(have_image Star10 infrared1)
	(have_image Star11 image2)
	(have_image Phenomenon12 thermograph0)
	(have_image Star13 thermograph0)
))

)
