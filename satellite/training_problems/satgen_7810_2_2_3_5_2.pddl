; params: satgen 7810 2 2 3 5 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	infrared1 - mode
	infrared2 - mode
	thermograph0 - mode
	Star2 - direction
	Star3 - direction
	Star1 - direction
	Star4 - direction
	Star0 - direction
	Phenomenon5 - direction
	Star6 - direction
)
(:init
	(supports instrument0 infrared1)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star0)
	(supports instrument1 thermograph0)
	(supports instrument1 infrared1)
	(supports instrument1 infrared2)
	(calibration_target instrument1 Star4)
	(supports instrument2 thermograph0)
	(supports instrument2 infrared1)
	(supports instrument2 infrared2)
	(calibration_target instrument2 Star0)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star3)
)
(:goal (and
	(pointing satellite1 Star2)
	(have_image Phenomenon5 thermograph0)
	(have_image Star6 infrared1)
))

)
