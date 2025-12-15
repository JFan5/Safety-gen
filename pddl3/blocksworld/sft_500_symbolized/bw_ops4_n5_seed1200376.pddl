(define (problem BW-rand-5)
(:domain blocksworld)
(:objects obj_04 obj_01 obj_02 obj_03 obj_05 )
(:init
(pred_5)
(pred_3 obj_04)
(pred_2 obj_01 obj_04)
(pred_2 obj_02 obj_05)
(pred_3 obj_03)
(pred_3 obj_05)
(pred_1 obj_01)
(pred_1 obj_02)
(pred_1 obj_03)
)
(:goal
(and
(pred_2 obj_04 obj_02)
(pred_2 obj_02 obj_03)
(pred_2 obj_03 obj_05))
)

(:constraints
  (sometime-before (pred_2 obj_02 obj_03) (pred_2 obj_04 obj_02))
)
)