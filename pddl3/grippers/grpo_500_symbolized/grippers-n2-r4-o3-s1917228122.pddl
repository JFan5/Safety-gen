(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_02 obj_04 - type_1
obj_01 obj_13 obj_05 obj_03 - type_3
obj_08 obj_07 obj_10 obj_09 - type_2
obj_06 obj_12 obj_11 - object)
(:init
(pred_4 obj_02 obj_07)
(pred_2 obj_02 obj_01)
(pred_2 obj_02 obj_13)
(pred_4 obj_04 obj_10)
(pred_2 obj_04 obj_05)
(pred_2 obj_04 obj_03)
(pred_3 obj_06 obj_09)
(pred_3 obj_12 obj_10)
(pred_3 obj_11 obj_08)
)
(:goal
(and
(pred_3 obj_06 obj_07)
(pred_3 obj_12 obj_09)
(pred_3 obj_11 obj_10)
)
)

(:constraints
  (always (not (pred_4 obj_02 obj_10)))
)
)