(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_06 obj_08 - type_1
obj_03 obj_02 obj_05 obj_04 - type_3
obj_10 obj_11 obj_09 - type_2
obj_12 obj_01 obj_07 - object)
(:init
(pred_3 obj_06 obj_10)
(pred_4 obj_06 obj_03)
(pred_4 obj_06 obj_02)
(pred_3 obj_08 obj_11)
(pred_4 obj_08 obj_05)
(pred_4 obj_08 obj_04)
(pred_2 obj_12 obj_11)
(pred_2 obj_01 obj_10)
(pred_2 obj_07 obj_10)
)
(:goal
(and
(pred_2 obj_12 obj_11)
(pred_2 obj_01 obj_09)
(pred_2 obj_07 obj_10)
)
)

(:constraints
  (always (not (pred_3 obj_06 obj_09)))
)
)