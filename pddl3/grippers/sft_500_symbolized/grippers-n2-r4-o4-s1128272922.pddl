(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_06 obj_08 - type_1
obj_03 obj_14 obj_10 obj_12 - type_3
obj_04 obj_01 obj_11 obj_02 - type_2
obj_07 obj_13 obj_05 obj_09 - object)
(:init
(pred_4 obj_06 obj_02)
(pred_3 obj_06 obj_03)
(pred_3 obj_06 obj_14)
(pred_4 obj_08 obj_04)
(pred_3 obj_08 obj_10)
(pred_3 obj_08 obj_12)
(pred_2 obj_07 obj_11)
(pred_2 obj_13 obj_02)
(pred_2 obj_05 obj_11)
(pred_2 obj_09 obj_02)
)
(:goal
(and
(pred_2 obj_07 obj_11)
(pred_2 obj_13 obj_11)
(pred_2 obj_05 obj_04)
(pred_2 obj_09 obj_11)
)
)

(:constraints
  (always (not (pred_4 obj_06 obj_11)))
)
)