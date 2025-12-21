(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_05 obj_10 - type_1
obj_03 obj_04 obj_06 obj_13 - type_3
obj_07 obj_02 obj_01 obj_08 - type_2
obj_14 obj_11 obj_09 obj_12 - object)
(:init
(pred_4 obj_05 obj_02)
(pred_2 obj_05 obj_03)
(pred_2 obj_05 obj_04)
(pred_4 obj_10 obj_07)
(pred_2 obj_10 obj_06)
(pred_2 obj_10 obj_13)
(pred_3 obj_14 obj_08)
(pred_3 obj_11 obj_07)
(pred_3 obj_09 obj_08)
(pred_3 obj_12 obj_07)
)
(:goal
(and
(pred_3 obj_14 obj_02)
(pred_3 obj_11 obj_07)
(pred_3 obj_09 obj_01)
(pred_3 obj_12 obj_01)
)
)

(:constraints
  (always (not (pred_4 obj_05 obj_01)))
)
)