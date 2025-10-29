; params: satgen 928955 2 3 2 5 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	satellite1 - satellite
	instrument3 - instrument
	instrument4 - instrument
	instrument5 - instrument
	infrared1 - mode
	infrared0 - mode
	GroundStation0 - direction
	GroundStation2 - direction
	GroundStation4 - direction
	Star3 - direction
	Star1 - direction
	Star5 - direction
	Planet6 - direction
	Planet7 - direction
	Star8 - direction
	Phenomenon9 - direction
	Phenomenon10 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 infrared0)
	(calibration_target instrument0 GroundStation4)
	(supports instrument1 infrared0)
	(supports instrument1 infrared1)
	(calibration_target instrument1 Star3)
	(supports instrument2 infrared1)
	(supports instrument2 infrared0)
	(calibration_target instrument2 Star3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation4)
	(supports instrument3 infrared0)
	(calibration_target instrument3 Star1)
	(supports instrument4 infrared1)
	(supports instrument4 infrared0)
	(calibration_target instrument4 Star3)
	(supports instrument5 infrared1)
	(supports instrument5 infrared0)
	(calibration_target instrument5 Star1)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(on_board instrument5 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet6)
)
(:goal (and
	(pointing satellite0 Star1)
	(have_image Star5 infrared1)
	(have_image Planet6 infrared0)
	(have_image Planet7 infrared0)
	(have_image Star8 infrared1)
	(have_image Phenomenon9 infrared0)
	(have_image Phenomenon10 infrared0)
))

)
