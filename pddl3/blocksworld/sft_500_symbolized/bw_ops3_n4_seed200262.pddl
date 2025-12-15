(define (problem BW-rand-4)
(:domain blocksworld)
(:objects obj_03 obj_04 obj_02 obj_01 )
(:init
(pred_3)
(pred_4 obj_03 obj_01)
(pred_4 obj_04 obj_02)
(pred_1 obj_02)
(pred_4 obj_01 obj_04)
(pred_2 obj_03)
)
(:goal
(and
(pred_4 obj_03 obj_02)
(pred_1 obj_04)
(pred_4 obj_02 obj_01)
(pred_4 obj_01 obj_04))
)

(:constraints
  (sometime-before (pred_1 obj_04) (pred_4 obj_03 obj_02))
)
)