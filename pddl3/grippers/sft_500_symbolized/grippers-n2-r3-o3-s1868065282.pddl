(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_01 obj_07 - type_1
obj_03 obj_12 obj_11 obj_10 - type_3
obj_02 obj_04 obj_09 - type_2
obj_08 obj_06 obj_05 - object)
(:init
(pred_4 obj_01 obj_04)
(pred_3 obj_01 obj_03)
(pred_3 obj_01 obj_12)
(pred_4 obj_07 obj_02)
(pred_3 obj_07 obj_11)
(pred_3 obj_07 obj_10)
(pred_2 obj_08 obj_09)
(pred_2 obj_06 obj_04)
(pred_2 obj_05 obj_09)
)
(:goal
(and
(pred_2 obj_08 obj_02)
(pred_2 obj_06 obj_04)
(pred_2 obj_05 obj_02)
)
)

(:constraints
  (always (not (pred_4 obj_01 obj_09)))
)
)