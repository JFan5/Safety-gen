; params: satgen 159326 2 1 3 6 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph2 - mode
	spectrograph1 - mode
	spectrograph0 - mode
	Star0 - direction
	GroundStation2 - direction
	Star4 - direction
	Star3 - direction
	Star5 - direction
	GroundStation1 - direction
	Planet6 - direction
	Phenomenon7 - direction
	Star8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 Star5)
	(calibration_target instrument0 Star3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation1)
	(supports instrument1 spectrograph0)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 GroundStation1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star0)
)
(:goal (and
	(pointing satellite0 Star8)
	(have_image Planet6 spectrograph0)
	(have_image Phenomenon7 spectrograph2)
	(have_image Star8 spectrograph1)
	(have_image Star9 spectrograph1)
))

)
