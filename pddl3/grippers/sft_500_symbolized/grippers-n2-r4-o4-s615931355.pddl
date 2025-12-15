(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_11 obj_01 - type_3
obj_04 obj_02 obj_08 obj_07 - type_2
obj_12 obj_06 obj_10 obj_03 - type_1
obj_13 obj_09 obj_05 obj_14 - object)
(:init
(pred_4 obj_11 obj_03)
(pred_3 obj_11 obj_04)
(pred_3 obj_11 obj_02)
(pred_4 obj_01 obj_03)
(pred_3 obj_01 obj_08)
(pred_3 obj_01 obj_07)
(pred_2 obj_13 obj_10)
(pred_2 obj_09 obj_06)
(pred_2 obj_05 obj_12)
(pred_2 obj_14 obj_10)
)
(:goal
(and
(pred_2 obj_13 obj_12)
(pred_2 obj_09 obj_12)
(pred_2 obj_05 obj_12)
(pred_2 obj_14 obj_06)
)
)

(:constraints
  (always (not (pred_4 obj_11 obj_10)))
)
)