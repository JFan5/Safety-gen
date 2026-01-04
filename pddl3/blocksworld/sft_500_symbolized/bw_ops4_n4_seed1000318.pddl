(define (problem BW-rand-4)
(:domain blocksworld)
(:objects obj_01 obj_03 obj_04 obj_02 )
(:init
(pred_2)
(pred_3 obj_01 obj_04)
(pred_3 obj_03 obj_02)
(pred_5 obj_04)
(pred_5 obj_02)
(pred_1 obj_01)
(pred_1 obj_03)
)
(:goal
(and
(pred_3 obj_01 obj_02)
(pred_3 obj_03 obj_04)
(pred_3 obj_02 obj_03))
)

(:constraints
  (sometime-before (pred_3 obj_03 obj_04) (pred_3 obj_01 obj_02))
)
)