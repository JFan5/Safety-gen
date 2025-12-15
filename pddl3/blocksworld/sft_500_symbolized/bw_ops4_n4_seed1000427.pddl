(define (problem BW-rand-4)
(:domain blocksworld)
(:objects obj_03 obj_01 obj_02 obj_04 )
(:init
(pred_4)
(pred_1 obj_03 obj_04)
(pred_1 obj_01 obj_03)
(pred_5 obj_02)
(pred_5 obj_04)
(pred_3 obj_01)
(pred_3 obj_02)
)
(:goal
(and
(pred_1 obj_03 obj_01)
(pred_1 obj_01 obj_04)
(pred_1 obj_02 obj_03))
)

(:constraints
  (sometime-before (pred_1 obj_01 obj_04) (pred_1 obj_03 obj_01))
)
)