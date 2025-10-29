; params: satgen 967674 2 1 3 5 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph2 - mode
	spectrograph0 - mode
	spectrograph1 - mode
	Star0 - direction
	GroundStation1 - direction
	GroundStation3 - direction
	Star2 - direction
	GroundStation4 - direction
	Phenomenon5 - direction
	Star6 - direction
	Phenomenon7 - direction
	Star8 - direction
	Star9 - direction
	Phenomenon10 - direction
)
(:init
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation1)
	(supports instrument1 spectrograph0)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 GroundStation4)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star8)
)
(:goal (and
	(have_image Phenomenon5 spectrograph1)
	(have_image Star6 spectrograph2)
	(have_image Phenomenon7 spectrograph1)
	(have_image Star8 spectrograph0)
	(have_image Star9 spectrograph0)
	(have_image Phenomenon10 spectrograph2)
))

)
