(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_04 obj_08 - type_1
obj_07 obj_02 obj_09 obj_10 - type_2
obj_11 obj_06 obj_12 - type_3
obj_01 obj_03 obj_05 - object)
(:init
(pred_4 obj_04 obj_11)
(pred_1 obj_04 obj_07)
(pred_1 obj_04 obj_02)
(pred_4 obj_08 obj_11)
(pred_1 obj_08 obj_09)
(pred_1 obj_08 obj_10)
(pred_3 obj_01 obj_11)
(pred_3 obj_03 obj_12)
(pred_3 obj_05 obj_06)
)
(:goal
(and
(pred_3 obj_01 obj_06)
(pred_3 obj_03 obj_06)
(pred_3 obj_05 obj_06)
)
)

(:constraints
  (always (not (pred_4 obj_04 obj_12)))
)
)