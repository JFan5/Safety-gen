(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_05 obj_02 - type_2
obj_09 obj_07 obj_12 obj_04 - type_1
obj_10 obj_03 obj_06 - type_3
obj_01 obj_11 obj_08 - object)
(:init
(pred_2 obj_05 obj_03)
(pred_1 obj_05 obj_09)
(pred_1 obj_05 obj_07)
(pred_2 obj_02 obj_10)
(pred_1 obj_02 obj_12)
(pred_1 obj_02 obj_04)
(pred_3 obj_01 obj_06)
(pred_3 obj_11 obj_03)
(pred_3 obj_08 obj_06)
)
(:goal
(and
(pred_3 obj_01 obj_03)
(pred_3 obj_11 obj_03)
(pred_3 obj_08 obj_06)
)
)

(:constraints
  (always (not (pred_2 obj_05 obj_06)))
)
)