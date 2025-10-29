; params: satgen 846355 2 2 3 4 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	spectrograph2 - mode
	thermograph0 - mode
	infrared1 - mode
	Star0 - direction
	Star3 - direction
	Star2 - direction
	GroundStation1 - direction
	Phenomenon4 - direction
	Planet5 - direction
	Phenomenon6 - direction
	Star7 - direction
	Star8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 spectrograph2)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star7)
	(supports instrument1 infrared1)
	(calibration_target instrument1 Star2)
	(supports instrument2 spectrograph2)
	(supports instrument2 infrared1)
	(supports instrument2 thermograph0)
	(calibration_target instrument2 GroundStation1)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star3)
)
(:goal (and
	(pointing satellite0 GroundStation1)
	(have_image Phenomenon4 thermograph0)
	(have_image Planet5 thermograph0)
	(have_image Phenomenon6 thermograph0)
	(have_image Star7 thermograph0)
	(have_image Star8 spectrograph2)
	(have_image Phenomenon9 infrared1)
))

)
