(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_03 obj_12 - type_3
obj_04 obj_11 obj_08 obj_06 - type_1
obj_02 obj_07 obj_01 obj_13 - type_2
obj_10 obj_05 obj_09 - object)
(:init
(pred_3 obj_03 obj_01)
(pred_2 obj_03 obj_04)
(pred_2 obj_03 obj_11)
(pred_3 obj_12 obj_13)
(pred_2 obj_12 obj_08)
(pred_2 obj_12 obj_06)
(pred_4 obj_10 obj_07)
(pred_4 obj_05 obj_01)
(pred_4 obj_09 obj_13)
)
(:goal
(and
(pred_4 obj_10 obj_07)
(pred_4 obj_05 obj_02)
(pred_4 obj_09 obj_13)
)
)

(:constraints
  (always (not (pred_3 obj_03 obj_02)))
)
)