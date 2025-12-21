(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_07 obj_11 - type_1
obj_05 obj_03 obj_02 obj_12 - type_3
obj_08 obj_10 obj_09 - type_2
obj_06 obj_04 obj_01 - object)
(:init
(pred_4 obj_07 obj_08)
(pred_2 obj_07 obj_05)
(pred_2 obj_07 obj_03)
(pred_4 obj_11 obj_08)
(pred_2 obj_11 obj_02)
(pred_2 obj_11 obj_12)
(pred_3 obj_06 obj_10)
(pred_3 obj_04 obj_08)
(pred_3 obj_01 obj_10)
)
(:goal
(and
(pred_3 obj_06 obj_10)
(pred_3 obj_04 obj_08)
(pred_3 obj_01 obj_09)
)
)

(:constraints
  (always (not (pred_4 obj_07 obj_09)))
)
)