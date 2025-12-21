(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_09 obj_13 - type_1
obj_12 obj_11 obj_03 obj_06 - type_3
obj_10 obj_07 obj_08 obj_02 - type_2
obj_05 obj_01 obj_04 obj_14 - object)
(:init
(pred_4 obj_09 obj_07)
(pred_2 obj_09 obj_12)
(pred_2 obj_09 obj_11)
(pred_4 obj_13 obj_07)
(pred_2 obj_13 obj_03)
(pred_2 obj_13 obj_06)
(pred_3 obj_05 obj_07)
(pred_3 obj_01 obj_02)
(pred_3 obj_04 obj_08)
(pred_3 obj_14 obj_02)
)
(:goal
(and
(pred_3 obj_05 obj_08)
(pred_3 obj_01 obj_08)
(pred_3 obj_04 obj_02)
(pred_3 obj_14 obj_02)
)
)

(:constraints
  (always (not (pred_4 obj_09 obj_08)))
)
)