(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_03 obj_04 - type_2
obj_01 obj_07 obj_02 obj_10 - type_1
obj_09 obj_05 obj_11 - type_3
obj_12 obj_06 obj_08 - object)
(:init
(pred_3 obj_03 obj_05)
(pred_4 obj_03 obj_01)
(pred_4 obj_03 obj_07)
(pred_3 obj_04 obj_09)
(pred_4 obj_04 obj_02)
(pred_4 obj_04 obj_10)
(pred_1 obj_12 obj_09)
(pred_1 obj_06 obj_11)
(pred_1 obj_08 obj_11)
)
(:goal
(and
(pred_1 obj_12 obj_11)
(pred_1 obj_06 obj_11)
(pred_1 obj_08 obj_05)
)
)

(:constraints
  (always (not (pred_3 obj_03 obj_11)))
)
)