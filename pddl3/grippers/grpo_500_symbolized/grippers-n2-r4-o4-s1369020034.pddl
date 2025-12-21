(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_12 - type_1
obj_06 obj_08 obj_03 obj_13 - type_3
obj_02 obj_14 obj_01 obj_07 - type_2
obj_10 obj_05 obj_11 obj_09 - object)
(:init
(pred_4 obj_04 obj_07)
(pred_2 obj_04 obj_06)
(pred_2 obj_04 obj_08)
(pred_4 obj_12 obj_07)
(pred_2 obj_12 obj_03)
(pred_2 obj_12 obj_13)
(pred_3 obj_10 obj_02)
(pred_3 obj_05 obj_01)
(pred_3 obj_11 obj_02)
(pred_3 obj_09 obj_01)
)
(:goal
(and
(pred_3 obj_10 obj_01)
(pred_3 obj_05 obj_02)
(pred_3 obj_11 obj_01)
(pred_3 obj_09 obj_14)
)
)

(:constraints
  (always (not (pred_4 obj_04 obj_01)))
)
)