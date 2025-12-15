(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_01 obj_07 - type_3
obj_08 obj_14 obj_05 obj_10 - type_1
obj_03 obj_04 obj_06 obj_02 - type_2
obj_09 obj_12 obj_13 obj_11 - object)
(:init
(pred_3 obj_01 obj_06)
(pred_4 obj_01 obj_08)
(pred_4 obj_01 obj_14)
(pred_3 obj_07 obj_03)
(pred_4 obj_07 obj_05)
(pred_4 obj_07 obj_10)
(pred_1 obj_09 obj_04)
(pred_1 obj_12 obj_04)
(pred_1 obj_13 obj_02)
(pred_1 obj_11 obj_02)
)
(:goal
(and
(pred_1 obj_09 obj_03)
(pred_1 obj_12 obj_03)
(pred_1 obj_13 obj_06)
(pred_1 obj_11 obj_03)
)
)

(:constraints
  (always (not (pred_3 obj_01 obj_02)))
)
)