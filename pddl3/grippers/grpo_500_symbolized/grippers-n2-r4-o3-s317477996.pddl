(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_10 obj_12 - type_1
obj_08 obj_03 obj_13 obj_02 - type_3
obj_04 obj_06 obj_07 obj_01 - type_2
obj_05 obj_09 obj_11 - object)
(:init
(pred_4 obj_10 obj_07)
(pred_2 obj_10 obj_08)
(pred_2 obj_10 obj_03)
(pred_4 obj_12 obj_01)
(pred_2 obj_12 obj_13)
(pred_2 obj_12 obj_02)
(pred_3 obj_05 obj_04)
(pred_3 obj_09 obj_04)
(pred_3 obj_11 obj_06)
)
(:goal
(and
(pred_3 obj_05 obj_01)
(pred_3 obj_09 obj_01)
(pred_3 obj_11 obj_06)
)
)

(:constraints
  (always (not (pred_4 obj_10 obj_01)))
)
)