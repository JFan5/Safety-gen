(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_08 obj_09 - type_1
obj_04 obj_03 obj_06 obj_02 - type_2
obj_12 obj_07 obj_13 obj_10 - type_3
obj_01 obj_05 obj_11 obj_14 - object)
(:init
(pred_1 obj_08 obj_07)
(pred_3 obj_08 obj_04)
(pred_3 obj_08 obj_03)
(pred_1 obj_09 obj_07)
(pred_3 obj_09 obj_06)
(pred_3 obj_09 obj_02)
(pred_2 obj_01 obj_07)
(pred_2 obj_05 obj_13)
(pred_2 obj_11 obj_10)
(pred_2 obj_14 obj_12)
)
(:goal
(and
(pred_2 obj_01 obj_07)
(pred_2 obj_05 obj_13)
(pred_2 obj_11 obj_13)
(pred_2 obj_14 obj_07)
)
)

(:constraints
  (always (not (pred_1 obj_08 obj_13)))
)
)