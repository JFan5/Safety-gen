(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_07 obj_04 - type_1
obj_11 obj_05 obj_12 obj_01 - type_3
obj_02 obj_09 obj_10 obj_03 - type_2
obj_08 obj_13 obj_06 - object)
(:init
(pred_4 obj_07 obj_09)
(pred_2 obj_07 obj_11)
(pred_2 obj_07 obj_05)
(pred_4 obj_04 obj_03)
(pred_2 obj_04 obj_12)
(pred_2 obj_04 obj_01)
(pred_3 obj_08 obj_03)
(pred_3 obj_13 obj_02)
(pred_3 obj_06 obj_03)
)
(:goal
(and
(pred_3 obj_08 obj_03)
(pred_3 obj_13 obj_10)
(pred_3 obj_06 obj_03)
)
)

(:constraints
  (always (not (pred_4 obj_07 obj_10)))
)
)