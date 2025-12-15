(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_11 obj_09 - type_2
obj_12 obj_01 obj_07 obj_10 - type_3
obj_03 obj_02 obj_04 obj_13 - type_1
obj_08 obj_05 obj_06 - object)
(:init
(pred_2 obj_11 obj_04)
(pred_3 obj_11 obj_12)
(pred_3 obj_11 obj_01)
(pred_2 obj_09 obj_13)
(pred_3 obj_09 obj_07)
(pred_3 obj_09 obj_10)
(pred_4 obj_08 obj_02)
(pred_4 obj_05 obj_04)
(pred_4 obj_06 obj_13)
)
(:goal
(and
(pred_4 obj_08 obj_02)
(pred_4 obj_05 obj_13)
(pred_4 obj_06 obj_04)
)
)

(:constraints
  (always (not (pred_2 obj_11 obj_13)))
)
)