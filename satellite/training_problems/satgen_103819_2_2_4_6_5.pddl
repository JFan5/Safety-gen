; params: satgen 103819 2 2 4 6 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph0 - mode
	infrared1 - mode
	infrared2 - mode
	image3 - mode
	Star2 - direction
	Star4 - direction
	GroundStation5 - direction
	GroundStation0 - direction
	GroundStation3 - direction
	Star1 - direction
	Star6 - direction
	Phenomenon7 - direction
	Planet8 - direction
	Phenomenon9 - direction
	Planet10 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
	(supports instrument1 image3)
	(supports instrument1 spectrograph0)
	(supports instrument1 infrared1)
	(calibration_target instrument1 Star1)
	(calibration_target instrument1 GroundStation3)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet8)
)
(:goal (and
	(pointing satellite0 Star4)
	(have_image Star6 infrared1)
	(have_image Phenomenon7 infrared1)
	(have_image Planet8 image3)
	(have_image Phenomenon9 infrared1)
	(have_image Planet10 infrared2)
))

)
