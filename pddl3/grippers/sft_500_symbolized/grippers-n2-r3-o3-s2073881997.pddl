(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_05 obj_07 - type_1
obj_12 obj_02 obj_08 obj_03 - type_2
obj_11 obj_09 obj_10 - type_3
obj_06 obj_04 obj_01 - object)
(:init
(pred_3 obj_05 obj_10)
(pred_4 obj_05 obj_12)
(pred_4 obj_05 obj_02)
(pred_3 obj_07 obj_10)
(pred_4 obj_07 obj_08)
(pred_4 obj_07 obj_03)
(pred_2 obj_06 obj_09)
(pred_2 obj_04 obj_09)
(pred_2 obj_01 obj_09)
)
(:goal
(and
(pred_2 obj_06 obj_11)
(pred_2 obj_04 obj_11)
(pred_2 obj_01 obj_10)
)
)

(:constraints
  (always (not (pred_3 obj_05 obj_09)))
)
)