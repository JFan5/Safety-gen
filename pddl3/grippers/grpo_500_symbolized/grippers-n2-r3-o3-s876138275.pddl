(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_11 obj_06 - type_1
obj_03 obj_09 obj_12 obj_04 - type_3
obj_08 obj_02 obj_10 - type_2
obj_07 obj_01 obj_05 - object)
(:init
(pred_4 obj_11 obj_08)
(pred_2 obj_11 obj_03)
(pred_2 obj_11 obj_09)
(pred_4 obj_06 obj_08)
(pred_2 obj_06 obj_12)
(pred_2 obj_06 obj_04)
(pred_3 obj_07 obj_08)
(pred_3 obj_01 obj_10)
(pred_3 obj_05 obj_02)
)
(:goal
(and
(pred_3 obj_07 obj_02)
(pred_3 obj_01 obj_02)
(pred_3 obj_05 obj_02)
)
)

(:constraints
  (always (not (pred_4 obj_11 obj_10)))
)
)