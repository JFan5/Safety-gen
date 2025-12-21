(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_11 obj_10 - type_1
obj_01 obj_06 obj_13 obj_07 - type_2
obj_12 obj_08 obj_04 obj_02 - type_3
obj_09 obj_03 obj_05 - object)
(:init
(pred_1 obj_11 obj_04)
(pred_3 obj_11 obj_01)
(pred_3 obj_11 obj_06)
(pred_1 obj_10 obj_02)
(pred_3 obj_10 obj_13)
(pred_3 obj_10 obj_07)
(pred_2 obj_09 obj_08)
(pred_2 obj_03 obj_04)
(pred_2 obj_05 obj_02)
)
(:goal
(and
(pred_2 obj_09 obj_08)
(pred_2 obj_03 obj_02)
(pred_2 obj_05 obj_04)
)
)

(:constraints
  (always (not (pred_1 obj_11 obj_02)))
)
)