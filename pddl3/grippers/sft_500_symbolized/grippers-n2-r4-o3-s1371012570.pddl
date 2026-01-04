(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_12 - type_2
obj_03 obj_02 obj_09 obj_01 - type_1
obj_11 obj_06 obj_10 obj_08 - type_3
obj_04 obj_05 obj_07 - object)
(:init
(pred_3 obj_13 obj_08)
(pred_4 obj_13 obj_03)
(pred_4 obj_13 obj_02)
(pred_3 obj_12 obj_10)
(pred_4 obj_12 obj_09)
(pred_4 obj_12 obj_01)
(pred_2 obj_04 obj_11)
(pred_2 obj_05 obj_11)
(pred_2 obj_07 obj_11)
)
(:goal
(and
(pred_2 obj_04 obj_10)
(pred_2 obj_05 obj_11)
(pred_2 obj_07 obj_06)
)
)

(:constraints
  (always (not (pred_3 obj_13 obj_10)))
)
)