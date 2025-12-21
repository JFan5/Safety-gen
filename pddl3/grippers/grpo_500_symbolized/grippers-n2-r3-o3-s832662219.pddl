(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_11 obj_10 - type_1
obj_02 obj_09 obj_01 obj_04 - type_3
obj_05 obj_07 obj_06 - type_2
obj_12 obj_03 obj_08 - object)
(:init
(pred_4 obj_11 obj_06)
(pred_2 obj_11 obj_02)
(pred_2 obj_11 obj_09)
(pred_4 obj_10 obj_06)
(pred_2 obj_10 obj_01)
(pred_2 obj_10 obj_04)
(pred_3 obj_12 obj_05)
(pred_3 obj_03 obj_05)
(pred_3 obj_08 obj_05)
)
(:goal
(and
(pred_3 obj_12 obj_07)
(pred_3 obj_03 obj_05)
(pred_3 obj_08 obj_06)
)
)

(:constraints
  (always (not (pred_4 obj_11 obj_07)))
)
)