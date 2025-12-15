(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_06 - type_1
obj_01 obj_09 obj_04 obj_10 - type_3
obj_11 obj_02 obj_12 obj_13 - type_2
obj_08 obj_07 obj_03 - object)
(:init
(pred_3 obj_05 obj_12)
(pred_4 obj_05 obj_01)
(pred_4 obj_05 obj_09)
(pred_3 obj_06 obj_02)
(pred_4 obj_06 obj_04)
(pred_4 obj_06 obj_10)
(pred_2 obj_08 obj_02)
(pred_2 obj_07 obj_13)
(pred_2 obj_03 obj_02)
)
(:goal
(and
(pred_2 obj_08 obj_02)
(pred_2 obj_07 obj_02)
(pred_2 obj_03 obj_12)
)
)

(:constraints
  (always (not (pred_3 obj_05 obj_13)))
)
)