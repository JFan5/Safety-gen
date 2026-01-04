(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_05 obj_06 - type_2
obj_11 obj_02 obj_10 obj_01 - type_1
obj_09 obj_07 obj_08 - type_3
obj_12 obj_03 obj_04 - object)
(:init
(pred_3 obj_05 obj_07)
(pred_4 obj_05 obj_11)
(pred_4 obj_05 obj_02)
(pred_3 obj_06 obj_07)
(pred_4 obj_06 obj_10)
(pred_4 obj_06 obj_01)
(pred_1 obj_12 obj_09)
(pred_1 obj_03 obj_07)
(pred_1 obj_04 obj_09)
)
(:goal
(and
(pred_1 obj_12 obj_09)
(pred_1 obj_03 obj_09)
(pred_1 obj_04 obj_08)
)
)

(:constraints
  (always (not (pred_3 obj_05 obj_08)))
)
)