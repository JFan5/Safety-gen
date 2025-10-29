; params: satgen 750131 2 1 3 8 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph2 - mode
	image1 - mode
	spectrograph0 - mode
	Star0 - direction
	GroundStation3 - direction
	GroundStation5 - direction
	Star6 - direction
	Star2 - direction
	Star4 - direction
	GroundStation7 - direction
	GroundStation1 - direction
	Star8 - direction
	Phenomenon9 - direction
	Phenomenon10 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 image1)
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 Star4)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation7)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 GroundStation1)
	(calibration_target instrument1 GroundStation7)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star4)
)
(:goal (and
	(pointing satellite0 Star4)
	(have_image Star8 image1)
	(have_image Phenomenon9 image1)
	(have_image Phenomenon10 spectrograph2)
))

)
