(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_12 - type_2
obj_09 obj_03 obj_10 obj_05 - type_1
obj_01 obj_08 obj_11 obj_06 - type_3
obj_04 obj_02 obj_07 - object)
(:init
(pred_2 obj_13 obj_01)
(pred_1 obj_13 obj_09)
(pred_1 obj_13 obj_03)
(pred_2 obj_12 obj_01)
(pred_1 obj_12 obj_10)
(pred_1 obj_12 obj_05)
(pred_3 obj_04 obj_06)
(pred_3 obj_02 obj_11)
(pred_3 obj_07 obj_01)
)
(:goal
(and
(pred_3 obj_04 obj_01)
(pred_3 obj_02 obj_08)
(pred_3 obj_07 obj_11)
)
)

(:constraints
  (always (not (pred_2 obj_13 obj_11)))
)
)