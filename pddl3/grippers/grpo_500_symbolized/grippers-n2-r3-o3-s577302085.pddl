(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_09 obj_12 - type_1
obj_01 obj_02 obj_05 obj_07 - type_3
obj_08 obj_04 obj_06 - type_2
obj_03 obj_11 obj_10 - object)
(:init
(pred_3 obj_09 obj_08)
(pred_4 obj_09 obj_01)
(pred_4 obj_09 obj_02)
(pred_3 obj_12 obj_08)
(pred_4 obj_12 obj_05)
(pred_4 obj_12 obj_07)
(pred_2 obj_03 obj_04)
(pred_2 obj_11 obj_08)
(pred_2 obj_10 obj_04)
)
(:goal
(and
(pred_2 obj_03 obj_04)
(pred_2 obj_11 obj_08)
(pred_2 obj_10 obj_06)
)
)

(:constraints
  (always (not (pred_3 obj_09 obj_06)))
)
)