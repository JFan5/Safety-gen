; params: satgen 411268 2 1 4 5 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph0 - mode
	thermograph2 - mode
	spectrograph3 - mode
	thermograph1 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	Star2 - direction
	GroundStation4 - direction
	Star3 - direction
	Planet5 - direction
	Star6 - direction
	Phenomenon7 - direction
	Star8 - direction
	Star9 - direction
	Planet10 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 thermograph1)
	(supports instrument0 thermograph2)
	(calibration_target instrument0 Star3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star9)
	(supports instrument1 thermograph2)
	(supports instrument1 spectrograph0)
	(supports instrument1 thermograph1)
	(supports instrument1 spectrograph3)
	(calibration_target instrument1 Star3)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star2)
)
(:goal (and
	(pointing satellite1 Star3)
	(have_image Planet5 thermograph1)
	(have_image Star6 thermograph1)
	(have_image Phenomenon7 thermograph1)
	(have_image Star8 thermograph2)
	(have_image Star9 thermograph1)
	(have_image Planet10 spectrograph0)
))

)
