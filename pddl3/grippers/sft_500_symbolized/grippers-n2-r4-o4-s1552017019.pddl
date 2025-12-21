(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_07 obj_11 - type_1
obj_09 obj_05 obj_12 obj_10 - type_2
obj_04 obj_06 obj_02 obj_03 - type_3
obj_14 obj_01 obj_08 obj_13 - object)
(:init
(pred_1 obj_07 obj_04)
(pred_3 obj_07 obj_09)
(pred_3 obj_07 obj_05)
(pred_1 obj_11 obj_04)
(pred_3 obj_11 obj_12)
(pred_3 obj_11 obj_10)
(pred_2 obj_14 obj_04)
(pred_2 obj_01 obj_02)
(pred_2 obj_08 obj_04)
(pred_2 obj_13 obj_03)
)
(:goal
(and
(pred_2 obj_14 obj_03)
(pred_2 obj_01 obj_04)
(pred_2 obj_08 obj_02)
(pred_2 obj_13 obj_03)
)
)

(:constraints
  (always (not (pred_1 obj_07 obj_02)))
)
)