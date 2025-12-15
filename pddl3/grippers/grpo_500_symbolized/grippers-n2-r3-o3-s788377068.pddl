(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_12 obj_07 - type_1
obj_02 obj_06 obj_05 obj_09 - type_3
obj_08 obj_03 obj_04 - type_2
obj_01 obj_11 obj_10 - object)
(:init
(pred_3 obj_12 obj_08)
(pred_4 obj_12 obj_02)
(pred_4 obj_12 obj_06)
(pred_3 obj_07 obj_04)
(pred_4 obj_07 obj_05)
(pred_4 obj_07 obj_09)
(pred_2 obj_01 obj_03)
(pred_2 obj_11 obj_03)
(pred_2 obj_10 obj_03)
)
(:goal
(and
(pred_2 obj_01 obj_03)
(pred_2 obj_11 obj_04)
(pred_2 obj_10 obj_03)
)
)

(:constraints
  (always (not (pred_3 obj_12 obj_04)))
)
)