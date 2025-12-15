(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_12 obj_11 - type_2
obj_08 obj_06 obj_13 obj_05 - type_3
obj_01 obj_02 obj_03 obj_07 - type_1
obj_04 obj_10 obj_09 - object)
(:init
(pred_3 obj_12 obj_01)
(pred_4 obj_12 obj_08)
(pred_4 obj_12 obj_06)
(pred_3 obj_11 obj_01)
(pred_4 obj_11 obj_13)
(pred_4 obj_11 obj_05)
(pred_2 obj_04 obj_07)
(pred_2 obj_10 obj_03)
(pred_2 obj_09 obj_01)
)
(:goal
(and
(pred_2 obj_04 obj_01)
(pred_2 obj_10 obj_02)
(pred_2 obj_09 obj_03)
)
)

(:constraints
  (always (not (pred_3 obj_12 obj_03)))
)
)