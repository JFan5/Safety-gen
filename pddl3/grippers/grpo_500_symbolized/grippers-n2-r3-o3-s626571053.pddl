(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_08 obj_04 - type_1
obj_03 obj_09 obj_01 obj_07 - type_3
obj_10 obj_05 obj_06 - type_2
obj_12 obj_02 obj_11 - object)
(:init
(pred_3 obj_08 obj_06)
(pred_4 obj_08 obj_03)
(pred_4 obj_08 obj_09)
(pred_3 obj_04 obj_06)
(pred_4 obj_04 obj_01)
(pred_4 obj_04 obj_07)
(pred_2 obj_12 obj_06)
(pred_2 obj_02 obj_05)
(pred_2 obj_11 obj_06)
)
(:goal
(and
(pred_2 obj_12 obj_06)
(pred_2 obj_02 obj_05)
(pred_2 obj_11 obj_10)
)
)

(:constraints
  (always (not (pred_3 obj_08 obj_10)))
)
)