(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_05 obj_12 - type_3
obj_02 obj_04 obj_07 obj_14 - type_2
obj_03 obj_10 obj_13 obj_06 - type_1
obj_11 obj_09 obj_08 obj_01 - object)
(:init
(pred_2 obj_05 obj_06)
(pred_1 obj_05 obj_02)
(pred_1 obj_05 obj_04)
(pred_2 obj_12 obj_06)
(pred_1 obj_12 obj_07)
(pred_1 obj_12 obj_14)
(pred_4 obj_11 obj_03)
(pred_4 obj_09 obj_06)
(pred_4 obj_08 obj_06)
(pred_4 obj_01 obj_03)
)
(:goal
(and
(pred_4 obj_11 obj_03)
(pred_4 obj_09 obj_03)
(pred_4 obj_08 obj_03)
(pred_4 obj_01 obj_13)
)
)

(:constraints
  (always (not (pred_2 obj_05 obj_13)))
)
)