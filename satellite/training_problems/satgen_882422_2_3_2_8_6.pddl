; params: satgen 882422 2 3 2 8 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	instrument4 - instrument
	infrared0 - mode
	infrared1 - mode
	Star2 - direction
	Star0 - direction
	GroundStation7 - direction
	GroundStation4 - direction
	Star1 - direction
	GroundStation6 - direction
	GroundStation5 - direction
	GroundStation3 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
	Planet10 - direction
	Star11 - direction
	Planet12 - direction
	Planet13 - direction
)
(:init
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star0)
	(supports instrument1 infrared1)
	(calibration_target instrument1 GroundStation4)
	(calibration_target instrument1 GroundStation7)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation3)
	(supports instrument2 infrared0)
	(supports instrument2 infrared1)
	(calibration_target instrument2 Star1)
	(supports instrument3 infrared1)
	(supports instrument3 infrared0)
	(calibration_target instrument3 GroundStation3)
	(calibration_target instrument3 GroundStation6)
	(supports instrument4 infrared1)
	(supports instrument4 infrared0)
	(calibration_target instrument4 GroundStation3)
	(calibration_target instrument4 GroundStation5)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation5)
)
(:goal (and
	(pointing satellite0 GroundStation6)
	(have_image Phenomenon8 infrared1)
	(have_image Phenomenon9 infrared0)
	(have_image Planet10 infrared0)
	(have_image Star11 infrared0)
	(have_image Planet12 infrared0)
	(have_image Planet13 infrared1)
))

)
