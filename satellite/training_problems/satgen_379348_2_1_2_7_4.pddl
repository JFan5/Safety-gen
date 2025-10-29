; params: satgen 379348 2 1 2 7 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph1 - mode
	spectrograph0 - mode
	GroundStation0 - direction
	Star2 - direction
	GroundStation4 - direction
	Star5 - direction
	Star6 - direction
	GroundStation1 - direction
	Star3 - direction
	Phenomenon7 - direction
	Star8 - direction
	Planet9 - direction
	Phenomenon10 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 Star3)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon10)
	(supports instrument1 spectrograph0)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 Star3)
	(calibration_target instrument1 GroundStation1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star8)
)
(:goal (and
	(pointing satellite0 Star8)
	(have_image Phenomenon7 thermograph1)
	(have_image Star8 spectrograph0)
	(have_image Planet9 spectrograph0)
	(have_image Phenomenon10 spectrograph0)
))

)
