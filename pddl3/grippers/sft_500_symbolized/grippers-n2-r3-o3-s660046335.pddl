(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_03 obj_06 - type_1
obj_12 obj_01 obj_04 obj_08 - type_2
obj_02 obj_09 obj_10 - type_3
obj_07 obj_11 obj_05 - object)
(:init
(pred_4 obj_03 obj_02)
(pred_1 obj_03 obj_12)
(pred_1 obj_03 obj_01)
(pred_4 obj_06 obj_02)
(pred_1 obj_06 obj_04)
(pred_1 obj_06 obj_08)
(pred_2 obj_07 obj_09)
(pred_2 obj_11 obj_02)
(pred_2 obj_05 obj_10)
)
(:goal
(and
(pred_2 obj_07 obj_02)
(pred_2 obj_11 obj_02)
(pred_2 obj_05 obj_09)
)
)

(:constraints
  (always (not (pred_4 obj_03 obj_10)))
)
)