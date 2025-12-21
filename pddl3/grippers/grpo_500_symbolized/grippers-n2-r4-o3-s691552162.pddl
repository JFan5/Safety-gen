(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_09 obj_11 - type_1
obj_01 obj_10 obj_13 obj_08 - type_3
obj_12 obj_02 obj_05 obj_07 - type_2
obj_06 obj_03 obj_04 - object)
(:init
(pred_4 obj_09 obj_07)
(pred_2 obj_09 obj_01)
(pred_2 obj_09 obj_10)
(pred_4 obj_11 obj_07)
(pred_2 obj_11 obj_13)
(pred_2 obj_11 obj_08)
(pred_3 obj_06 obj_05)
(pred_3 obj_03 obj_12)
(pred_3 obj_04 obj_05)
)
(:goal
(and
(pred_3 obj_06 obj_05)
(pred_3 obj_03 obj_07)
(pred_3 obj_04 obj_02)
)
)

(:constraints
  (always (not (pred_4 obj_09 obj_05)))
)
)